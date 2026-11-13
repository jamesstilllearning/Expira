import '../models/consumption_record.dart';
import 'inventory_database.dart';

/// Consumption history repository backed by the local SQLite database.
class ConsumptionStorage {
  ConsumptionStorage({InventoryDatabase? database})
      : database = database ?? InventoryDatabase.instance;

  final InventoryDatabase database;

  Future<List<ConsumptionRecord>> load() => database.loadRecords();

  Future<void> save(List<ConsumptionRecord> records) =>
      database.saveRecords(records);
}
