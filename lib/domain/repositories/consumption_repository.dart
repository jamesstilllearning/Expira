import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';
import 'package:expira/domain/models/consumption_record.dart';

/// Repository interface for consumption history operations.
abstract class ConsumptionRepository {
  /// Loads all consumption records.
  Future<Result<List<ConsumptionRecord>>> loadAll();

  /// Watches all consumption records as a stream.
  Stream<Result<List<ConsumptionRecord>>> watchAll();

  /// Saves a consumption record.
  Future<Result<ConsumptionRecord>> save(ConsumptionRecord record);

  /// Gets consumption records for a specific item.
  Future<Result<List<ConsumptionRecord>>> getByItemId(String itemId);

  /// Gets consumption records within a date range.
  Future<Result<List<ConsumptionRecord>>> getByDateRange(
    DateTime start,
    DateTime end,
  );
}