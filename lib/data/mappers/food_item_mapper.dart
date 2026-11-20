import 'package:expira/domain/models/food_item.dart';
import 'package:expira/domain/models/storage_location.dart';
import 'package:expira/models/food_item.dart' as legacy;
import 'package:expira/models/storage_location.dart' as legacy_loc;

/// Mapper to convert between domain and legacy FoodItem models.
class FoodItemMapper {
  FoodItemMapper._();

  /// Converts a legacy FoodItem to a domain FoodItem.
  static FoodItem toDomain(legacy.FoodItem legacy) {
    return FoodItem(
      id: legacy.id,
      name: legacy.name,
      category: legacy.category,
      expiryDate: legacy.expiryDate,
      quantity: legacy.quantity,
      barcode: legacy.barcode ?? '',
      location: _mapStorageLocation(legacy.location),
      brand: legacy.brand ?? '',
      purchaseDate: legacy.purchaseDate,
      imageUrl: legacy.imageUrl ?? '',
      notes: legacy.notes ?? '',
      productId: legacy.productId ?? '',
    );
  }

  /// Converts a domain FoodItem to a legacy FoodItem.
  static legacy.FoodItem toLegacy(FoodItem domain) {
    return legacy.FoodItem(
      id: domain.id,
      name: domain.name,
      category: domain.category,
      expiryDate: domain.expiryDate,
      quantity: domain.quantity,
      barcode: domain.barcode.isEmpty ? null : domain.barcode,
      location: _mapStorageLocationReverse(domain.location),
      productId: domain.productId.isEmpty ? null : domain.productId,
      brand: domain.brand.isEmpty ? null : domain.brand,
      purchaseDate: domain.purchaseDate,
      imageUrl: domain.imageUrl.isEmpty ? null : domain.imageUrl,
      notes: domain.notes.isEmpty ? null : domain.notes,
    );
  }

  /// Converts a list of legacy items to domain items.
  static List<FoodItem> toDomainList(List<legacy.FoodItem> legacy) {
    return legacy.map(toDomain).toList();
  }

  /// Converts a list of domain items to legacy items.
  static List<legacy.FoodItem> toLegacyList(List<FoodItem> domain) {
    return domain.map(toLegacy).toList();
  }

  static StorageLocation _mapStorageLocation(legacy_loc.StorageLocation? legacy) {
    if (legacy == null) return const Pantry();
    switch (legacy) {
      case legacy_loc.StorageLocation.fridge:
        return const Fridge();
      case legacy_loc.StorageLocation.freezer:
        return const Freezer();
      case legacy_loc.StorageLocation.pantry:
        return const Pantry();
      case legacy_loc.StorageLocation.bathroom:
        return const Bathroom();
      case legacy_loc.StorageLocation.beautyProducts:
        return const BeautyProducts();
      case legacy_loc.StorageLocation.other:
        return const Other();
    }
  }

  static legacy_loc.StorageLocation? _mapStorageLocationReverse(StorageLocation domain) {
    return domain.map(
      fridge: (_) => legacy_loc.StorageLocation.fridge,
      freezer: (_) => legacy_loc.StorageLocation.freezer,
      pantry: (_) => legacy_loc.StorageLocation.pantry,
      bathroom: (_) => legacy_loc.StorageLocation.bathroom,
      beautyProducts: (_) => legacy_loc.StorageLocation.beautyProducts,
      other: (_) => legacy_loc.StorageLocation.other,
    );
  }
}