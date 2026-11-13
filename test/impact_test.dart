import 'package:expira/controllers/inventory_controller.dart';
import 'package:expira/models/consumption_record.dart';
import 'package:expira/models/food_item.dart';
import 'package:expira/models/impact_stats.dart';
import 'package:expira/services/consumption_storage.dart';
import 'package:expira/services/item_storage.dart';
import 'package:expira/services/inventory_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

DateTime _day(int offsetFromToday) {
  final now = DateTime.now();
  return DateTime(now.year, now.month, now.day)
      .add(Duration(days: offsetFromToday));
}

ConsumptionRecord _record(
        {required int usedOffset,
        required int expiryOffset,
        bool expiring = false}) =>
    ConsumptionRecord(
      itemName: 'Milk',
      category: 'Fridge',
      expiryDate: _day(expiryOffset),
      usedOn: _day(usedOffset),
      wasExpiringAtUse: expiring,
    );

void main() {
  setUpAll(sqfliteFfiInit);
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await InventoryDatabase.resetForTesting(databaseFactoryFfi);
  });

  group('ConsumptionRecord', () {
    test('using an item on its expiry day counts as before expiry', () {
      expect(_record(usedOffset: 0, expiryOffset: 0).usedBeforeExpiry, isTrue);
    });

    test('using an item after its expiry day does not', () {
      expect(_record(usedOffset: 1, expiryOffset: 0).usedBeforeExpiry, isFalse);
    });

    test('survives a JSON round trip', () {
      final original = _record(usedOffset: 0, expiryOffset: 2, expiring: true);
      final restored = ConsumptionRecord.fromJson(original.toJson());
      expect(restored.itemName, original.itemName);
      expect(restored.expiryDate, original.expiryDate);
      expect(restored.usedOn, original.usedOn);
      expect(restored.wasExpiringAtUse, isTrue);
    });
  });

  group('ImpactStats', () {
    test('empty history yields zeros and a zero rate', () {
      final stats = ImpactStats.fromRecords(const []);
      expect(stats.totalConsumed, 0);
      expect(stats.usedBeforeExpiryRate, 0);
    });

    test('saved-from-expiring only counts in-time uses of expiring items', () {
      final stats = ImpactStats.fromRecords([
        _record(usedOffset: 0, expiryOffset: 1, expiring: true), // saved
        _record(usedOffset: 0, expiryOffset: 5), // in time, not expiring
        _record(usedOffset: 3, expiryOffset: 1, expiring: true), // too late
      ]);

      expect(stats.totalConsumed, 3);
      expect(stats.usedBeforeExpiry, 2);
      expect(stats.savedFromExpiring, 1);
      expect(stats.usedBeforeExpiryRate, closeTo(2 / 3, 1e-9));
    });
  });

  group('InventoryController.markUsed', () {
    test('records consumption and removes the last unit', () async {
      final controller =
          InventoryController(ItemStorage(), ConsumptionStorage());
      await controller.save(FoodItem(
        id: '1',
        name: 'Milk',
        category: 'Fridge',
        expiryDate: _day(5),
      ));

      final record = await controller.markUsed('1');

      expect(record, isNotNull);
      expect(record!.usedBeforeExpiry, isTrue);
      expect(controller.items, isEmpty);
      expect(controller.consumptionRecords.length, 1);
    });

    test('decrements quantity without removing the item', () async {
      final controller =
          InventoryController(ItemStorage(), ConsumptionStorage());
      await controller.save(FoodItem(
        id: '1',
        name: 'Eggs',
        category: 'Fridge',
        expiryDate: _day(5),
        quantity: 3,
      ));

      await controller.markUsed('1');

      expect(controller.items.single.quantity, 2);
      expect(controller.consumptionRecords.length, 1);
    });

    test('unknown id records nothing and emits no event', () async {
      final controller =
          InventoryController(ItemStorage(), ConsumptionStorage());
      final events = <ConsumptionRecord>[];
      final sub = controller.consumptions.listen(events.add);

      final record = await controller.markUsed('missing');
      await Future<void>.delayed(Duration.zero);

      expect(record, isNull);
      expect(events, isEmpty);
      expect(controller.consumptionRecords, isEmpty);
      await sub.cancel();
    });

    test('consumption history survives a restart', () async {
      final first = InventoryController(ItemStorage(), ConsumptionStorage());
      await first.save(FoodItem(
          id: '1', name: 'Milk', category: 'Fridge', expiryDate: _day(5)));
      await first.markUsed('1');

      final restarted =
          InventoryController(ItemStorage(), ConsumptionStorage());
      await restarted.load();

      expect(restarted.consumptionRecords.length, 1);
      expect(restarted.consumptionRecords.single.itemName, 'Milk');
    });
  });
}
