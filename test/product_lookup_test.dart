import 'package:expira/models/catalog_product.dart';
import 'package:expira/services/inventory_database.dart';
import 'package:expira/services/product_lookup_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(sqfliteFfiInit);
  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await InventoryDatabase.resetForTesting(databaseFactoryFfi);
  });

  test('normalizes whitespace and preserves barcode leading zeros', () {
    expect(ProductLookupService.normalize('  0012345678905 '), '0012345678905');
    expect(ProductLookupService.normalize('1234567'), isNull);
  });

  test('a usable local catalog entry avoids all external requests', () async {
    final db = InventoryDatabase.instance;
    final code = ProductLookupService.normalize('012345678905')!;
    final product = CatalogProduct(barcode: code, name: 'Milk', provider: 'Open Facts', lastSuccess: DateTime.now());
    await db.saveProduct(product);
    var requests = 0;
    final service = ProductLookupService(database: db, online: () async => true, client: MockClient((_) async { requests++; throw StateError('network should not be used'); }));
    expect((await service.lookup(code))?.name, 'Milk');
    expect(requests, 0);
  });
}
