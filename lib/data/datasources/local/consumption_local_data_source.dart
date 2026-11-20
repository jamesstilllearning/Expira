import 'package:expira/core/errors/failure.dart';
import 'package:expira/data/mappers/consumption_record_mapper.dart';
import 'package:expira/domain/models/consumption_record.dart';
import 'package:expira/services/inventory_database.dart';

/// Local data source for consumption records using SQLite.
class ConsumptionLocalDataSource {
  ConsumptionLocalDataSource(this._database);

  final InventoryDatabase _database;

  Future<Result<List<ConsumptionRecord>>> loadAll() async {
    try {
      final legacyRecords = await _database.loadRecords();
      final records = ConsumptionRecordMapper.toDomainList(legacyRecords);
      return Result.success(records);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to load consumption records', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Stream<Result<List<ConsumptionRecord>>> watchAll() async* {
    final result = await loadAll();
    yield result;
  }

  Future<Result<ConsumptionRecord>> save(ConsumptionRecord record) async {
    try {
      final legacyRecords = await _database.loadRecords();
      var records = ConsumptionRecordMapper.toDomainList(legacyRecords);
      records.add(record);
      final legacyToSave = ConsumptionRecordMapper.toLegacyList(records);
      await _database.saveRecords(legacyToSave);
      return Result.success(record);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to save consumption record', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<List<ConsumptionRecord>>> getByItemId(String itemId) async {
    try {
      final legacyRecords = await _database.loadRecords();
      final records = ConsumptionRecordMapper.toDomainList(legacyRecords);
      final matches = records.where((r) => r.itemId == itemId).toList();
      return Result.success(matches);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to get records by item ID', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<List<ConsumptionRecord>>> getByDateRange(
    DateTime start,
    DateTime end,
  ) async {
    try {
      final legacyRecords = await _database.loadRecords();
      final records = ConsumptionRecordMapper.toDomainList(legacyRecords);
      final matches = records
          .where((r) => r.usedOn.isAfter(start) && r.usedOn.isBefore(end))
          .toList();
      return Result.success(matches);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to get records by date range', cause: e, stackTrace: stackTrace),
      );
    }
  }
}