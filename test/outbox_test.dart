import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:expira/data/datasources/local/outbox_local_data_source.dart';
import 'package:expira/data/repositories/outbox_repository_local_impl.dart';
import 'package:expira/domain/models/outbox_entry.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Initialize ffi for database testing
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  group('Outbox Data Source & Repository', () {
    late String tempPath;
    late Database database;
    late OutboxLocalDataSource dataSource;
    late OutboxRepositoryLocalImpl repository;

    setUpAll(() async {
      tempPath = Directory.systemTemp.createTempSync('expira_outbox_test_').path;
    });

    tearDownAll(() async {
      try {
        final dir = Directory(tempPath);
        if (dir.existsSync()) dir.deleteSync(recursive: true);
      } catch (_) {}
    });

    setUp(() async {
      final dbPath = '$tempPath/outbox_test_${DateTime.now().millisecondsSinceEpoch}.db';
      // Create a fresh database with v4 schema including outbox table
      database = await databaseFactory.openDatabase(
        dbPath,
        options: OpenDatabaseOptions(
          version: 4,
          onCreate: (db, _) async {
            await db.execute('''
              CREATE TABLE items (
                id TEXT PRIMARY KEY,
                name TEXT NOT NULL,
                category TEXT NOT NULL,
                expiry_date TEXT NOT NULL,
                quantity INTEGER NOT NULL,
                barcode TEXT,
                location TEXT,
                product_id TEXT,
                brand TEXT,
                purchase_date TEXT,
                image_url TEXT,
                notes TEXT,
                sync_status TEXT NOT NULL DEFAULT 'synced',
                version INTEGER NOT NULL DEFAULT 1,
                synced_at TEXT,
                deleted_at TEXT,
                server_id TEXT
              )
            ''');
            await db.execute('''
              CREATE TABLE consumption_records (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                item_name TEXT NOT NULL,
                category TEXT NOT NULL,
                expiry_date TEXT NOT NULL,
                used_on TEXT NOT NULL,
                was_expiring_at_use INTEGER NOT NULL,
                sync_status TEXT NOT NULL DEFAULT 'synced',
                version INTEGER NOT NULL DEFAULT 1,
                synced_at TEXT,
                server_id TEXT,
                record_id TEXT
              )
            ''');
            await db.execute('''
              CREATE TABLE app_metadata (
                key TEXT PRIMARY KEY,
                value TEXT NOT NULL
              )
            ''');
            await db.execute('''CREATE TABLE product_catalog (
              barcode TEXT PRIMARY KEY, name TEXT NOT NULL, brand TEXT, category TEXT,
              package_size TEXT, package_unit TEXT, description TEXT, image_url TEXT,
              provider TEXT NOT NULL, provider_id TEXT, last_success TEXT,
              lookup_status TEXT NOT NULL DEFAULT 'success', last_attempt TEXT)''');
            await db.execute('''
              CREATE TABLE outbox (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                operation TEXT NOT NULL,
                entity_type TEXT NOT NULL,
                entity_id TEXT NOT NULL,
                payload TEXT NOT NULL,
                expected_version INTEGER NOT NULL,
                created_at TEXT NOT NULL,
                retry_count INTEGER NOT NULL DEFAULT 0,
                last_error TEXT,
                status TEXT NOT NULL DEFAULT 'pending'
              )
            ''');
            await db.execute('CREATE INDEX outbox_status_idx ON outbox(status)');
            await db.execute('CREATE INDEX outbox_entity_idx ON outbox(entity_type, entity_id)');
          },
        ),
      );
      dataSource = OutboxLocalDataSource.forTesting(database);
      repository = OutboxRepositoryLocalImpl(dataSource);
    });

    tearDown(() async {
      await database.close();
    });

    test('enqueue adds entry to outbox', () async {
      final entry = OutboxEntry(
        operation: OutboxOperation.create(),
        entityType: OutboxEntityType.item(),
        entityId: 'item_1',
        payload: '{"id": "item_1", "name": "Milk"}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc(),
      );

      final result = await dataSource.enqueue(entry);

      expect(result.isSuccess, isTrue);
      final savedEntry = result.getOrThrow();
      expect(savedEntry.id, greaterThan(0));
      expect(savedEntry.entityId, 'item_1');
      expect(savedEntry.status, OutboxStatus.pending());
    });

    test('claimNextBatch returns pending entries and marks them processing', () async {
      // Add multiple entries
      for (int i = 0; i < 5; i++) {
        await dataSource.enqueue(OutboxEntry(
          operation: OutboxOperation.create(),
          entityType: OutboxEntityType.item(),
          entityId: 'item_$i',
          payload: '{"id": "item_$i"}',
          expectedVersion: 1,
          createdAt: DateTime.now().toUtc().subtract(Duration(minutes: i)),
        ));
      }

      // Claim batch
      final result = await dataSource.claimNextBatch(limit: 3);

      expect(result.isSuccess, isTrue);
      final batch = result.getOrThrow();
      expect(batch.length, 3);
      for (final entry in batch) {
        expect(entry.status, OutboxStatus.processing());
      }

      // Claim remaining
      final result2 = await dataSource.claimNextBatch(limit: 10);
      expect(result2.getOrThrow().length, 2);
    });

    test('claimNextBatch returns empty when no pending entries', () async {
      final result = await dataSource.claimNextBatch();
      expect(result.isSuccess, isTrue);
      expect(result.getOrThrow(), isEmpty);
    });

    test('markSynced updates status to synced', () async {
      final enqueueResult = await dataSource.enqueue(OutboxEntry(
        operation: OutboxOperation.create(),
        entityType: OutboxEntityType.item(),
        entityId: 'item_1',
        payload: '{}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc(),
      ));

      final id = enqueueResult.getOrThrow().id;
      final markResult = await dataSource.markSynced(id);

      expect(markResult.isSuccess, isTrue);

      final getResult = await dataSource.getById(id);
      expect(getResult.getOrThrow()!.status, OutboxStatus.synced());
    });

    test('markFailed updates status to failed and increments retry count', () async {
      final enqueueResult = await dataSource.enqueue(OutboxEntry(
        operation: OutboxOperation.create(),
        entityType: OutboxEntityType.item(),
        entityId: 'item_1',
        payload: '{}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc(),
      ));

      final id = enqueueResult.getOrThrow().id;
      final markResult = await dataSource.markFailed(id, 'Network error');

      expect(markResult.isSuccess, isTrue);

      final getResult = await dataSource.getById(id);
      final entry = getResult.getOrThrow()!;
      expect(entry.status, OutboxStatus.failed());
      expect(entry.lastError, 'Network error');
      expect(entry.retryCount, 1);
    });

    test('retry resets status to pending', () async {
      final enqueueResult = await dataSource.enqueue(OutboxEntry(
        operation: OutboxOperation.create(),
        entityType: OutboxEntityType.item(),
        entityId: 'item_1',
        payload: '{}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc(),
      ));

      final id = enqueueResult.getOrThrow().id;
      await dataSource.markFailed(id, 'Network error');
      final retryResult = await dataSource.retry(id);

      expect(retryResult.isSuccess, isTrue);

      final getResult = await dataSource.getById(id);
      final entry = getResult.getOrThrow()!;
      expect(entry.status, OutboxStatus.pending());
      expect(entry.lastError, '');
    });

    test('getPendingEntries returns only pending entries', () async {
      await dataSource.enqueue(OutboxEntry(
        operation: OutboxOperation.create(),
        entityType: OutboxEntityType.item(),
        entityId: 'item_1',
        payload: '{}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc(),
      ));
      await dataSource.enqueue(OutboxEntry(
        operation: OutboxOperation.update(),
        entityType: OutboxEntityType.item(),
        entityId: 'item_2',
        payload: '{}',
        expectedVersion: 2,
        createdAt: DateTime.now().toUtc(),
      ));

      // Mark one as synced
      final enqueueResult = await dataSource.enqueue(OutboxEntry(
        operation: OutboxOperation.delete(),
        entityType: OutboxEntityType.item(),
        entityId: 'item_3',
        payload: '{}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc(),
      ));
      await dataSource.markSynced(enqueueResult.getOrThrow().id);

      final result = await dataSource.getPendingEntries();
      expect(result.isSuccess, isTrue);
      final pending = result.getOrThrow();
      expect(pending.length, 2);
      for (final entry in pending) {
        expect(entry.status, OutboxStatus.pending());
      }
    });

    test('cleanupSyncedEntries removes old synced entries', () async {
      // Add old synced entry
      final oldEntry = await dataSource.enqueue(OutboxEntry(
        operation: OutboxOperation.create(),
        entityType: OutboxEntityType.item(),
        entityId: 'old_item',
        payload: '{}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc().subtract(const Duration(days: 31)),
      ));
      await dataSource.markSynced(oldEntry.getOrThrow().id);

      // Add recent synced entry
      final recentEntry = await dataSource.enqueue(OutboxEntry(
        operation: OutboxOperation.create(),
        entityType: OutboxEntityType.item(),
        entityId: 'recent_item',
        payload: '{}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc(),
      ));
      await dataSource.markSynced(recentEntry.getOrThrow().id);

      // Add pending entry (should not be cleaned up)
      await dataSource.enqueue(OutboxEntry(
        operation: OutboxOperation.create(),
        entityType: OutboxEntityType.item(),
        entityId: 'pending_item',
        payload: '{}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc(),
      ));

      // Cleanup entries older than 30 days
      final result = await dataSource.cleanupSyncedEntries(olderThan: const Duration(days: 30));
      expect(result.isSuccess, isTrue);
      expect(result.getOrThrow(), 1); // Only the old entry should be removed

      // Verify old entry is gone
      final oldGet = await dataSource.getById(oldEntry.getOrThrow().id);
      expect(oldGet.getOrThrow(), isNull);

      // Verify recent entry still exists
      final recentGet = await dataSource.getById(recentEntry.getOrThrow().id);
      expect(recentGet.getOrThrow(), isNotNull);
      expect(recentGet.getOrThrow()!.status, OutboxStatus.synced());

      // Verify pending entry still exists
      final pendingEntries = await dataSource.getPendingEntries();
      expect(pendingEntries.getOrThrow().length, 1);
    });

    test('repository delegates to data source', () async {
      final entry = OutboxEntry(
        operation: OutboxOperation.markUsed(),
        entityType: OutboxEntityType.consumption(),
        entityId: 'rec_1',
        payload: '{}',
        expectedVersion: 1,
        createdAt: DateTime.now().toUtc(),
      );

      final enqueueResult = await repository.enqueue(entry);
      expect(enqueueResult.isSuccess, isTrue);

      final claimResult = await repository.claimNextBatch(limit: 10);
      expect(claimResult.getOrThrow().length, 1);
      expect(claimResult.getOrThrow().first.operation, OutboxOperation.markUsed());
      expect(claimResult.getOrThrow().first.entityType, OutboxEntityType.consumption());
    });
  });
}