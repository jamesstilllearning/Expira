// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$inventoryDatabaseHash() => r'c949103c26e977d534b9a3a0aa2073b32a9ad8ba';

/// Provides the SQLite database instance.
///
/// Copied from [inventoryDatabase].
@ProviderFor(inventoryDatabase)
final inventoryDatabaseProvider =
    AutoDisposeProvider<InventoryDatabase>.internal(
  inventoryDatabase,
  name: r'inventoryDatabaseProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inventoryDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InventoryDatabaseRef = AutoDisposeProviderRef<InventoryDatabase>;
String _$settingsStorageHash() => r'542fcf972ebaa883181fcd43c0bf03aac24c5561';

/// Provides the SettingsStorage instance (SharedPreferences).
///
/// Copied from [settingsStorage].
@ProviderFor(settingsStorage)
final settingsStorageProvider = AutoDisposeProvider<SettingsStorage>.internal(
  settingsStorage,
  name: r'settingsStorageProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsStorageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsStorageRef = AutoDisposeProviderRef<SettingsStorage>;
String _$inventoryLocalDataSourceHash() =>
    r'b55e7caedf99ea43f9c07b91e0e2c09144deb003';

/// Provides the InventoryLocalDataSource.
///
/// Copied from [inventoryLocalDataSource].
@ProviderFor(inventoryLocalDataSource)
final inventoryLocalDataSourceProvider =
    AutoDisposeProvider<InventoryLocalDataSource>.internal(
  inventoryLocalDataSource,
  name: r'inventoryLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inventoryLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InventoryLocalDataSourceRef
    = AutoDisposeProviderRef<InventoryLocalDataSource>;
String _$consumptionLocalDataSourceHash() =>
    r'ad2956c5460fae2754b14a8f338f0ea7556b7a42';

/// Provides the ConsumptionLocalDataSource.
///
/// Copied from [consumptionLocalDataSource].
@ProviderFor(consumptionLocalDataSource)
final consumptionLocalDataSourceProvider =
    AutoDisposeProvider<ConsumptionLocalDataSource>.internal(
  consumptionLocalDataSource,
  name: r'consumptionLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$consumptionLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConsumptionLocalDataSourceRef
    = AutoDisposeProviderRef<ConsumptionLocalDataSource>;
String _$outboxLocalDataSourceHash() =>
    r'cfed362d54bcabce0eba18c9af07624d8daf8493';

/// Provides the OutboxLocalDataSource.
///
/// Copied from [outboxLocalDataSource].
@ProviderFor(outboxLocalDataSource)
final outboxLocalDataSourceProvider =
    AutoDisposeProvider<OutboxLocalDataSource>.internal(
  outboxLocalDataSource,
  name: r'outboxLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$outboxLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OutboxLocalDataSourceRef
    = AutoDisposeProviderRef<OutboxLocalDataSource>;
String _$settingsLocalDataSourceHash() =>
    r'0e2a40a651a2beea3047e31e4ef15179c327d12d';

/// Provides the SettingsLocalDataSource.
///
/// Copied from [settingsLocalDataSource].
@ProviderFor(settingsLocalDataSource)
final settingsLocalDataSourceProvider =
    AutoDisposeProvider<SettingsLocalDataSource>.internal(
  settingsLocalDataSource,
  name: r'settingsLocalDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsLocalDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsLocalDataSourceRef
    = AutoDisposeProviderRef<SettingsLocalDataSource>;
String _$inventoryRepositoryHash() =>
    r'a807d2cb05a6d3aa0e36d0de9fd3af009579eba0';

/// Provides the InventoryRepository implementation.
///
/// Copied from [inventoryRepository].
@ProviderFor(inventoryRepository)
final inventoryRepositoryProvider =
    AutoDisposeProvider<InventoryRepository>.internal(
  inventoryRepository,
  name: r'inventoryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inventoryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef InventoryRepositoryRef = AutoDisposeProviderRef<InventoryRepository>;
String _$consumptionRepositoryHash() =>
    r'f9b9a4f3f19b121fd1b04f8a389f3401ce6f2042';

/// Provides the ConsumptionRepository implementation.
///
/// Copied from [consumptionRepository].
@ProviderFor(consumptionRepository)
final consumptionRepositoryProvider =
    AutoDisposeProvider<ConsumptionRepository>.internal(
  consumptionRepository,
  name: r'consumptionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$consumptionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConsumptionRepositoryRef
    = AutoDisposeProviderRef<ConsumptionRepository>;
String _$outboxRepositoryHash() => r'b1c2609785f6133334bb6f0e7f142c6665936108';

/// Provides the OutboxRepository implementation.
///
/// Copied from [outboxRepository].
@ProviderFor(outboxRepository)
final outboxRepositoryProvider = AutoDisposeProvider<OutboxRepository>.internal(
  outboxRepository,
  name: r'outboxRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$outboxRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef OutboxRepositoryRef = AutoDisposeProviderRef<OutboxRepository>;
String _$settingsRepositoryHash() =>
    r'099ca227a84eba989da460c4712e2bb6d09c4466';

/// Provides the SettingsRepository implementation.
///
/// Copied from [settingsRepository].
@ProviderFor(settingsRepository)
final settingsRepositoryProvider =
    AutoDisposeProvider<SettingsRepository>.internal(
  settingsRepository,
  name: r'settingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsRepositoryRef = AutoDisposeProviderRef<SettingsRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
