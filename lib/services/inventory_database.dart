import 'dart:convert';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path/path.dart' as p;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

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
  static const _version = 3;
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
              notes TEXT
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
              was_expiring_at_use INTEGER NOT NULL
            )
          ''');
          await db.execute('''
            CREATE TABLE app_metadata (
              key TEXT PRIMARY KEY,
              value TEXT NOT NULL
            )
          ''');
          await _createCatalog(db);
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
      return (
        items: _decodeStoredList(decoded['items'], FoodItem.fromJson),
        records: _decodeStoredList(
          decoded['records'],
          ConsumptionRecord.fromJson,
        ),
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
      );

  static Map<String, Object?> _recordToRow(ConsumptionRecord record) => {
        'item_name': record.itemName,
        'category': record.category,
        'expiry_date': record.expiryDate.toIso8601String(),
        'used_on': record.usedOn.toIso8601String(),
        'was_expiring_at_use': record.wasExpiringAtUse ? 1 : 0,
      };

  static ConsumptionRecord _recordFromRow(Map<String, Object?> row) =>
      ConsumptionRecord(
        itemName: row['item_name']! as String,
        category: row['category']! as String,
        expiryDate: DateTime.parse(row['expiry_date']! as String),
        usedOn: DateTime.parse(row['used_on']! as String),
        wasExpiringAtUse: row['was_expiring_at_use'] == 1,
      );
}
