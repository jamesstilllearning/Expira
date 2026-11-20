import 'package:expira/core/errors/failure.dart';
import 'package:expira/data/datasources/local/inventory_local_data_source.dart';
import 'package:expira/domain/models/food_item.dart';
import 'package:expira/domain/repositories/inventory_repository.dart';

/// Local implementation of InventoryRepository using SQLite.
class InventoryRepositoryLocalImpl implements InventoryRepository {
  InventoryRepositoryLocalImpl(this._dataSource);

  final InventoryLocalDataSource _dataSource;

  @override
  Future<Result<List<FoodItem>>> loadAll() => _dataSource.loadAll();

  @override
  Stream<Result<List<FoodItem>>> watchAll() => _dataSource.watchAll();

  @override
  Future<Result<FoodItem>> save(FoodItem item) => _dataSource.save(item);

  @override
  Future<Result<void>> delete(String id) => _dataSource.delete(id);

  @override
  Future<Result<void>> markUsed(String id, {required String usedBy}) =>
      _dataSource.markUsed(id, usedBy: usedBy);

  @override
  Future<Result<void>> replaceAll(List<FoodItem> items) => _dataSource.replaceAll(items);

  @override
  Future<Result<FoodItem?>> getById(String id) => _dataSource.getById(id);

  @override
  Future<Result<List<FoodItem>>> getByBarcode(String barcode) =>
      _dataSource.getByBarcode(barcode);
}