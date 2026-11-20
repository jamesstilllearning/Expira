import 'package:expira/core/errors/failure.dart';
import 'package:expira/core/errors/result.dart';
import 'package:expira/domain/models/outbox_entry.dart';
import 'package:expira/services/inventory_database.dart';
import 'package:sqflite/sqflite.dart';

/// Local data source for outbox using SQLite.
class OutboxLocalDataSource {
  /// Creates a data source using an InventoryDatabase (production).
  OutboxLocalDataSource(InventoryDatabase database)
      : _database = database,
        _rawDatabase = null;

  /// Creates a data source using a raw database (for testing).
  factory OutboxLocalDataSource.forTesting(Database database) =>
      OutboxLocalDataSource._internal(null, database);

  OutboxLocalDataSource._internal(this._database, this._rawDatabase);

  final InventoryDatabase? _database;
  final Database? _rawDatabase;

  Future<Database> get _db async {
    if (_rawDatabase != null) return _rawDatabase!;
    return _database!.database;
  }

  Future<Result<OutboxEntry>> enqueue(OutboxEntry entry) async {
    try {
      final db = await _db;
      final id = await db.insert('outbox', _entryToRow(entry));
      return Result.success(entry.copyWith(id: id));
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to enqueue outbox entry', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<List<OutboxEntry>>> claimNextBatch({int limit = 50}) async {
    try {
      final db = await _db;
      // First, get pending entries
      final rows = await db.query(
        'outbox',
        where: 'status = ?',
        whereArgs: ['pending'],
        orderBy: 'created_at ASC',
        limit: limit,
      );

      if (rows.isEmpty) {
        return Result.success([]);
      }

      final ids = rows.map((r) => r['id'] as int).toList();

      // Mark as processing
      await db.update(
        'outbox',
        {'status': 'processing'},
        where: 'id IN (${ids.map((_) => '?').join(',')})',
        whereArgs: ids,
      );

      // Return the entries with updated status
      final entries = rows.map((r) => _entryFromRow(r).copyWith(status: OutboxStatus.processing())).toList();
      return Result.success(entries);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to claim outbox batch', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<void>> markSynced(int id) async {
    try {
      final db = await _db;
      await db.update('outbox', {'status': 'synced'}, where: 'id = ?', whereArgs: [id]);
      return Result.success(null);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to mark outbox entry as synced', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<void>> markFailed(int id, String error) async {
    try {
      final db = await _db;
      // First get current retry count
      final rows = await db.query('outbox', columns: ['retry_count'], where: 'id = ?', whereArgs: [id], limit: 1);
      final currentRetryCount = rows.isNotEmpty ? (rows.first['retry_count'] as int? ?? 0) : 0;

      await db.update(
        'outbox',
        {
          'status': 'failed',
          'last_error': error,
          'retry_count': currentRetryCount + 1,
        },
        where: 'id = ?',
        whereArgs: [id],
      );
      return Result.success(null);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to mark outbox entry as failed', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<int>> cleanupSyncedEntries({Duration olderThan = const Duration(days: 30)}) async {
    try {
      final db = await _db;
      final cutoff = DateTime.now().subtract(olderThan).toUtc().toIso8601String();
      final count = await db.delete(
        'outbox',
        where: 'status = ? AND created_at < ?',
        whereArgs: ['synced', cutoff],
      );
      return Result.success(count);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to cleanup outbox entries', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<List<OutboxEntry>>> getPendingEntries() async {
    try {
      final db = await _db;
      final rows = await db.query(
        'outbox',
        where: 'status = ?',
        whereArgs: ['pending'],
        orderBy: 'created_at ASC',
      );
      return Result.success(rows.map(_entryFromRow).toList());
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to get pending outbox entries', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<OutboxEntry?>> getById(int id) async {
    try {
      final db = await _db;
      final rows = await db.query('outbox', where: 'id = ?', whereArgs: [id], limit: 1);
      if (rows.isEmpty) return Result.success(null);
      return Result.success(_entryFromRow(rows.first));
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to get outbox entry', cause: e, stackTrace: stackTrace),
      );
    }
  }

  Future<Result<void>> retry(int id) async {
    try {
      final db = await _db;
      await db.update(
        'outbox',
        {'status': 'pending', 'last_error': ''},
        where: 'id = ?',
        whereArgs: [id],
      );
      return Result.success(null);
    } catch (e, stackTrace) {
      return Result.failure(
        Failure.database(message: 'Failed to retry outbox entry', cause: e, stackTrace: stackTrace),
      );
    }
  }

  static Map<String, Object?> _entryToRow(OutboxEntry entry) => {
        'operation': entry.operation.value,
        'entity_type': entry.entityType.value,
        'entity_id': entry.entityId,
        'payload': entry.payload,
        'expected_version': entry.expectedVersion,
        'created_at': entry.createdAt.toUtc().toIso8601String(),
        'retry_count': entry.retryCount,
        'last_error': entry.lastError,
        'status': entry.status.value,
      };

  static OutboxEntry _entryFromRow(Map<String, Object?> row) => OutboxEntry(
        id: row['id']! as int,
        operation: OutboxOperation.fromString(row['operation'] as String? ?? 'create'),
        entityType: OutboxEntityType.fromString(row['entity_type'] as String? ?? 'item'),
        entityId: row['entity_id']! as String,
        payload: row['payload']! as String,
        expectedVersion: row['expected_version'] as int? ?? 1,
        createdAt: DateTime.parse(row['created_at']! as String).toUtc(),
        retryCount: row['retry_count'] as int? ?? 0,
        lastError: row['last_error'] as String? ?? '',
        status: OutboxStatus.fromString(row['status'] as String? ?? 'pending'),
      );
}