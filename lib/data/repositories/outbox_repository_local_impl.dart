import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';
import 'package:expira/data/datasources/local/outbox_local_data_source.dart';
import 'package:expira/domain/models/outbox_entry.dart';
import 'package:expira/domain/repositories/outbox_repository.dart';

/// Local implementation of OutboxRepository.
class OutboxRepositoryLocalImpl implements OutboxRepository {
  OutboxRepositoryLocalImpl(this._dataSource);

  final OutboxLocalDataSource _dataSource;

  @override
  Future<Result<OutboxEntry>> enqueue(OutboxEntry entry) async {
    return _dataSource.enqueue(entry);
  }

  @override
  Future<Result<List<OutboxEntry>>> claimNextBatch({int limit = 50}) async {
    return _dataSource.claimNextBatch(limit: limit);
  }

  @override
  Future<Result<void>> markSynced(int id) async {
    return _dataSource.markSynced(id);
  }

  @override
  Future<Result<void>> markFailed(int id, String error) async {
    return _dataSource.markFailed(id, error);
  }

  @override
  Future<Result<int>> cleanupSyncedEntries({Duration olderThan = const Duration(days: 30)}) async {
    return _dataSource.cleanupSyncedEntries(olderThan: olderThan);
  }

  @override
  Future<Result<List<OutboxEntry>>> getPendingEntries() async {
    return _dataSource.getPendingEntries();
  }

  @override
  Future<Result<OutboxEntry?>> getById(int id) async {
    return _dataSource.getById(id);
  }

  @override
  Future<Result<void>> retry(int id) async {
    return _dataSource.retry(id);
  }
}