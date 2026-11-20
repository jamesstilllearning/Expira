import 'package:expira/core/errors/failure.dart';
import 'package:expira/domain/models/food_item.dart';
import 'package:expira/domain/repositories/inventory_repository.dart';

/// Use case for loading all food items.
class GetAllFoodItemsUseCase {
  GetAllFoodItemsUseCase(this._repository);

  final InventoryRepository _repository;

  Future<Result<List<FoodItem>>> call() => _repository.loadAll();
}

/// Use case for watching all food items as a stream.
class WatchFoodItemsUseCase {
  WatchFoodItemsUseCase(this._repository);

  final InventoryRepository _repository;

  Stream<Result<List<FoodItem>>> call() => _repository.watchAll();
}

/// Use case for saving a food item (create or update).
class SaveFoodItemUseCase {
  SaveFoodItemUseCase(this._repository);

  final InventoryRepository _repository;

  Future<Result<FoodItem>> call(FoodItem item) => _repository.save(item);
}

/// Use case for deleting a food item.
class DeleteFoodItemUseCase {
  DeleteFoodItemUseCase(this._repository);

  final InventoryRepository _repository;

  Future<Result<void>> call(String id) => _repository.delete(id);
}

/// Use case for marking a food item as used (consumed).
class MarkFoodItemUsedUseCase {
  MarkFoodItemUsedUseCase(this._repository);

  final InventoryRepository _repository;

  Future<Result<void>> call(String id, {required String usedBy}) =>
      _repository.markUsed(id, usedBy: usedBy);
}

/// Use case for replacing all food items (bulk operation).
class ReplaceAllFoodItemsUseCase {
  ReplaceAllFoodItemsUseCase(this._repository);

  final InventoryRepository _repository;

  Future<Result<void>> call(List<FoodItem> items) => _repository.replaceAll(items);
}

/// Use case for getting a food item by ID.
class GetFoodItemByIdUseCase {
  GetFoodItemByIdUseCase(this._repository);

  final InventoryRepository _repository;

  Future<Result<FoodItem?>> call(String id) => _repository.getById(id);
}

/// Use case for getting food items by barcode.
class GetFoodItemsByBarcodeUseCase {
  GetFoodItemsByBarcodeUseCase(this._repository);

  final InventoryRepository _repository;

  Future<Result<List<FoodItem>>> call(String barcode) =>
      _repository.getByBarcode(barcode);
}