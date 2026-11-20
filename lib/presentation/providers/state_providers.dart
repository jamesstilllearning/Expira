import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:expira/core/errors/failure.dart';
import 'package:expira/domain/models/app_settings.dart';
import 'package:expira/domain/models/consumption_record.dart';
import 'package:expira/domain/models/food_item.dart';
import 'package:expira/presentation/providers/repository_providers.dart';

part 'state_providers.g.dart';

/// Provides a stream of all food items from the repository.
@riverpod
Stream<Result<List<FoodItem>>> foodItemsStream(FoodItemsStreamRef ref) {
  final repository = ref.watch(inventoryRepositoryProvider);
  return repository.watchAll();
}

/// Provides a future of all food items (one-time load).
@riverpod
Future<Result<List<FoodItem>>> foodItemsFuture(FoodItemsFutureRef ref) {
  final repository = ref.watch(inventoryRepositoryProvider);
  return repository.loadAll();
}

/// Provides a stream of all consumption records.
@riverpod
Stream<Result<List<ConsumptionRecord>>> consumptionRecordsStream(
  ConsumptionRecordsStreamRef ref,
) {
  final repository = ref.watch(consumptionRepositoryProvider);
  return repository.watchAll();
}

/// Provides a future of all consumption records.
@riverpod
Future<Result<List<ConsumptionRecord>>> consumptionRecordsFuture(
  ConsumptionRecordsFutureRef ref,
) {
  final repository = ref.watch(consumptionRepositoryProvider);
  return repository.loadAll();
}

/// Provides a stream of app settings.
@riverpod
Stream<Result<AppSettings>> appSettingsStream(AppSettingsStreamRef ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return repository.watch();
}

/// Provides a future of app settings.
@riverpod
Future<Result<AppSettings>> appSettingsFuture(AppSettingsFutureRef ref) {
  final repository = ref.watch(settingsRepositoryProvider);
  return repository.load();
}

/// Notifier for managing food item mutations.
@riverpod
class FoodItemNotifier extends _$FoodItemNotifier {
  @override
  Future<Result<void>> build() async => Result.success(null);

  Future<Result<void>> addItem(FoodItem item) async {
    final repository = ref.read(inventoryRepositoryProvider);
    final result = await repository.save(item);
    return result;
  }

  Future<Result<void>> updateItem(FoodItem item) async {
    final repository = ref.read(inventoryRepositoryProvider);
    final result = await repository.save(item);
    return result;
  }

  Future<Result<void>> deleteItem(String id) async {
    final repository = ref.read(inventoryRepositoryProvider);
    final result = await repository.delete(id);
    return result;
  }

  Future<Result<void>> markItemUsed(String id, {required String usedBy}) async {
    final repository = ref.read(inventoryRepositoryProvider);
    final result = await repository.markUsed(id, usedBy: usedBy);
    return result;
  }

  Future<Result<void>> replaceAllItems(List<FoodItem> items) async {
    final repository = ref.read(inventoryRepositoryProvider);
    final result = await repository.replaceAll(items);
    return result;
  }
}

/// Notifier for managing consumption records.
@riverpod
class ConsumptionRecordNotifier extends _$ConsumptionRecordNotifier {
  @override
  Future<Result<void>> build() async => Result.success(null);

  Future<Result<void>> addRecord(ConsumptionRecord record) async {
    final repository = ref.read(consumptionRepositoryProvider);
    final result = await repository.save(record);
    return result;
  }
}

/// Notifier for managing app settings.
@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  @override
  Future<Result<void>> build() async => Result.success(null);

  Future<Result<void>> saveSettings(AppSettings settings) async {
    final repository = ref.read(settingsRepositoryProvider);
    final result = await repository.save(settings);
    return result;
  }

  Future<Result<void>> resetSettings() async {
    final repository = ref.read(settingsRepositoryProvider);
    final result = await repository.reset();
    return result;
  }
}