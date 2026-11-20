import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:expira/models/food_item.dart';
import 'package:expira/models/consumption_record.dart';
import 'package:expira/models/storage_location.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Initialize ffi for database testing
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group('Database Migration v3 → v4', () {
    late String tempPath;

    setUpAll(() async {
      // Create a temporary directory for test databases
      tempPath = Directory.systemTemp.createTempSync('expira_test_').path;
    });

    tearDownAll(() async {
      try {
        final dir = Directory(tempPath);
        if (dir.existsSync()) dir.deleteSync(recursive: true);
      } catch (_) {}
    });

    /// Creates a v3 database with test data, then upgrades to v4 and verifies.
    Future<void> testMigration({
      required List<FoodItem> items,
      required List<ConsumptionRecord> records,
      required Future<void> Function(Database db) verify,
    }) async {
      final dbPath = '$tempPath/migration_${DateTime.now().millisecondsSinceEpoch}.db';

      // Step 1: Create v3 database with test data
      final v3Db = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 3,
          onCreate: (db, _) async {
            // Recreate v3 schema exactly as in InventoryDatabase._open()
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
            await db.execute('''CREATE TABLE product_catalog (
              barcode TEXT PRIMARY KEY, name TEXT NOT NULL, brand TEXT, category TEXT,
              package_size TEXT, package_unit TEXT, description TEXT, image_url TEXT,
              provider TEXT NOT NULL, provider_id TEXT, last_success TEXT,
              lookup_status TEXT NOT NULL DEFAULT 'success', last_attempt TEXT)''');
          },
        ),
      );

      // Insert test items
      final batch = v3Db.batch();
      for (final item in items) {
        batch.insert('items', {
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
        }, conflictAlgorithm: ConflictAlgorithm.replace);
      }
      for (final record in records) {
        batch.insert('consumption_records', {
          'item_name': record.itemName,
          'category': record.category,
          'expiry_date': record.expiryDate.toIso8601String(),
          'used_on': record.usedOn.toIso8601String(),
          'was_expiring_at_use': record.wasExpiringAtUse ? 1 : 0,
        });
      }
      await batch.commit(noResult: true);
      await v3Db.close();

      // Step 2: Open with v4 (triggers migration)
      final v4Db = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 4,
          onCreate: (db, _) async {
            // This won't run since DB exists
          },
          onUpgrade: (db, oldVersion, newVersion) async {
            // This is the migration we'll implement in InventoryDatabase
            if (oldVersion < 4) {
              // Add sync columns to items
              await db.execute('ALTER TABLE items ADD COLUMN sync_status TEXT NOT NULL DEFAULT "synced"');
              await db.execute('ALTER TABLE items ADD COLUMN version INTEGER NOT NULL DEFAULT 1');
              await db.execute('ALTER TABLE items ADD COLUMN synced_at TEXT');
              await db.execute('ALTER TABLE items ADD COLUMN deleted_at TEXT');
              await db.execute('ALTER TABLE items ADD COLUMN server_id TEXT');

              // Backfill defaults for existing rows (SQLite doesn't backfill DEFAULT on ALTER TABLE)
              await db.execute('UPDATE items SET sync_status = "synced" WHERE sync_status IS NULL');
              await db.execute('UPDATE items SET version = 1 WHERE version IS NULL');

              // Add sync columns to consumption_records
              await db.execute('ALTER TABLE consumption_records ADD COLUMN sync_status TEXT NOT NULL DEFAULT "synced"');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN version INTEGER NOT NULL DEFAULT 1');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN synced_at TEXT');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN server_id TEXT');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN record_id TEXT');

              // Backfill defaults for existing rows
              await db.execute('UPDATE consumption_records SET sync_status = "synced" WHERE sync_status IS NULL');
              await db.execute('UPDATE consumption_records SET version = 1 WHERE version IS NULL');

              // Backfill record_id for existing consumption records
              final recs = await db.query('consumption_records', columns: ['id', 'item_name', 'used_on']);
              for (final r in recs) {
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

      // Step 3: Verify
      await verify(v4Db);
      await v4Db.close();
    }

    test('Migration v3→v4 preserves all existing data', () async {
      // Create 100 test items
      final testItems = <FoodItem>[];
      for (int i = 0; i < 100; i++) {
        testItems.add(FoodItem(
          id: 'item_$i',
          name: 'Test Item $i',
          category: i % 5 == 0 ? 'Dairy' : i % 5 == 1 ? 'Produce' : i % 5 == 2 ? 'Meat' : i % 5 == 3 ? 'Pantry' : 'Frozen',
          expiryDate: DateTime.now().add(Duration(days: i % 30 + 1)),
          quantity: (i % 5) + 1,
          barcode: i % 10 == 0 ? '1234567890$i' : null,
          location: StorageLocation.values[i % StorageLocation.values.length],
          productId: i % 7 == 0 ? 'prod_$i' : null,
          brand: i % 3 == 0 ? 'Brand $i' : null,
          purchaseDate: i % 4 == 0 ? DateTime.now().subtract(Duration(days: i % 10)) : null,
          imageUrl: i % 6 == 0 ? 'https://example.com/img$i.jpg' : null,
          notes: i % 8 == 0 ? 'Note for item $i' : null,
        ));
      }

      // Create 50 test consumption records
      final testRecords = <ConsumptionRecord>[];
      for (int i = 0; i < 50; i++) {
        testRecords.add(ConsumptionRecord(
          itemName: 'Consumed Item $i',
          category: i % 5 == 0 ? 'Dairy' : 'Produce',
          expiryDate: DateTime.now().subtract(Duration(days: i % 20)),
          usedOn: DateTime.now().subtract(Duration(days: i % 15)),
          wasExpiringAtUse: i % 3 == 0,
        ));
      }

      await testMigration(
        items: testItems,
        records: testRecords,
        verify: (db) async {
          final items = await db.query('items');
          final records = await db.query('consumption_records');
          final outbox = await db.query('outbox');
          final catalog = await db.query('product_catalog');

          expect(items.length, 100);
          expect(records.length, 50);
          expect(outbox.length, 0); // Outbox starts empty
          expect(catalog.length, 0); // Catalog starts empty

          // Verify new columns have correct defaults
          for (final item in items) {
            expect(item['sync_status'], 'synced');
            expect(item['version'], 1);
            expect(item['synced_at'], isNull);
            expect(item['deleted_at'], isNull);
            expect(item['server_id'], isNull);
          }

          for (final record in records) {
            expect(record['sync_status'], 'synced');
            expect(record['version'], 1);
            expect(record['synced_at'], isNull);
            expect(record['server_id'], isNull);
            expect(record['record_id'], isNotNull);
            expect((record['record_id'] as String).isNotEmpty, isTrue);
          }

          // Verify original data integrity
          final firstItem = items.firstWhere((i) => i['id'] == 'item_0');
          expect(firstItem['name'], 'Test Item 0');
          expect(firstItem['quantity'], 1);
          expect(firstItem['brand'], 'Brand 0');
        },
      );
    });

    test('Idempotent migration - open twice at v4', () async {
      final dbPath = '$tempPath/idempotent_${DateTime.now().millisecondsSinceEpoch}.db';

      // Step 1: Create v3 database with test data
      final v3Db = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 3,
          onCreate: (db, _) async {
            await db.execute('''
              CREATE TABLE items (
                id TEXT PRIMARY KEY, name TEXT NOT NULL, category TEXT NOT NULL,
                expiry_date TEXT NOT NULL, quantity INTEGER NOT NULL, barcode TEXT,
                location TEXT, product_id TEXT, brand TEXT, purchase_date TEXT,
                image_url TEXT, notes TEXT
              )
            ''');
            await db.execute('''
              CREATE TABLE consumption_records (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                item_name TEXT NOT NULL, category TEXT NOT NULL,
                expiry_date TEXT NOT NULL, used_on TEXT NOT NULL,
                was_expiring_at_use INTEGER NOT NULL
              )
            ''');
            await db.execute('''
              CREATE TABLE app_metadata (key TEXT PRIMARY KEY, value TEXT NOT NULL)
            ''');
            await db.execute('''CREATE TABLE product_catalog (
              barcode TEXT PRIMARY KEY, name TEXT NOT NULL, brand TEXT, category TEXT,
              package_size TEXT, package_unit TEXT, description TEXT, image_url TEXT,
              provider TEXT NOT NULL, provider_id TEXT, last_success TEXT,
              lookup_status TEXT NOT NULL DEFAULT 'success', last_attempt TEXT)''');
          },
        ),
      );

      await v3Db.insert('items', {
        'id': 'test_1', 'name': 'Test', 'category': 'Dairy',
        'expiry_date': DateTime.now().add(const Duration(days: 7)).toIso8601String(), 'quantity': 5,
      });
      await v3Db.insert('consumption_records', {
        'item_name': 'Test', 'category': 'Dairy',
        'expiry_date': DateTime.now().subtract(const Duration(days: 1)).toIso8601String(),
        'used_on': DateTime.now().toIso8601String(), 'was_expiring_at_use': 0,
      });
      await v3Db.close();

      // Step 2: First open at v4 (triggers migration)
      final db1 = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 4,
          onCreate: (db, _) {},
          onUpgrade: (db, oldVersion, newVersion) async {
            if (oldVersion < 4) {
              await db.execute('ALTER TABLE items ADD COLUMN sync_status TEXT NOT NULL DEFAULT "synced"');
              await db.execute('ALTER TABLE items ADD COLUMN version INTEGER NOT NULL DEFAULT 1');
              await db.execute('ALTER TABLE items ADD COLUMN synced_at TEXT');
              await db.execute('ALTER TABLE items ADD COLUMN deleted_at TEXT');
              await db.execute('ALTER TABLE items ADD COLUMN server_id TEXT');
              await db.execute('UPDATE items SET sync_status = "synced" WHERE sync_status IS NULL');
              await db.execute('UPDATE items SET version = 1 WHERE version IS NULL');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN sync_status TEXT NOT NULL DEFAULT "synced"');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN version INTEGER NOT NULL DEFAULT 1');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN synced_at TEXT');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN server_id TEXT');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN record_id TEXT');
              await db.execute('UPDATE consumption_records SET sync_status = "synced" WHERE sync_status IS NULL');
              await db.execute('UPDATE consumption_records SET version = 1 WHERE version IS NULL');
              final records = await db.query('consumption_records', columns: ['id', 'item_name', 'used_on']);
              for (final r in records) {
                final recordId = _generateRecordId(r['id'] as int, r['item_name'] as String, r['used_on'] as String);
                await db.update('consumption_records', {'record_id': recordId}, where: 'id = ?', whereArgs: [r['id']]);
              }
              await db.execute('''
                CREATE TABLE outbox (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  operation TEXT NOT NULL, entity_type TEXT NOT NULL, entity_id TEXT NOT NULL,
                  payload TEXT NOT NULL, expected_version INTEGER NOT NULL,
                  created_at TEXT NOT NULL, retry_count INTEGER NOT NULL DEFAULT 0,
                  last_error TEXT, status TEXT NOT NULL DEFAULT 'pending'
                )
              ''');
              await db.execute('CREATE INDEX outbox_status_idx ON outbox(status)');
              await db.execute('CREATE INDEX outbox_entity_idx ON outbox(entity_type, entity_id)');
            }
          },
        ),
      );

      var items = await db1.query('items');
      expect(items.length, 1);
      expect(items.first['sync_status'], 'synced');
      expect(items.first['version'], 1);
      await db1.close();

      // Step 3: Second open at v4 (should NOT run migration again)
      final db2 = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 4,
          onCreate: (db, _) {},
          onUpgrade: (db, oldVersion, newVersion) async {
            // This should NOT be called since oldVersion == newVersion == 4
            throw StateError('Migration should not run again!');
          },
        ),
      );

      items = await db2.query('items');
      expect(items.length, 1);
      expect(items.first['sync_status'], 'synced');
      expect(items.first['version'], 1);
      await db2.close();
    });

    test('Consumption records get unique record_id on migration', () async {
      final dbPath = '$tempPath/record_id_${DateTime.now().millisecondsSinceEpoch}.db';

      // Step 1: Create v3 database with test data
      final v3Db = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 3,
          onCreate: (db, _) async {
            await db.execute('''
              CREATE TABLE items (
                id TEXT PRIMARY KEY, name TEXT NOT NULL, category TEXT NOT NULL,
                expiry_date TEXT NOT NULL, quantity INTEGER NOT NULL, barcode TEXT,
                location TEXT, product_id TEXT, brand TEXT, purchase_date TEXT,
                image_url TEXT, notes TEXT
              )
            ''');
            await db.execute('''
              CREATE TABLE consumption_records (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                item_name TEXT NOT NULL, category TEXT NOT NULL,
                expiry_date TEXT NOT NULL, used_on TEXT NOT NULL,
                was_expiring_at_use INTEGER NOT NULL
              )
            ''');
            await db.execute('''
              CREATE TABLE app_metadata (key TEXT PRIMARY KEY, value TEXT NOT NULL)
            ''');
            await db.execute('''CREATE TABLE product_catalog (
              barcode TEXT PRIMARY KEY, name TEXT NOT NULL, brand TEXT, category TEXT,
              package_size TEXT, package_unit TEXT, description TEXT, image_url TEXT,
              provider TEXT NOT NULL, provider_id TEXT, last_success TEXT,
              lookup_status TEXT NOT NULL DEFAULT 'success', last_attempt TEXT)''');
          },
        ),
      );

      // Insert multiple records with same item_name and used_on (edge case)
      for (int i = 0; i < 10; i++) {
        await v3Db.insert('consumption_records', {
          'item_name': 'Same Item',
          'category': 'Dairy',
          'expiry_date': DateTime.now().toIso8601String(),
          'used_on': DateTime.now().toIso8601String(),
          'was_expiring_at_use': 0,
        });
      }
      await v3Db.close();

      // Step 2: Open at v4 (triggers migration)
      final db2 = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 4,
          onCreate: (db, _) {},
          onUpgrade: (db, oldVersion, newVersion) async {
            if (oldVersion < 4) {
              await db.execute('ALTER TABLE items ADD COLUMN sync_status TEXT NOT NULL DEFAULT "synced"');
              await db.execute('ALTER TABLE items ADD COLUMN version INTEGER NOT NULL DEFAULT 1');
              await db.execute('ALTER TABLE items ADD COLUMN synced_at TEXT');
              await db.execute('ALTER TABLE items ADD COLUMN deleted_at TEXT');
              await db.execute('ALTER TABLE items ADD COLUMN server_id TEXT');
              await db.execute('UPDATE items SET sync_status = "synced" WHERE sync_status IS NULL');
              await db.execute('UPDATE items SET version = 1 WHERE version IS NULL');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN sync_status TEXT NOT NULL DEFAULT "synced"');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN version INTEGER NOT NULL DEFAULT 1');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN synced_at TEXT');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN server_id TEXT');
              await db.execute('ALTER TABLE consumption_records ADD COLUMN record_id TEXT');
              await db.execute('UPDATE consumption_records SET sync_status = "synced" WHERE sync_status IS NULL');
              await db.execute('UPDATE consumption_records SET version = 1 WHERE version IS NULL');
              final records = await db.query('consumption_records', columns: ['id', 'item_name', 'used_on']);
              for (final r in records) {
                final recordId = _generateRecordId(r['id'] as int, r['item_name'] as String, r['used_on'] as String);
                await db.update('consumption_records', {'record_id': recordId}, where: 'id = ?', whereArgs: [r['id']]);
              }
              await db.execute('''
                CREATE TABLE outbox (
                  id INTEGER PRIMARY KEY AUTOINCREMENT,
                  operation TEXT NOT NULL, entity_type TEXT NOT NULL, entity_id TEXT NOT NULL,
                  payload TEXT NOT NULL, expected_version INTEGER NOT NULL,
                  created_at TEXT NOT NULL, retry_count INTEGER NOT NULL DEFAULT 0,
                  last_error TEXT, status TEXT NOT NULL DEFAULT 'pending'
                )
              ''');
              await db.execute('CREATE INDEX outbox_status_idx ON outbox(status)');
              await db.execute('CREATE INDEX outbox_entity_idx ON outbox(entity_type, entity_id)');
            }
          },
        ),
      );

      // Verify all have unique record_ids
      final records = await db2.query('consumption_records');
      expect(records.length, 10);

      final recordIds = records.map((r) => r['record_id'] as String).toSet();
      expect(recordIds.length, 10); // All unique

      for (final id in recordIds) {
        expect(id.isNotEmpty, isTrue);
      }

      await db2.close();
    });
  });
}

// Helper function matching the implementation
String _generateRecordId(int rowId, String itemName, String usedOn) {
  // Deterministic ID: hash of rowId + itemName + usedOn
  final input = '$rowId|$itemName|$usedOn';
  int hash = 0;
  for (final codeUnit in input.codeUnits) {
    hash = ((hash << 5) - hash) + codeUnit;
    hash = hash & 0xFFFFFFFF; // 32-bit
  }
  return 'rec_${hash.abs().toRadixString(16).padLeft(8, '0')}';
}