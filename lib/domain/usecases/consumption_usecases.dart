import 'package:expira/core/errors/failure.dart';
import 'package:expira/domain/models/consumption_record.dart';
import 'package:expira/domain/repositories/consumption_repository.dart';

/// Use case for loading all consumption records.
class GetAllConsumptionRecordsUseCase {
  GetAllConsumptionRecordsUseCase(this._repository);

  final ConsumptionRepository _repository;

  Future<Result<List<ConsumptionRecord>>> call() => _repository.loadAll();
}

/// Use case for watching all consumption records as a stream.
class WatchConsumptionRecordsUseCase {
  WatchConsumptionRecordsUseCase(this._repository);

  final ConsumptionRepository _repository;

  Stream<Result<List<ConsumptionRecord>>> call() => _repository.watchAll();
}

/// Use case for saving a consumption record.
class SaveConsumptionRecordUseCase {
  SaveConsumptionRecordUseCase(this._repository);

  final ConsumptionRepository _repository;

  Future<Result<ConsumptionRecord>> call(ConsumptionRecord record) =>
      _repository.save(record);
}

/// Use case for getting consumption records by item ID.
class GetConsumptionRecordsByItemIdUseCase {
  GetConsumptionRecordsByItemIdUseCase(this._repository);

  final ConsumptionRepository _repository;

  Future<Result<List<ConsumptionRecord>>> call(String itemId) =>
      _repository.getByItemId(itemId);
}

/// Use case for getting consumption records by date range.
class GetConsumptionRecordsByDateRangeUseCase {
  GetConsumptionRecordsByDateRangeUseCase(this._repository);

  final ConsumptionRepository _repository;

  Future<Result<List<ConsumptionRecord>>> call(
    DateTime start,
    DateTime end,
  ) =>
      _repository.getByDateRange(start, end);
}