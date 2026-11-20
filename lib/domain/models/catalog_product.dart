import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'catalog_product.freezed.dart';
part 'catalog_product.g.dart';

/// Product catalog entry from barcode lookup.
@freezed
abstract class CatalogProduct with _$CatalogProduct {
  const CatalogProduct._();

  const factory CatalogProduct({
    /// Barcode (primary key)
    @Default('') String barcode,

    /// Product name
    @Default('') String name,

    /// Brand
    @Default('') String brand,

    /// Category
    @Default('') String category,

    /// Package size (e.g., "500g", "1L")
    @Default('') String packageSize,

    /// Package unit (e.g., "g", "ml", "pcs")
    @Default('') String packageUnit,

    /// Description
    @Default('') String description,

    /// Image URL
    @Default('') String imageUrl,

    /// Data provider (openfoodfacts, upcitemdb, etc.)
    @Default('') String provider,

    /// Provider-specific ID
    @Default('') String providerId,

    /// Last verified timestamp
    DateTime? lastVerified,

    /// Lookup status
    @Default(LookupStatus.pending()) LookupStatus lookupStatus,

    /// Last lookup attempt timestamp
    DateTime? lastAttempt,
  }) = _CatalogProduct;

  factory CatalogProduct.fromJson(Map<String, dynamic> json) => _$CatalogProductFromJson(json);

  /// Returns true if this product has valid data.
  bool get isValid => barcode.isNotEmpty && name.isNotEmpty;

  /// Returns true if the cache is stale (older than 30 days).
  bool get isCacheStale {
    if (lastVerified == null) return true;
    final age = DateTime.now().difference(lastVerified!);
    return age.inDays > 30;
  }
}

/// Lookup status for catalog products.
@freezed
abstract class LookupStatus with _$LookupStatus {
  const LookupStatus._();

  const factory LookupStatus.pending() = Pending;
  const factory LookupStatus.found() = Found;
  const factory LookupStatus.notFound() = NotFound;
  const factory LookupStatus.error() = Error;

  factory LookupStatus.fromJson(Map<String, dynamic> json) => _$LookupStatusFromJson(json);
}