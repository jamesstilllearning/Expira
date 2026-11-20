import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:expira/domain/repositories/consumption_repository.dart';
import 'package:expira/domain/repositories/inventory_repository.dart';
import 'package:expira/domain/repositories/settings_repository.dart';
import 'package:expira/domain/usecases/consumption_usecases.dart';
import 'package:expira/domain/usecases/inventory_usecases.dart';
import 'package:expira/domain/usecases/settings_usecases.dart';
import 'package:expira/presentation/providers/repository_providers.dart';

part 'usecase_providers.g.dart';

/// Provides the GetAllFoodItemsUseCase.
@riverpod
GetAllFoodItemsUseCase getAllFoodItemsUseCase(GetAllFoodItemsUseCaseRef ref) {
  return GetAllFoodItemsUseCase(ref.watch(inventoryRepositoryProvider));
}

/// Provides the WatchFoodItemsUseCase.
@riverpod
WatchFoodItemsUseCase watchFoodItemsUseCase(WatchFoodItemsUseCaseRef ref) {
  return WatchFoodItemsUseCase(ref.watch(inventoryRepositoryProvider));
}

/// Provides the SaveFoodItemUseCase.
@riverpod
SaveFoodItemUseCase saveFoodItemUseCase(SaveFoodItemUseCaseRef ref) {
  return SaveFoodItemUseCase(ref.watch(inventoryRepositoryProvider));
}

/// Provides the DeleteFoodItemUseCase.
@riverpod
DeleteFoodItemUseCase deleteFoodItemUseCase(DeleteFoodItemUseCaseRef ref) {
  return DeleteFoodItemUseCase(ref.watch(inventoryRepositoryProvider));
}

/// Provides the MarkFoodItemUsedUseCase.
@riverpod
MarkFoodItemUsedUseCase markFoodItemUsedUseCase(MarkFoodItemUsedUseCaseRef ref) {
  return MarkFoodItemUsedUseCase(ref.watch(inventoryRepositoryProvider));
}

/// Provides the ReplaceAllFoodItemsUseCase.
@riverpod
ReplaceAllFoodItemsUseCase replaceAllFoodItemsUseCase(
  ReplaceAllFoodItemsUseCaseRef ref,
) {
  return ReplaceAllFoodItemsUseCase(ref.watch(inventoryRepositoryProvider));
}

/// Provides the GetFoodItemByIdUseCase.
@riverpod
GetFoodItemByIdUseCase getFoodItemByIdUseCase(GetFoodItemByIdUseCaseRef ref) {
  return GetFoodItemByIdUseCase(ref.watch(inventoryRepositoryProvider));
}

/// Provides the GetFoodItemsByBarcodeUseCase.
@riverpod
GetFoodItemsByBarcodeUseCase getFoodItemsByBarcodeUseCase(
  GetFoodItemsByBarcodeUseCaseRef ref,
) {
  return GetFoodItemsByBarcodeUseCase(ref.watch(inventoryRepositoryProvider));
}

/// Provides the GetAllConsumptionRecordsUseCase.
@riverpod
GetAllConsumptionRecordsUseCase getAllConsumptionRecordsUseCase(
  GetAllConsumptionRecordsUseCaseRef ref,
) {
  return GetAllConsumptionRecordsUseCase(
    ref.watch(consumptionRepositoryProvider),
  );
}

/// Provides the WatchConsumptionRecordsUseCase.
@riverpod
WatchConsumptionRecordsUseCase watchConsumptionRecordsUseCase(
  WatchConsumptionRecordsUseCaseRef ref,
) {
  return WatchConsumptionRecordsUseCase(
    ref.watch(consumptionRepositoryProvider),
  );
}

/// Provides the SaveConsumptionRecordUseCase.
@riverpod
SaveConsumptionRecordUseCase saveConsumptionRecordUseCase(
  SaveConsumptionRecordUseCaseRef ref,
) {
  return SaveConsumptionRecordUseCase(
    ref.watch(consumptionRepositoryProvider),
  );
}

/// Provides the GetConsumptionRecordsByItemIdUseCase.
@riverpod
GetConsumptionRecordsByItemIdUseCase getConsumptionRecordsByItemIdUseCase(
  GetConsumptionRecordsByItemIdUseCaseRef ref,
) {
  return GetConsumptionRecordsByItemIdUseCase(
    ref.watch(consumptionRepositoryProvider),
  );
}

/// Provides the GetConsumptionRecordsByDateRangeUseCase.
@riverpod
GetConsumptionRecordsByDateRangeUseCase
getConsumptionRecordsByDateRangeUseCase(
  GetConsumptionRecordsByDateRangeUseCaseRef ref,
) {
  return GetConsumptionRecordsByDateRangeUseCase(
    ref.watch(consumptionRepositoryProvider),
  );
}

/// Provides the GetAppSettingsUseCase.
@riverpod
GetAppSettingsUseCase getAppSettingsUseCase(GetAppSettingsUseCaseRef ref) {
  return GetAppSettingsUseCase(ref.watch(settingsRepositoryProvider));
}

/// Provides the WatchAppSettingsUseCase.
@riverpod
WatchAppSettingsUseCase watchAppSettingsUseCase(WatchAppSettingsUseCaseRef ref) {
  return WatchAppSettingsUseCase(ref.watch(settingsRepositoryProvider));
}

/// Provides the SaveAppSettingsUseCase.
@riverpod
SaveAppSettingsUseCase saveAppSettingsUseCase(SaveAppSettingsUseCaseRef ref) {
  return SaveAppSettingsUseCase(ref.watch(settingsRepositoryProvider));
}

/// Provides the ResetAppSettingsUseCase.
@riverpod
ResetAppSettingsUseCase resetAppSettingsUseCase(ResetAppSettingsUseCaseRef ref) {
  return ResetAppSettingsUseCase(ref.watch(settingsRepositoryProvider));
}