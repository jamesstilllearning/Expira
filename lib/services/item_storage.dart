import '../models/food_item.dart';
import 'inventory_database.dart';

/// Inventory repository backed by the local SQLite database.
class ItemStorage {
  ItemStorage({InventoryDatabase? database})
      : database = database ?? InventoryDatabase.instance;

  final InventoryDatabase database;

  Future<List<FoodItem>> load() => database.loadItems();

  Future<void> save(List<FoodItem> items) => database.saveItems(items);
}
