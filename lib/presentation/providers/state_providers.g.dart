// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$foodItemsStreamHash() => r'4f361af229931b66e05d728f75c74763463ece53';

/// Provides a stream of all food items from the repository.
///
/// Copied from [foodItemsStream].
@ProviderFor(foodItemsStream)
final foodItemsStreamProvider =
    AutoDisposeStreamProvider<Result<List<FoodItem>>>.internal(
  foodItemsStream,
  name: r'foodItemsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$foodItemsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FoodItemsStreamRef
    = AutoDisposeStreamProviderRef<Result<List<FoodItem>>>;
String _$foodItemsFutureHash() => r'f015fb736766f5580bbbb6c2e8497f3ff7a3c67d';

/// Provides a future of all food items (one-time load).
///
/// Copied from [foodItemsFuture].
@ProviderFor(foodItemsFuture)
final foodItemsFutureProvider =
    AutoDisposeFutureProvider<Result<List<FoodItem>>>.internal(
  foodItemsFuture,
  name: r'foodItemsFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$foodItemsFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FoodItemsFutureRef
    = AutoDisposeFutureProviderRef<Result<List<FoodItem>>>;
String _$consumptionRecordsStreamHash() =>
    r'f5eb66e74a139e0e0809733c5919e6c8ef869770';

/// Provides a stream of all consumption records.
///
/// Copied from [consumptionRecordsStream].
@ProviderFor(consumptionRecordsStream)
final consumptionRecordsStreamProvider =
    AutoDisposeStreamProvider<Result<List<ConsumptionRecord>>>.internal(
  consumptionRecordsStream,
  name: r'consumptionRecordsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$consumptionRecordsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConsumptionRecordsStreamRef
    = AutoDisposeStreamProviderRef<Result<List<ConsumptionRecord>>>;
String _$consumptionRecordsFutureHash() =>
    r'90116bd63554f7ec98669b3cd35f9ddad21d6629';

/// Provides a future of all consumption records.
///
/// Copied from [consumptionRecordsFuture].
@ProviderFor(consumptionRecordsFuture)
final consumptionRecordsFutureProvider =
    AutoDisposeFutureProvider<Result<List<ConsumptionRecord>>>.internal(
  consumptionRecordsFuture,
  name: r'consumptionRecordsFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$consumptionRecordsFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ConsumptionRecordsFutureRef
    = AutoDisposeFutureProviderRef<Result<List<ConsumptionRecord>>>;
String _$appSettingsStreamHash() => r'5f910b1e67aee4c8091c72028c1df87d600b9a4c';

/// Provides a stream of app settings.
///
/// Copied from [appSettingsStream].
@ProviderFor(appSettingsStream)
final appSettingsStreamProvider =
    AutoDisposeStreamProvider<Result<AppSettings>>.internal(
  appSettingsStream,
  name: r'appSettingsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSettingsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppSettingsStreamRef
    = AutoDisposeStreamProviderRef<Result<AppSettings>>;
String _$appSettingsFutureHash() => r'd7982670c65cc4ff1aed259b3c4e564ec10a9eb5';

/// Provides a future of app settings.
///
/// Copied from [appSettingsFuture].
@ProviderFor(appSettingsFuture)
final appSettingsFutureProvider =
    AutoDisposeFutureProvider<Result<AppSettings>>.internal(
  appSettingsFuture,
  name: r'appSettingsFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSettingsFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppSettingsFutureRef
    = AutoDisposeFutureProviderRef<Result<AppSettings>>;
String _$foodItemNotifierHash() => r'3a5262371e0d24fdc54140cc11cf1d7f75b272fa';

/// Notifier for managing food item mutations.
///
/// Copied from [FoodItemNotifier].
@ProviderFor(FoodItemNotifier)
final foodItemNotifierProvider =
    AutoDisposeAsyncNotifierProvider<FoodItemNotifier, Result<void>>.internal(
  FoodItemNotifier.new,
  name: r'foodItemNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$foodItemNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FoodItemNotifier = AutoDisposeAsyncNotifier<Result<void>>;
String _$consumptionRecordNotifierHash() =>
    r'90b78bc6a73345a90874df7e09ce6fb43d10c0d9';

/// Notifier for managing consumption records.
///
/// Copied from [ConsumptionRecordNotifier].
@ProviderFor(ConsumptionRecordNotifier)
final consumptionRecordNotifierProvider = AutoDisposeAsyncNotifierProvider<
    ConsumptionRecordNotifier, Result<void>>.internal(
  ConsumptionRecordNotifier.new,
  name: r'consumptionRecordNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$consumptionRecordNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ConsumptionRecordNotifier = AutoDisposeAsyncNotifier<Result<void>>;
String _$appSettingsNotifierHash() =>
    r'96e26834dc9b19d74321e911c2606207c6278d48';

/// Notifier for managing app settings.
///
/// Copied from [AppSettingsNotifier].
@ProviderFor(AppSettingsNotifier)
final appSettingsNotifierProvider = AutoDisposeAsyncNotifierProvider<
    AppSettingsNotifier, Result<void>>.internal(
  AppSettingsNotifier.new,
  name: r'appSettingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSettingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppSettingsNotifier = AutoDisposeAsyncNotifier<Result<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
