import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/models/outbox_entry.dart';
import '../models/consumption_record.dart';
import '../models/catalog_product.dart';
import '../models/food_item.dart';
import '../models/storage_location.dart';

/// Local SQLite database for inventory and consumption history.
///
/// The first open imports the previous SharedPreferences JSON lists. The old
/// keys are intentionally retained after a successful import as a recovery
/// copy; the migration marker prevents duplicate imports on later launches.
class InventoryDatabase {
  InventoryDatabase._({DatabaseFactory? factory, String? path})
      : _factory = factory,
        _path = path;

  static InventoryDatabase _shared = InventoryDatabase._();

  /// Shared app database. Tests can replace this with [resetForTesting].
  static InventoryDatabase get instance => _shared;

  static const _dbName = 'expira.db';
  static const _version = 4;
  static const _migrationKey = 'legacy_preferences_import_v1';
  static const _itemsKey = 'expira_items';
  static const _recordsKey = 'expira_consumption_records';
  static const _webDataKey = 'expira_web_database_v1';
  static const _webCatalogKey = 'expira_product_catalog_v1';

  final DatabaseFactory? _factory;
  final String? _path;
  Future<Database>? _database;

  /// Gives unit tests a clean in-memory database without invoking Android.
  static Future<void> resetForTesting(DatabaseFactory factory) async {
    await _shared.close();
    _shared = InventoryDatabase._(factory: factory, path: inMemoryDatabasePath);
  }

  Future<Database> get database => _database ??= _open();

  Future<Database> _open() async {
    final dbPath = _path ?? p.join(await getDatabasesPath(), _dbName);
    final db = await (_factory ?? databaseFactory).openDatabase(
      dbPath,
      options: OpenDatabaseOptions(
        version: _version,
        onCreate: (db, _) async {
          // Create v4 schema directly for new databases
          await db.execute('''
            CREATE TABLE items (
              id TEXT PRIMARY KEY,
              name TEXT NOT NULL,
              category TEXT NOT NULL,
              expiry_date TEXT NOT NULL,
              quantity INTEGER NOT NULL,
              barcode TEXT,
              location TEXT,
              product_id TEXT,
              brand TEXT,
              purchase_date TEXT,
              image_url TEXT,
              notes TEXT,
              sync_status TEXT NOT NULL DEFAULT 'synced',
              version INTEGER NOT NULL DEFAULT 1,
              synced_at TEXT,
              deleted_at TEXT,
              server_id TEXT
            )
          ''');
          await db.execute(
            'CREATE INDEX items_expiry_date_idx ON items(expiry_date)',
          );
          await db.execute('''
            CREATE TABLE consumption_records (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              item_name TEXT NOT NULL,
              category TEXT NOT NULL,
              expiry_date TEXT NOT NULL,
              used_on TEXT NOT NULL,
              was_expiring_at_use INTEGER NOT NULL,
              sync_status TEXT NOT NULL DEFAULT 'synced',
              version INTEGER NOT NULL DEFAULT 1,
              synced_at TEXT,
              server_id TEXT,
              record_id TEXT
            )
          ''');
          await db.execute('''
            CREATE TABLE app_metadata (
              key TEXT PRIMARY KEY,
              value TEXT NOT NULL
            )
          ''');
          await _createCatalog(db);

          // Create outbox table
          await db.execute('''
            CREATE TABLE outbox (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              operation TEXT NOT NULL,
              entity_type TEXT NOT NULL,
              entity_id TEXT NOT NULL,
              payload TEXT NOT NULL,
              expected_version INTEGER NOT NULL,
              created_at TEXT NOT NULL,
              retry_count INTEGER NOT NULL DEFAULT 0,
              last_error TEXT,
              status TEXT NOT NULL DEFAULT 'pending'
            )
          ''');
          await db.execute('CREATE INDEX outbox_status_idx ON outbox(status)');
          await db.execute('CREATE INDEX outbox_entity_idx ON outbox(entity_type, entity_id)');
        },
        onUpgrade: (db, oldVersion, newVersion) async {
          if (oldVersion < 2) {
            await db.execute('ALTER TABLE items ADD COLUMN product_id TEXT');
            await _createCatalog(db);
          }
          if (oldVersion < 3) {
            await db.execute('ALTER TABLE items ADD COLUMN brand TEXT');
            await db.execute('ALTER TABLE items ADD COLUMN purchase_date TEXT');
            await db.execute('ALTER TABLE items ADD COLUMN image_url TEXT');
            await db.execute('ALTER TABLE items ADD COLUMN notes TEXT');
          }
          if (oldVersion < 4) {
            // v3 -> v4: Add sync metadata columns for offline-first sync
            await db.execute('ALTER TABLE items ADD COLUMN sync_status TEXT NOT NULL DEFAULT "synced"');
            await db.execute('ALTER TABLE items ADD COLUMN version INTEGER NOT NULL DEFAULT 1');
            await db.execute('ALTER TABLE items ADD COLUMN synced_at TEXT');
            await db.execute('ALTER TABLE items ADD COLUMN deleted_at TEXT');
            await db.execute('ALTER TABLE items ADD COLUMN server_id TEXT');

            // Backfill defaults for existing rows (SQLite doesn't backfill DEFAULT on ALTER TABLE)
            await db.execute('UPDATE items SET sync_status = "synced" WHERE sync_status IS NULL');
            await db.execute('UPDATE items SET version = 1 WHERE version IS NULL');

            await db.execute('ALTER TABLE consumption_records ADD COLUMN sync_status TEXT NOT NULL DEFAULT "synced"');
            await db.execute('ALTER TABLE consumption_records ADD COLUMN version INTEGER NOT NULL DEFAULT 1');
            await db.execute('ALTER TABLE consumption_records ADD COLUMN synced_at TEXT');
            await db.execute('ALTER TABLE consumption_records ADD COLUMN server_id TEXT');
            await db.execute('ALTER TABLE consumption_records ADD COLUMN record_id TEXT');

            // Backfill defaults for existing rows
            await db.execute('UPDATE consumption_records SET sync_status = "synced" WHERE sync_status IS NULL');
            await db.execute('UPDATE consumption_records SET version = 1 WHERE version IS NULL');

            // Backfill record_id for existing consumption records
            final records = await db.query('consumption_records', columns: ['id', 'item_name', 'used_on']);
            for (final r in records) {
              final recordId = _generateRecordId(r['id'] as int, r['item_name'] as String, r['used_on'] as String);
              await db.update('consumption_records', {'record_id': recordId}, where: 'id = ?', whereArgs: [r['id']]);
            }

            // Create outbox table
            await db.execute('''
              CREATE TABLE outbox (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                operation TEXT NOT NULL,
                entity_type TEXT NOT NULL,
                entity_id TEXT NOT NULL,
                payload TEXT NOT NULL,
                expected_version INTEGER NOT NULL,
                created_at TEXT NOT NULL,
                retry_count INTEGER NOT NULL DEFAULT 0,
                last_error TEXT,
                status TEXT NOT NULL DEFAULT 'pending'
              )
            ''');
            await db.execute('CREATE INDEX outbox_status_idx ON outbox(status)');
            await db.execute('CREATE INDEX outbox_entity_idx ON outbox(entity_type, entity_id)');
          }
        },
      ),
    );
    try {
      await _migrateLegacyPreferences(db);
    } catch (_) {
      await db.close();
      rethrow;
    }
    return db;
  }

  Future<void> _createCatalog(DatabaseExecutor db) async {
    await db.execute('''CREATE TABLE product_catalog (
      barcode TEXT PRIMARY KEY, name TEXT NOT NULL, brand TEXT, category TEXT,
      package_size TEXT, package_unit TEXT, description TEXT, image_url TEXT,
      provider TEXT NOT NULL, provider_id TEXT, last_success TEXT,
      lookup_status TEXT NOT NULL DEFAULT 'success', last_attempt TEXT)''');
  }

  Future<CatalogProduct?> getProduct(String barcode) async {
    if (kIsWeb) {
      final all = await loadProducts();
      for (final product in all) { if (product.barcode == barcode) return product; }
      return null;
    }
    final rows = await (await database).query('product_catalog', where: 'barcode = ?', whereArgs: [barcode], limit: 1);
    return rows.isEmpty ? null : _productFromRow(rows.first);
  }

  Future<List<CatalogProduct>> loadProducts() async {
    if (kIsWeb) {
      final raw = (await SharedPreferences.getInstance()).getString(_webCatalogKey);
      if (raw == null) return [];
      return (jsonDecode(raw) as List).map((e) => CatalogProduct.fromJson(Map<String, dynamic>.from(e as Map))).toList();
    }
    return (await (await database).query('product_catalog')).map(_productFromRow).toList();
  }

  Future<void> saveProduct(CatalogProduct product) async {
    if (kIsWeb) {
      final all = await loadProducts();
      final next = [...all.where((p) => p.barcode != product.barcode), product];
      await (await SharedPreferences.getInstance()).setString(_webCatalogKey, jsonEncode(next.map((p) => p.toJson()).toList()));
      return;
    }
    await (await database).insert('product_catalog', _productToRow(product), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Map<String, Object?> _productToRow(CatalogProduct p) => {'barcode':p.barcode,'name':p.name,'brand':p.brand,'category':p.category,'package_size':p.packageSize,'package_unit':p.packageUnit,'description':p.description,'image_url':p.imageUrl,'provider':p.provider,'provider_id':p.providerId,'last_success':p.lastSuccess?.toIso8601String(),'lookup_status':p.lookupStatus,'last_attempt':p.lastAttempt?.toIso8601String()};
  static CatalogProduct _productFromRow(Map<String, Object?> r) => CatalogProduct(barcode:r['barcode']! as String,name:r['name']! as String,brand:r['brand'] as String?,category:r['category'] as String?,packageSize:r['package_size'] as String?,packageUnit:r['package_unit'] as String?,description:r['description'] as String?,imageUrl:r['image_url'] as String?,provider:r['provider']! as String,providerId:r['provider_id'] as String?,lastSuccess:r['last_success']==null?null:DateTime.tryParse(r['last_success']! as String),lookupStatus:r['lookup_status'] as String? ?? 'success',lastAttempt:r['last_attempt']==null?null:DateTime.tryParse(r['last_attempt']! as String));

  Future<void> _migrateLegacyPreferences(Database db) async {
    final migrated = await db.query(
      'app_metadata',
      columns: ['value'],
      where: 'key = ?',
      whereArgs: [_migrationKey],
      limit: 1,
    );
    if (migrated.isNotEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final rawItems = prefs.getString(_itemsKey);
    final rawRecords = prefs.getString(_recordsKey);
    final legacyItems = _decodeLegacy<FoodItem>(rawItems, FoodItem.fromJson);
    final legacyRecords = _decodeLegacy<ConsumptionRecord>(
      rawRecords,
      ConsumptionRecord.fromJson,
    );

    await db.transaction((txn) async {
      for (final item in legacyItems.values) {
        await txn.insert('items', _itemToRow(item),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      for (final record in legacyRecords.values) {
        await txn.insert('consumption_records', _recordToRow(record));
      }
      final itemCount = Sqflite.firstIntValue(
            await txn.rawQuery('SELECT COUNT(*) FROM items'),
          ) ??
          0;
      final recordCount = Sqflite.firstIntValue(
            await txn.rawQuery('SELECT COUNT(*) FROM consumption_records'),
          ) ??
          0;
      if (itemCount != legacyItems.values.length ||
          recordCount != legacyRecords.values.length) {
        throw StateError('Legacy inventory migration count did not match.');
      }
      await txn.insert('app_metadata', {
        'key': _migrationKey,
        'value': DateTime.now().toUtc().toIso8601String(),
      });
    });

    // Remove only the legacy values that were fully decoded and verified. If
    // malformed data was encountered, retain that raw key for recovery.
    if (!legacyItems.malformed) await prefs.remove(_itemsKey);
    if (!legacyRecords.malformed) await prefs.remove(_recordsKey);
  }

  ({List<T> values, bool malformed}) _decodeLegacy<T>(
    String? raw,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (raw == null) return (values: <T>[], malformed: false);
    var malformed = false;
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List) return (values: <T>[], malformed: true);
      final values = <T>[];
      for (final entry in decoded) {
        if (entry is! Map) {
          malformed = true;
          continue;
        }
        try {
          values.add(fromJson(Map<String, dynamic>.from(entry)));
        } catch (_) {
          // Match the legacy loaders: preserve valid entries and skip malformed
          // rows. The original preference strings remain untouched for recovery.
          malformed = true;
        }
      }
      return (values: values, malformed: malformed);
    } on FormatException {
      // Keep the original raw value in SharedPreferences; do not block startup.
      return (values: <T>[], malformed: true);
    }
  }

  Future<List<FoodItem>> loadItems() async {
    if (kIsWeb) return (await _loadWebData()).items;
    final db = await database;
    final rows = await db.query('items', orderBy: 'rowid ASC');
    return rows.map(_itemFromRow).toList(growable: false);
  }

  Future<void> saveItems(List<FoodItem> items) async {
    if (kIsWeb) {
      final current = await _loadWebData();
      await _saveWebData(items, current.records);
      return;
    }
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete('items');
      final batch = txn.batch();
      for (final item in items) {
        batch.insert('items', _itemToRow(item),
            conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch.commit(noResult: true);
    });
  }

  Future<List<ConsumptionRecord>> loadRecords() async {
    if (kIsWeb) return (await _loadWebData()).records;
    final db = await database;
    final rows = await db.query('consumption_records', orderBy: 'id ASC');
    return rows.map(_recordFromRow).toList(growable: false);
  }

  Future<void> saveRecords(List<ConsumptionRecord> records) async {
    if (kIsWeb) {
      final current = await _loadWebData();
      await _saveWebData(current.items, records);
      return;
    }
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete('consumption_records');
      final batch = txn.batch();
      for (final record in records) {
        batch.insert('consumption_records', _recordToRow(record));
      }
      await batch.commit(noResult: true);
    });
  }

  /// Atomically updates/removes the item and appends its consumption record.
  Future<void> recordUse({
    required String itemId,
    required FoodItem? remainingItem,
    required ConsumptionRecord record,
  }) async {
    if (kIsWeb) {
      final current = await _loadWebData();
      final updatedItems = <FoodItem>[];
      for (final item in current.items) {
        if (item.id != itemId) {
          updatedItems.add(item);
        } else if (remainingItem != null) {
          updatedItems.add(remainingItem);
        }
      }
      await _saveWebData(updatedItems, [...current.records, record]);
      return;
    }
    final db = await database;
    await db.transaction((txn) async {
      if (remainingItem == null) {
        await txn.delete('items', where: 'id = ?', whereArgs: [itemId]);
      } else {
        await txn.update(
          'items',
          _itemToRow(remainingItem),
          where: 'id = ?',
          whereArgs: [itemId],
        );
      }
      await txn.insert('consumption_records', _recordToRow(record));
    });
  }

  /// Replaces both data sets as one operation; used by backup restore.
  Future<void> replaceAll({
    required List<FoodItem> items,
    required List<ConsumptionRecord> records,
  }) async {
    if (kIsWeb) {
      await _saveWebData(items, records);
      return;
    }
    final db = await database;
    await db.transaction((txn) async {
      await txn.delete('items');
      await txn.delete('consumption_records');
      final batch = txn.batch();
      for (final item in items) {
        batch.insert('items', _itemToRow(item));
      }
      for (final record in records) {
        batch.insert('consumption_records', _recordToRow(record));
      }
      await batch.commit(noResult: true);
    });
  }

  /// Upserts a single item with an outbox entry (create or update).
  /// Used for granular mutations that need sync tracking.
  Future<void> upsertItemWithOutbox({
    required FoodItem item,
    required OutboxOperation operation,
  }) async {
    if (kIsWeb) {
      await _upsertItemWithOutboxWeb(item, operation);
      return;
    }
    final db = await database;
    await db.transaction((txn) async {
      // Read current version for optimistic locking
      final current = await txn.query('items', where: 'id = ?', whereArgs: [item.id], limit: 1);
      final currentVersion = current.isEmpty ? 0 : (current.first['version'] as int? ?? 1);
      final newVersion = currentVersion + 1;

      // Upsert item with new version and pending sync status
      // Note: legacy FoodItem doesn't have version/syncStatus/updatedAt - they're stored in DB row
      final itemRow = _itemToRow(item)..['version'] = newVersion..['sync_status'] = 'pending';
      await txn.insert('items', itemRow, conflictAlgorithm: ConflictAlgorithm.replace);

      // Write outbox entry
      final outboxRow = _outboxToRow(
        operation: operation,
        entityType: const OutboxEntityType.item(),
        entityId: item.id,
        payload: jsonEncode(item.toJson()),
        expectedVersion: newVersion,
      );
      await txn.insert('outbox', outboxRow);
    });
  }

  /// Soft deletes an item with an outbox entry.
  Future<void> softDeleteItemWithOutbox(String itemId) async {
    if (kIsWeb) {
      await _softDeleteItemWithOutboxWeb(itemId);
      return;
    }
    final db = await database;
    await db.transaction((txn) async {
      // Read current version
      final current = await txn.query('items', where: 'id = ?', whereArgs: [itemId], limit: 1);
      if (current.isEmpty) return; // Already gone
      final currentVersion = (current.first['version'] as int? ?? 1);
      final newVersion = currentVersion + 1;
      final deletedAt = DateTime.now().toUtc().toIso8601String();

      // Soft delete: set deleted_at, increment version, mark pending
      await txn.update('items', {
        'deleted_at': deletedAt,
        'version': newVersion,
        'sync_status': 'pending',
      }, where: 'id = ?', whereArgs: [itemId]);

      // Write outbox entry
      final outboxRow = _outboxToRow(
        operation: const OutboxOperation.delete(),
        entityType: const OutboxEntityType.item(),
        entityId: itemId,
        payload: jsonEncode({'id': itemId, 'deletedAt': deletedAt, 'version': newVersion}),
        expectedVersion: newVersion,
      );
      await txn.insert('outbox', outboxRow);
    });
  }

  /// Atomically updates/removes the item, appends consumption record, and writes outbox.
  Future<void> recordUseWithOutbox({
    required String itemId,
    required FoodItem? remainingItem,
    required ConsumptionRecord record,
  }) async {
    if (kIsWeb) {
      await _recordUseWithOutboxWeb(itemId: itemId, remainingItem: remainingItem, record: record);
      return;
    }
    final db = await database;
    await db.transaction((txn) async {
      if (remainingItem == null) {
        // Item fully consumed - soft delete
        final current = await txn.query('items', where: 'id = ?', whereArgs: [itemId], limit: 1);
        if (current.isNotEmpty) {
          final currentVersion = (current.first['version'] as int? ?? 1);
          final newVersion = currentVersion + 1;
          final deletedAt = DateTime.now().toUtc().toIso8601String();

          await txn.update('items', {
            'deleted_at': deletedAt,
            'version': newVersion,
            'sync_status': 'pending',
          }, where: 'id = ?', whereArgs: [itemId]);

          // Outbox for item deletion
          final itemOutboxRow = _outboxToRow(
            operation: const OutboxOperation.delete(),
            entityType: const OutboxEntityType.item(),
            entityId: itemId,
            payload: jsonEncode({'id': itemId, 'deletedAt': deletedAt, 'version': newVersion}),
            expectedVersion: newVersion,
          );
          await txn.insert('outbox', itemOutboxRow);
        }
      } else {
        // Item partially consumed - update quantity
        final current = await txn.query('items', where: 'id = ?', whereArgs: [itemId], limit: 1);
        final currentVersion = current.isEmpty ? 0 : (current.first['version'] as int? ?? 1);
        final newVersion = currentVersion + 1;

        final itemRow = _itemToRow(remainingItem)..['version'] = newVersion..['sync_status'] = 'pending';
        await txn.update('items', itemRow, where: 'id = ?', whereArgs: [itemId]);

        // Outbox for item update
        final itemOutboxRow = _outboxToRow(
          operation: const OutboxOperation.update(),
          entityType: const OutboxEntityType.item(),
          entityId: itemId,
          payload: jsonEncode(remainingItem.toJson()),
          expectedVersion: newVersion,
        );
        await txn.insert('outbox', itemOutboxRow);
      }

      // Insert consumption record
      final recordRow = _recordToRow(record);
      await txn.insert('consumption_records', recordRow);

      // Get the auto-generated row ID for deterministic record ID generation
      final recordIdResult = await txn.rawQuery('SELECT last_insert_rowid() as id');
      final recordRowId = recordIdResult.first['id'] as int;
      final deterministicRecordId = _generateRecordId(recordRowId, record.itemName, record.usedOn.toIso8601String());

      // Update the record with the generated record_id
      await txn.update('consumption_records', {'record_id': deterministicRecordId}, where: 'id = ?', whereArgs: [recordRowId]);

      // Outbox for consumption record creation (legacy records have version 1)
      final recordOutboxRow = _outboxToRow(
        operation: const OutboxOperation.markUsed(),
        entityType: const OutboxEntityType.consumption(),
        entityId: deterministicRecordId,
        payload: jsonEncode(record.toJson()),
        expectedVersion: 1,
      );
      await txn.insert('outbox', recordOutboxRow);
    });
  }

  Future<void> close() async {
    final opened = _database;
    _database = null;
    if (opened != null) await (await opened).close();
  }

  /// Browser builds keep inventory and history together in local preferences.
  /// This avoids adding a second SQLite/WASM runtime just for browser testing.
  /// The key is origin-local and separate from Android's SQLite database.
  Future<({List<FoodItem> items, List<ConsumptionRecord> records})>
      _loadWebData() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_webDataKey);
    if (stored != null) {
      final decoded = jsonDecode(stored);
      if (decoded is! Map) {
        throw const FormatException('Browser inventory data is invalid.');
      }

      // Migration: add default sync fields to existing web data (v3 -> v4)
      final itemsJson = decoded['items'] as List? ?? [];
      final recordsJson = decoded['records'] as List? ?? [];

      // Add sync fields to items if missing
      final migratedItems = itemsJson.map((item) {
        if (item is Map && !item.containsKey('syncStatus')) {
          return Map<String, dynamic>.from(item)
            ..addAll({
              'syncStatus': 'synced',
              'version': 1,
              'syncedAt': null,
              'deletedAt': null,
              'serverId': '',
            });
        }
        return item;
      }).toList();

      // Add sync fields to records if missing
      final migratedRecords = recordsJson.map((record) {
        if (record is Map && !record.containsKey('syncStatus')) {
          return Map<String, dynamic>.from(record)
            ..addAll({
              'syncStatus': 'synced',
              'version': 1,
              'syncedAt': null,
              'serverId': '',
              'id': record['id'] ?? _generateRecordId(
                record['rowId'] as int? ?? 0,
                record['itemName'] as String? ?? '',
                record['usedOn'] as String? ?? DateTime.now().toIso8601String(),
              ),
            });
        }
        return record;
      }).toList();

      // Save migrated data back
      if (migratedItems != itemsJson || migratedRecords != recordsJson) {
        await _saveWebData(
          _decodeStoredList(migratedItems, FoodItem.fromJson),
          _decodeStoredList(migratedRecords, ConsumptionRecord.fromJson),
        );
      }

      return (
        items: _decodeStoredList(migratedItems, FoodItem.fromJson),
        records: _decodeStoredList(migratedRecords, ConsumptionRecord.fromJson),
      );
    }

    // If this browser already has the legacy JSON keys, import valid entries
    // once and retain the originals as a recovery copy.
    final legacyItems = _decodeLegacy<FoodItem>(
      prefs.getString(_itemsKey),
      FoodItem.fromJson,
    );
    final legacyRecords = _decodeLegacy<ConsumptionRecord>(
      prefs.getString(_recordsKey),
      ConsumptionRecord.fromJson,
    );
    final items = legacyItems.values;
    final records = legacyRecords.values;
    await _saveWebData(items, records);
    return (items: items, records: records);
  }

  Future<void> _saveWebData(
    List<FoodItem> items,
    List<ConsumptionRecord> records,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = await prefs.setString(
      _webDataKey,
      jsonEncode({
        'items': items.map((item) => item.toJson()).toList(),
        'records': records.map((record) => record.toJson()).toList(),
      }),
    );
    if (!saved) throw StateError('Could not save browser inventory data.');
  }

  List<T> _decodeStoredList<T>(
    Object? raw,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (raw is! List) {
      throw const FormatException('Browser inventory data is invalid.');
    }
    try {
      return raw
          .map((entry) => fromJson(Map<String, dynamic>.from(entry as Map)))
          .toList(growable: false);
    } catch (_) {
      throw const FormatException('Browser inventory data is invalid.');
    }
  }

  /// Generates a deterministic record ID for consumption records.
  /// Uses rowId + itemName + usedOn to create a stable hash.
  static String _generateRecordId(int rowId, String itemName, String usedOn) {
    final input = '$rowId|$itemName|$usedOn';
    int hash = 0;
    for (final codeUnit in input.codeUnits) {
      hash = ((hash << 5) - hash) + codeUnit;
      hash = hash & 0xFFFFFFFF; // 32-bit
    }
    return 'rec_${hash.abs().toRadixString(16).padLeft(8, '0')}';
  }

  static Map<String, Object?> _itemToRow(FoodItem item) => {
        'id': item.id,
        'name': item.name,
        'category': item.category,
        'expiry_date': item.expiryDate.toIso8601String(),
        'quantity': item.quantity,
        'barcode': item.barcode,
        'location': item.location?.name,
        'product_id': item.productId,
        'brand': item.brand,
        'purchase_date': item.purchaseDate?.toIso8601String(),
        'image_url': item.imageUrl,
        'notes': item.notes,
        // Sync columns - use defaults for legacy model
        'sync_status': 'synced',
        'version': 1,
        'synced_at': null,
        'deleted_at': null,
        'server_id': '',
      };

  static FoodItem _itemFromRow(Map<String, Object?> row) => FoodItem(
        id: row['id']! as String,
        name: row['name']! as String,
        category: row['category']! as String,
        expiryDate: DateTime.parse(row['expiry_date']! as String),
        quantity: row['quantity']! as int,
        barcode: row['barcode'] as String?,
        location: StorageLocation.fromKey(row['location'] as String?),
        productId: row['product_id'] as String?,
        brand: row['brand'] as String?,
        purchaseDate: row['purchase_date'] == null
            ? null
            : DateTime.parse(row['purchase_date']! as String),
        imageUrl: row['image_url'] as String?,
        notes: row['notes'] as String?,
        // Sync columns are stored in DB but not in legacy model
        // Domain mapper will handle conversion
      );

  static Map<String, Object?> _recordToRow(ConsumptionRecord record) => {
        'item_name': record.itemName,
        'category': record.category,
        'expiry_date': record.expiryDate.toIso8601String(),
        'used_on': record.usedOn.toIso8601String(),
        'was_expiring_at_use': record.wasExpiringAtUse ? 1 : 0,
        // Sync columns - use defaults for legacy model
        'sync_status': 'synced',
        'version': 1,
        'synced_at': null,
        'server_id': '',
        'record_id': '', // legacy doesn't have id, will be backfilled on migration
      };

  static ConsumptionRecord _recordFromRow(Map<String, Object?> row) =>
      ConsumptionRecord(
        itemName: row['item_name']! as String,
        category: row['category']! as String,
        expiryDate: DateTime.parse(row['expiry_date']! as String),
        usedOn: DateTime.parse(row['used_on']! as String),
        wasExpiringAtUse: row['was_expiring_at_use'] == 1,
        // Sync columns are stored in DB but not in legacy model
      );

  /// Converts outbox entry data to a database row.
  static Map<String, Object?> _outboxToRow({
    required OutboxOperation operation,
    required OutboxEntityType entityType,
    required String entityId,
    required String payload,
    required int expectedVersion,
  }) => {
        'operation': operation.value,
        'entity_type': entityType.value,
        'entity_id': entityId,
        'payload': payload,
        'expected_version': expectedVersion,
        'created_at': DateTime.now().toUtc().toIso8601String(),
        'retry_count': 0,
        'last_error': '',
        'status': const OutboxStatus.pending().value,
      };

  /// Web implementation: upsert item with outbox entry.
  /// Since web uses SharedPreferences, we simulate by just doing the mutation.
  Future<void> _upsertItemWithOutboxWeb(FoodItem item, OutboxOperation operation) async {
    final current = await _loadWebData();
    final updatedItems = <FoodItem>[];
    for (final existing in current.items) {
      if (existing.id != item.id) {
        updatedItems.add(existing);
      }
    }
    updatedItems.add(item);
    await _saveWebData(updatedItems, current.records);
  }

  /// Web implementation: soft delete item with outbox entry.
  Future<void> _softDeleteItemWithOutboxWeb(String itemId) async {
    final current = await _loadWebData();
    final updatedItems = <FoodItem>[];
    for (final existing in current.items) {
      if (existing.id != itemId) {
        updatedItems.add(existing);
      }
    }
    await _saveWebData(updatedItems, current.records);
  }

  /// Web implementation: record use with outbox entry.
  Future<void> _recordUseWithOutboxWeb({
    required String itemId,
    required FoodItem? remainingItem,
    required ConsumptionRecord record,
  }) async {
    final current = await _loadWebData();
    final updatedItems = <FoodItem>[];
    for (final item in current.items) {
      if (item.id != itemId) {
        updatedItems.add(item);
      } else if (remainingItem != null) {
        updatedItems.add(remainingItem);
      }
    }
    await _saveWebData(updatedItems, [...current.records, record]);
  }
}
