import 'package:expira/core/errors/failure.dart';
import 'package:expira/data/mappers/consumption_record_mapper.dart';
import 'package:expira/data/mappers/food_item_mapper.dart';
import 'package:expira/domain/models/food_item.dart';
import 'package:expira/domain/models/outbox_entry.dart';
import 'package:expira/services/inventory_database.dart';

/// Local data source for inventory using SQLite.
class InventoryLocalDataSource {
  InventoryLocalDataSource(this._database);

  final InventoryDatabase _database;

  Future<Result<List<FoodItem>>> loadAll() async {
    try {
      final legacyItems = await _database.loadItems();
      final items = FoodItemMapper.toDomainList(legacyItems);
      // Filter out deleted items (those with deletedAt)
      final activeItems = items.where((item) => item.deletedAt == null).toList();
      return Result.success(activeItems);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to load items', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Stream<Result<List<FoodItem>>> watchAll() async* {
    // For local database, we'll emit the current data and then not emit again
    // Real-time updates will be handled by the repository layer
    final result = await loadAll();
    yield result;
  }

  Future<Result<FoodItem>> save(FoodItem item) async {
    try {
      // Check if item exists to determine create vs update
      final legacyItems = await _database.loadItems();
      final domainItems = FoodItemMapper.toDomainList(legacyItems);
      final isUpdate = domainItems.any((i) => i.id == item.id);
      final operation = isUpdate ? const OutboxOperation.update() : const OutboxOperation.create();

      // Convert to legacy for database
      final legacyItem = FoodItemMapper.toLegacy(item);
      await _database.upsertItemWithOutbox(item: legacyItem, operation: operation);
      return Result.success(item);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to save item', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<void>> delete(String id) async {
    try {
      // Use soft delete with outbox entry
      await _database.softDeleteItemWithOutbox(id);
      return Result.success(null);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to delete item', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<void>> markUsed(String id, {required String usedBy}) async {
    try {
      final legacyItems = await _database.loadItems();
      var items = FoodItemMapper.toDomainList(legacyItems);
      final item = items.firstWhere((i) => i.id == id, orElse: () => throw StateError('Item not found'));

      // Create consumption record
      final record = item.toConsumptionRecord(usedBy: usedBy);
      final legacyRecord = ConsumptionRecordMapper.toLegacy(record);

      // Determine remaining item (null = fully consumed, item with decremented quantity = partial)
      FoodItem? remainingItem;
      if (item.quantity > 1) {
        remainingItem = item.copyWith(quantity: item.quantity - 1);
      }

      // Use outbox-integrated record use
      final legacyRemaining = remainingItem != null ? FoodItemMapper.toLegacy(remainingItem) : null;
      await _database.recordUseWithOutbox(
        itemId: id,
        remainingItem: legacyRemaining,
        record: legacyRecord,
      );
      return Result.success(null);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to mark item as used', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<void>> replaceAll(List<FoodItem> items) async {
    try {
      final legacyItems = FoodItemMapper.toLegacyList(items);
      await _database.replaceAll(items: legacyItems, records: []);
      return Result.success(null);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to replace items', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<FoodItem?>> getById(String id) async {
    try {
      final legacyItems = await _database.loadItems();
      final legacyItem = legacyItems.firstWhere((i) => i.id == id, orElse: () => throw StateError('Not found'));
      return Result.success(FoodItemMapper.toDomain(legacyItem));
    } on StateError {
      return Result.success(null);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to get item', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<List<FoodItem>>> getByBarcode(String barcode) async {
    try {
      final legacyItems = await _database.loadItems();
      final matches = legacyItems.where((i) => i.barcode == barcode).toList();
      return Result.success(FoodItemMapper.toDomainList(matches));
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to get items by barcode', cause: e, stackTrace: stackTrace),
      );
    }
  }
}