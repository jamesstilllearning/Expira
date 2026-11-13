import 'dart:convert';

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
