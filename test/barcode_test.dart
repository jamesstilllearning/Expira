import 'package:expira/controllers/inventory_controller.dart';
import 'package:expira/models/food_item.dart';
import 'package:expira/services/barcode_scan_session.dart';
import 'package:expira/services/consumption_storage.dart';
import 'package:expira/services/item_storage.dart';
import 'package:expira/services/inventory_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(sqfliteFfiInit);
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await InventoryDatabase.resetForTesting(databaseFactoryFfi);
  });

  group('BarcodeScanSession', () {
    test('accepts the first valid read and trims whitespace', () {
      final session = BarcodeScanSession();
      expect(session.accept('  8901234567890 '), '8901234567890');
      expect(session.isLocked, isTrue);
    });

    test('ignores repeated reads of the same barcode while locked', () {
      final session = BarcodeScanSession();
      session.accept('8901234567890');

      for (var i = 0; i < 20; i++) {
        expect(session.accept('8901234567890'), isNull);
      }
    });

    test('accepts a new scan only after an explicit reset', () {
      final session = BarcodeScanSession();
      session.accept('111');
      session.reset();

      expect(session.accept('222'), '222');
    });

    test(
        'rejects empty, null, oversized, and non-printable values without locking',
        () {
      final session = BarcodeScanSession();

      expect(session.accept(null), isNull);
      expect(session.accept('   '), isNull);
      expect(session.accept('x' * (BarcodeScanSession.maxLength + 1)), isNull);
      expect(session.accept('bad\u0007code'), isNull);
      expect(session.isLocked, isFalse);
    });
  });

  group('barcode persistence', () {
    final expiry = DateTime(2100, 1, 15);

    test('barcode survives a JSON round trip', () {
      final item = FoodItem(
        id: '1',
        name: 'Milk',
        category: 'Fridge',
        expiryDate: expiry,
        barcode: '8901234567890',
      );
      expect(FoodItem.fromJson(item.toJson()).barcode, '8901234567890');
    });

    test('items saved before barcodes existed load with a null barcode', () {
      final legacy = FoodItem.fromJson({
        'id': '1',
        'name': 'Rice',
        'category': 'Pantry',
        'expiryDate': expiry.toIso8601String(),
        'quantity': 1,
      });
      expect(legacy.barcode, isNull);
    });

    test('barcode is kept after a restart', () async {
      final first = InventoryController(ItemStorage(), ConsumptionStorage());
      await first.save(FoodItem(
        id: '1',
        name: 'Milk',
        category: 'Fridge',
        expiryDate: expiry,
        barcode: '8901234567890',
      ));

      final restarted =
          InventoryController(ItemStorage(), ConsumptionStorage());
      await restarted.load();

      expect(restarted.items.single.barcode, '8901234567890');
    });
  });
}
