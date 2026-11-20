import 'package:expira/core/errors/failure.dart';
import 'package:expira/data/datasources/local/consumption_local_data_source.dart';
import 'package:expira/domain/models/consumption_record.dart';
import 'package:expira/domain/repositories/consumption_repository.dart';

/// Local implementation of ConsumptionRepository using SQLite.
class ConsumptionRepositoryLocalImpl implements ConsumptionRepository {
  ConsumptionRepositoryLocalImpl(this._dataSource);

  final ConsumptionLocalDataSource _dataSource;

  @override
  Future<Result<List<ConsumptionRecord>>> loadAll() => _dataSource.loadAll();

  @override
  Stream<Result<List<ConsumptionRecord>>> watchAll() => _dataSource.watchAll();

  @override
  Future<Result<ConsumptionRecord>> save(ConsumptionRecord record) =>
      _dataSource.save(record);

  @override
  Future<Result<List<ConsumptionRecord>>> getByItemId(String itemId) =>
      _dataSource.getByItemId(itemId);

  @override
  Future<Result<List<ConsumptionRecord>>> getByDateRange(
    DateTime start,
    DateTime end,
  ) =>
      _dataSource.getByDateRange(start, end);
}