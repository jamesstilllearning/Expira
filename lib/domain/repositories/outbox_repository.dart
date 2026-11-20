import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';
import 'package:expira/domain/models/outbox_entry.dart';

/// Repository interface for outbox operations.
abstract class OutboxRepository {
  /// Adds an entry to the outbox.
  Future<Result<OutboxEntry>> enqueue(OutboxEntry entry);

  /// Claims the next batch of pending entries for processing.
  /// Marks them as 'processing' to prevent duplicate processing.
  Future<Result<List<OutboxEntry>>> claimNextBatch({int limit = 50});

  /// Marks an entry as successfully synced.
  Future<Result<void>> markSynced(int id);

  /// Marks an entry as failed with an error message.
  Future<Result<void>> markFailed(int id, String error);

  /// Removes synced entries older than the given duration (cleanup).
  Future<Result<int>> cleanupSyncedEntries({Duration olderThan = const Duration(days: 30)});

  /// Gets all pending entries (for debugging/inspection).
  Future<Result<List<OutboxEntry>>> getPendingEntries();

  /// Gets an entry by ID.
  Future<Result<OutboxEntry?>> getById(int id);

  /// Retries a failed entry (resets status to pending).
  Future<Result<void>> retry(int id);
}