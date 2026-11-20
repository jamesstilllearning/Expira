import 'dart:convert';

import 'package:expira/domain/models/outbox_entry.dart';
import 'package:expira/models/consumption_record.dart';
import 'package:expira/models/food_item.dart';
import 'package:expira/services/backup_service.dart';
import 'package:expira/services/consumption_storage.dart';
import 'package:expira/services/inventory_database.dart';
import 'package:expira/services/item_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(sqfliteFfiInit);
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await InventoryDatabase.resetForTesting(databaseFactoryFfi);
  });

  group('Outbox-integrated mutations', () {
    test('upsertItemWithOutbox creates item and outbox entry', () async {
      final db = InventoryDatabase.instance;
      final item = FoodItem(
        id: 'test-1',
        name: 'Test Milk',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        quantity: 2,
      );

      await db.upsertItemWithOutbox(item: item, operation: OutboxOperation.create());

      // Verify item was saved
      final items = await db.loadItems();
      expect(items.length, 1);
      expect(items.first.name, 'Test Milk');

      // Verify outbox entry was created
      final outboxEntries = await _getOutboxEntries(db);
      expect(outboxEntries.length, 1);
      expect(outboxEntries.first.operation, OutboxOperation.create());
      expect(outboxEntries.first.entityType, OutboxEntityType.item());
      expect(outboxEntries.first.entityId, 'test-1');
      expect(outboxEntries.first.status, OutboxStatus.pending());
      expect(outboxEntries.first.expectedVersion, 1);
    });

    test('upsertItemWithOutbox updates item and creates outbox entry', () async {
      final db = InventoryDatabase.instance;
      final item = FoodItem(
        id: 'test-2',
        name: 'Test Milk',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        quantity: 2,
      );

      // Create initial item
      await db.upsertItemWithOutbox(item: item, operation: OutboxOperation.create());

      // Update the item
      final updatedItem = FoodItem(
        id: 'test-2',
        name: 'Test Milk Updated',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        quantity: 3,
      );
      await db.upsertItemWithOutbox(item: updatedItem, operation: OutboxOperation.update());

      // Verify item was updated
      final items = await db.loadItems();
      expect(items.length, 1);
      expect(items.first.name, 'Test Milk Updated');
      expect(items.first.quantity, 3);

      // Verify two outbox entries (create + update)
      final outboxEntries = await _getOutboxEntries(db);
      expect(outboxEntries.length, 2);
      expect(outboxEntries[0].operation, OutboxOperation.create());
      expect(outboxEntries[1].operation, OutboxOperation.update());
      expect(outboxEntries[1].expectedVersion, 2);
    });

    test('softDeleteItemWithOutbox soft deletes item and creates outbox entry', () async {
      final db = InventoryDatabase.instance;
      final item = FoodItem(
        id: 'test-3',
        name: 'Test Milk',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        quantity: 2,
      );

      await db.upsertItemWithOutbox(item: item, operation: OutboxOperation.create());
      await db.softDeleteItemWithOutbox('test-3');

      // Verify item is soft deleted (deleted_at set in database)
      final rawItems = await (await db.database).query('items', where: 'id = ?', whereArgs: ['test-3']);
      expect(rawItems.isNotEmpty, isTrue);
      expect(rawItems.first['deleted_at'], isNotNull);
      expect(rawItems.first['sync_status'], 'pending');

      // Verify outbox entry for delete
      final outboxEntries = await _getOutboxEntries(db);
      expect(outboxEntries.length, 2);
      expect(outboxEntries[1].operation, OutboxOperation.delete());
      expect(outboxEntries[1].entityType, OutboxEntityType.item());
      expect(outboxEntries[1].entityId, 'test-3');
      expect(outboxEntries[1].expectedVersion, 2);
    });

    test('recordUseWithOutbox fully consumes item', () async {
      final db = InventoryDatabase.instance;
      final item = FoodItem(
        id: 'test-4',
        name: 'Test Milk',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        quantity: 1,
      );
      final record = ConsumptionRecord(
        itemName: 'Test Milk',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        usedOn: DateTime(2030, 2, 8),
        wasExpiringAtUse: true,
      );

      await db.upsertItemWithOutbox(item: item, operation: OutboxOperation.create());
      await db.recordUseWithOutbox(itemId: 'test-4', remainingItem: null, record: record);

      // Verify item is soft deleted (deleted_at set in database)
      final rawItems = await (await db.database).query('items', where: 'id = ?', whereArgs: ['test-4']);
      expect(rawItems.isNotEmpty, isTrue);
      expect(rawItems.first['deleted_at'], isNotNull);
      expect(rawItems.first['sync_status'], 'pending');

      // Verify consumption record was created
      final records = await db.loadRecords();
      expect(records.length, 1);
      expect(records.first.itemName, 'Test Milk');

      // Verify outbox entries: create item + delete item + create consumption record
      final outboxEntries = await _getOutboxEntries(db);
      expect(outboxEntries.length, 3);
      expect(outboxEntries[0].operation, OutboxOperation.create());
      expect(outboxEntries[1].operation, OutboxOperation.delete());
      expect(outboxEntries[2].operation, OutboxOperation.markUsed());
      expect(outboxEntries[2].entityType, OutboxEntityType.consumption());
    });

    test('recordUseWithOutbox partially consumes item', () async {
      final db = InventoryDatabase.instance;
      final item = FoodItem(
        id: 'test-5',
        name: 'Test Milk',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        quantity: 3,
      );
      final record = ConsumptionRecord(
        itemName: 'Test Milk',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        usedOn: DateTime(2030, 2, 8),
        wasExpiringAtUse: true,
      );

      await db.upsertItemWithOutbox(item: item, operation: OutboxOperation.create());

      // Partially consume (quantity 3 -> 2)
      final remainingItem = FoodItem(
        id: 'test-5',
        name: 'Test Milk',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        quantity: 2,
      );
      await db.recordUseWithOutbox(itemId: 'test-5', remainingItem: remainingItem, record: record);

      // Verify item quantity was updated
      final items = await db.loadItems();
      expect(items.length, 1);
      expect(items.first.quantity, 2);

      // Verify consumption record was created
      final records = await db.loadRecords();
      expect(records.length, 1);

      // Verify outbox entries: create item + update item + create consumption record
      final outboxEntries = await _getOutboxEntries(db);
      expect(outboxEntries.length, 3);
      expect(outboxEntries[0].operation, OutboxOperation.create());
      expect(outboxEntries[1].operation, OutboxOperation.update());
      expect(outboxEntries[1].expectedVersion, 2);
      expect(outboxEntries[2].operation, OutboxOperation.markUsed());
    });

    test('atomic transaction: outbox entries rollback on failure', () async {
      final db = InventoryDatabase.instance;
      final item = FoodItem(
        id: 'test-6',
        name: 'Test Milk',
        category: 'Fridge',
        expiryDate: DateTime(2030, 2, 10),
        quantity: 1,
      );

      await db.upsertItemWithOutbox(item: item, operation: OutboxOperation.create());

      // Verify initial state
      var outboxEntries = await _getOutboxEntries(db);
      expect(outboxEntries.length, 1);

      // Try to soft delete a non-existent item - should not create outbox entry
      await db.softDeleteItemWithOutbox('non-existent');

      // Verify no additional outbox entry was created
      outboxEntries = await _getOutboxEntries(db);
      expect(outboxEntries.length, 1);
    });
  });

  test('imports legacy items and history once and clears verified legacy keys',
      () async {
    final expiry = DateTime(2030, 2, 10).toIso8601String();
    SharedPreferences.setMockInitialValues({
      'expira_items': jsonEncode([
        {
          'id': 'legacy-1',
          'name': 'Milk',
          'category': 'Fridge',
          'expiryDate': expiry,
          'quantity': 2,
          'barcode': '123456',
          'location': 'fridge',
        },
      ]),
      'expira_consumption_records': jsonEncode([
        {
          'itemName': 'Bread',
          'category': 'Pantry',
          'expiryDate': expiry,
          'usedOn': DateTime(2030, 2, 9).toIso8601String(),
          'wasExpiringAtUse': true,
        },
      ]),
    });

    final items = ItemStorage();
    final records = ConsumptionStorage();
    expect((await items.load()).single.name, 'Milk');
    expect((await records.load()).single.itemName, 'Bread');
    await items.load();
    expect((await records.load()), hasLength(1));

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('expira_items'), isNull);
    expect(prefs.getString('expira_consumption_records'), isNull);
  });

  test('retains malformed legacy JSON for recovery', () async {
    const raw = '[{"id":"broken"}, 7]';
    SharedPreferences.setMockInitialValues({'expira_items': raw});

    expect(await ItemStorage().load(), isEmpty);

    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('expira_items'), raw);
  });

  test('item use updates inventory and history in one database transaction',
      () async {
    final item = FoodItem(
      id: 'milk',
      name: 'Milk',
      category: 'Fridge',
      expiryDate: DateTime(2030, 2, 10),
      quantity: 2,
    );
    final record = ConsumptionRecord(
      itemName: 'Milk',
      category: 'Fridge',
      expiryDate: item.expiryDate,
      usedOn: DateTime(2030, 2, 8),
      wasExpiringAtUse: true,
    );
    final items = ItemStorage();
    final db = items.database;
    await items.save([item]);

    await db.recordUse(
      itemId: item.id,
      remainingItem: item.copyWith(quantity: 1),
      record: record,
    );

    expect((await items.load()).single.quantity, 1);
    expect((await ConsumptionStorage().load()).single.itemName, 'Milk');
  });

  test('backup restore replaces inventory and history together', () async {
    final storage = ItemStorage();
    final backup = BackupService(items: storage, records: ConsumptionStorage());
    await storage.save([
      FoodItem(
        id: 'current',
        name: 'Current item',
        category: 'Other',
        expiryDate: DateTime(2030, 2, 10),
      ),
    ]);
    final snapshot = backup.decodeBackup(jsonEncode({
      'format': BackupService.formatName,
      'version': BackupService.formatVersion,
      'exportedAt': DateTime.utc(2030).toIso8601String(),
      'items': [
        FoodItem(
          id: 'restored',
          name: 'Restored item',
          category: 'Pantry',
          expiryDate: DateTime(2030, 3, 1),
        ).toJson(),
      ],
      'consumptionRecords': <Map<String, dynamic>>[],
    }));

    await storage.database.replaceAll(
      items: snapshot.items,
      records: snapshot.records,
    );

    expect((await storage.load()).map((item) => item.id), ['restored']);
    expect(await ConsumptionStorage().load(), isEmpty);
  });

  test('backup parser rejects duplicate IDs and unknown versions', () async {
    final service = BackupService(
      items: ItemStorage(),
      records: ConsumptionStorage(),
    );
    final item = FoodItem(
      id: 'duplicate',
      name: 'Item',
      category: 'Other',
      expiryDate: DateTime(2030, 2, 10),
    ).toJson();

    expect(
      () => service.decodeBackup(jsonEncode({
        'format': BackupService.formatName,
        'version': BackupService.formatVersion,
        'items': [item, item],
        'consumptionRecords': [],
      })),
      throwsFormatException,
    );
    expect(
      () => service.decodeBackup(jsonEncode({
        'format': BackupService.formatName,
        'version': 999,
        'items': [],
        'consumptionRecords': [],
      })),
      throwsFormatException,
    );
  });
}

/// Helper to get outbox entries from the database for testing
Future<List<OutboxEntry>> _getOutboxEntries(InventoryDatabase db) async {
  final database = await db.database;
  final rows = await database.query('outbox', orderBy: 'created_at ASC');
  return rows.map((row) => OutboxEntry(
    id: row['id']! as int,
    operation: OutboxOperation.fromString(row['operation'] as String? ?? 'create'),
    entityType: OutboxEntityType.fromString(row['entity_type'] as String? ?? 'item'),
    entityId: row['entity_id']! as String,
    payload: row['payload']! as String,
    expectedVersion: row['expected_version'] as int? ?? 1,
    createdAt: DateTime.parse(row['created_at']! as String).toUtc(),
    retryCount: row['retry_count'] as int? ?? 0,
    lastError: row['last_error'] as String? ?? '',
    status: OutboxStatus.fromString(row['status'] as String? ?? 'pending'),
  )).toList();
}
