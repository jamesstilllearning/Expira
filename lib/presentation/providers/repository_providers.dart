import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:expira/data/datasources/local/consumption_local_data_source.dart';
import 'package:expira/data/datasources/local/inventory_local_data_source.dart';
import 'package:expira/data/datasources/local/outbox_local_data_source.dart';
import 'package:expira/data/datasources/local/settings_local_data_source.dart';
import 'package:expira/data/repositories/consumption_repository_local_impl.dart';
import 'package:expira/data/repositories/inventory_repository_local_impl.dart';
import 'package:expira/data/repositories/outbox_repository_local_impl.dart';
import 'package:expira/data/repositories/settings_repository_local_impl.dart';
import 'package:expira/domain/repositories/consumption_repository.dart';
import 'package:expira/domain/repositories/inventory_repository.dart';
import 'package:expira/domain/repositories/outbox_repository.dart';
import 'package:expira/domain/repositories/settings_repository.dart';
import 'package:expira/services/inventory_database.dart';
import 'package:expira/services/settings_storage.dart';

part 'repository_providers.g.dart';

/// Provides the SQLite database instance.
@riverpod
InventoryDatabase inventoryDatabase(InventoryDatabaseRef ref) {
  return InventoryDatabase.instance;
}

/// Provides the SettingsStorage instance (SharedPreferences).
@riverpod
SettingsStorage settingsStorage(SettingsStorageRef ref) {
  return SettingsStorage();
}

/// Provides the InventoryLocalDataSource.
@riverpod
InventoryLocalDataSource inventoryLocalDataSource(
  InventoryLocalDataSourceRef ref,
) {
  return InventoryLocalDataSource(ref.watch(inventoryDatabaseProvider));
}

/// Provides the ConsumptionLocalDataSource.
@riverpod
ConsumptionLocalDataSource consumptionLocalDataSource(
  ConsumptionLocalDataSourceRef ref,
) {
  return ConsumptionLocalDataSource(ref.watch(inventoryDatabaseProvider));
}

/// Provides the OutboxLocalDataSource.
@riverpod
OutboxLocalDataSource outboxLocalDataSource(
  OutboxLocalDataSourceRef ref,
) {
  return OutboxLocalDataSource(ref.watch(inventoryDatabaseProvider));
}

/// Provides the SettingsLocalDataSource.
@riverpod
SettingsLocalDataSource settingsLocalDataSource(
  SettingsLocalDataSourceRef ref,
) {
  return SettingsLocalDataSource(ref.watch(settingsStorageProvider));
}

/// Provides the InventoryRepository implementation.
@riverpod
InventoryRepository inventoryRepository(InventoryRepositoryRef ref) {
  return InventoryRepositoryLocalImpl(ref.watch(inventoryLocalDataSourceProvider));
}

/// Provides the ConsumptionRepository implementation.
@riverpod
ConsumptionRepository consumptionRepository(ConsumptionRepositoryRef ref) {
  return ConsumptionRepositoryLocalImpl(ref.watch(consumptionLocalDataSourceProvider));
}

/// Provides the OutboxRepository implementation.
@riverpod
OutboxRepository outboxRepository(OutboxRepositoryRef ref) {
  return OutboxRepositoryLocalImpl(ref.watch(outboxLocalDataSourceProvider));
}

/// Provides the SettingsRepository implementation.
@riverpod
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  return SettingsRepositoryLocalImpl(ref.watch(settingsLocalDataSourceProvider));
}