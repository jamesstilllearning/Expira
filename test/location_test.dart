import 'package:expira/controllers/inventory_controller.dart';
import 'package:expira/models/food_item.dart';
import 'package:expira/models/location_groups.dart';
import 'package:expira/models/storage_location.dart';
import 'package:expira/services/consumption_storage.dart';
import 'package:expira/services/item_storage.dart';
import 'package:expira/services/inventory_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

final _expiry = DateTime(2100, 1, 15);

FoodItem _item(String id, {StorageLocation? location, int quantity = 1}) =>
    FoodItem(
      id: id,
      name: 'Item $id',
      category: 'Other',
      expiryDate: _expiry,
      quantity: quantity,
      location: location,
    );

void main() {
  setUpAll(sqfliteFfiInit);
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await InventoryDatabase.resetForTesting(databaseFactoryFfi);
  });

  group('location model', () {
    test('location survives a JSON round trip', () {
      final restored = FoodItem.fromJson(
          _item('1', location: StorageLocation.freezer).toJson());
      expect(restored.location, StorageLocation.freezer);
    });

    test('items saved before locations existed load with no location', () {
      final legacy = FoodItem.fromJson({
        'id': '1',
        'name': 'Rice',
        'category': 'Pantry',
        'expiryDate': _expiry.toIso8601String(),
        'quantity': 1,
      });
      expect(legacy.location, isNull);
    });

    test('an unknown stored location key loads as no location', () {
      expect(StorageLocation.fromKey('garage'), isNull);
      expect(StorageLocation.fromKey(null), isNull);
    });
  });

  group('groupByLocation', () {
    test('groups follow location order with unassigned items last', () {
      final groups = groupByLocation([
        _item('a'),
        _item('b', location: StorageLocation.freezer),
        _item('c', location: StorageLocation.fridge),
        _item('d', location: StorageLocation.freezer),
      ]);

      expect(groups.map((g) => g.location), [
        StorageLocation.fridge,
        StorageLocation.freezer,
        null,
      ]);
      expect(groups[1].items.map((i) => i.id), ['b', 'd']);
      expect(groups.last.title, 'No location');
    });

    test('keeps the incoming order inside each group', () {
      final groups = groupByLocation([
        _item('z', location: StorageLocation.pantry),
        _item('a', location: StorageLocation.pantry),
      ]);
      expect(groups.single.items.map((i) => i.id), ['z', 'a']);
    });

    test('empty input produces no groups', () {
      expect(groupByLocation(const []), isEmpty);
    });
  });

  group('location persistence through the controller', () {
    test('location is kept after a restart', () async {
      final first = InventoryController(ItemStorage(), ConsumptionStorage());
      await first.save(_item('1', location: StorageLocation.pantry));

      final restarted =
          InventoryController(ItemStorage(), ConsumptionStorage());
      await restarted.load();

      expect(restarted.items.single.location, StorageLocation.pantry);
    });

    test('moving an item updates its location without creating a new item',
        () async {
      final controller =
          InventoryController(ItemStorage(), ConsumptionStorage());
      await controller.save(_item('1', location: StorageLocation.fridge));
      await controller.save(_item('1', location: StorageLocation.freezer));

      expect(controller.items.length, 1);
      expect(controller.items.single.id, '1');
      expect(controller.items.single.location, StorageLocation.freezer);
    });

    test('grouped view updates after an item is deleted', () async {
      final controller =
          InventoryController(ItemStorage(), ConsumptionStorage());
      await controller.save(_item('1', location: StorageLocation.freezer));
      await controller.save(_item('2', location: StorageLocation.pantry));
      expect(groupByLocation(controller.items).length, 2);

      await controller.delete('1');

      final groups = groupByLocation(controller.items);
      expect(groups.map((g) => g.location), [StorageLocation.pantry]);
    });

    test('using one unit of a multi-quantity item keeps its location',
        () async {
      final controller =
          InventoryController(ItemStorage(), ConsumptionStorage());
      await controller
          .save(_item('1', location: StorageLocation.fridge, quantity: 2));

      await controller.markUsed('1');

      expect(controller.items.single.quantity, 1);
      expect(controller.items.single.location, StorageLocation.fridge);
    });
  });
}
