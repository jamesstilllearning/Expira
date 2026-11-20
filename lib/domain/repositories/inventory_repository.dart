import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';
import 'package:expira/domain/models/food_item.dart';

/// Repository interface for inventory operations.
abstract class InventoryRepository {
  /// Loads all inventory items (non-deleted).
  Future<Result<List<FoodItem>>> loadAll();

  /// Watches all inventory items as a stream (for real-time updates).
  Stream<Result<List<FoodItem>>> watchAll();

  /// Saves an item (create or update).
  Future<Result<FoodItem>> save(FoodItem item);

  /// Deletes an item (soft delete).
  Future<Result<void>> delete(String id);

  /// Marks an item as used (creates consumption record, deletes item).
  Future<Result<void>> markUsed(String id, {required String usedBy});

  /// Replaces all items (for migration/import).
  Future<Result<void>> replaceAll(List<FoodItem> items);

  /// Gets an item by ID.
  Future<Result<FoodItem?>> getById(String id);

  /// Gets items by barcode.
  Future<Result<List<FoodItem>>> getByBarcode(String barcode);
}