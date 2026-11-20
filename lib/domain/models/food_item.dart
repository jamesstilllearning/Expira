import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'storage_location.dart';
import 'expiry_status.dart';
import 'consumption_record.dart';

part 'food_item.freezed.dart';
part 'food_item.g.dart';

/// Domain model for a food item in the inventory.
@freezed
sealed class FoodItem with _$FoodItem {
  const FoodItem._();

  const factory FoodItem({
    /// Unique identifier (deterministic hash for deduplication)
    @Default('') String id,

    /// Item name
    @Default('') String name,

    /// Category (e.g., "Dairy", "Produce", "Meat")
    @Default('') String category,

    /// Expiry date (UTC midnight)
    required DateTime expiryDate,

    /// Quantity
    @Default(1) int quantity,

    /// Barcode (EAN/UPC)
    @Default('') String barcode,

    /// Storage location
    @Default(StorageLocation.pantry()) StorageLocation location,

    /// Brand name
    @Default('') String brand,

    /// Purchase date (UTC midnight)
    DateTime? purchaseDate,

    /// Image URL (local or cloud)
    @Default('') String imageUrl,

    /// Notes
    @Default('') String notes,

    /// Household ID (for multi-user sync)
    @Default('') String householdId,

    /// User ID who added this item
    @Default('') String addedBy,

    /// Last updated timestamp (UTC)
    DateTime? updatedAt,

    /// Optimistic locking version
    @Default(1) int version,

    /// Last sync timestamp (UTC)
    DateTime? syncedAt,

    /// Soft delete timestamp (UTC)
    DateTime? deletedAt,

    /// Product ID from catalog lookup
    @Default('') String productId,

    /// Server document ID (Firestore)
    @Default('') String serverId,
  }) = _FoodItem;

  factory FoodItem.fromJson(Map<String, dynamic> json) => _$FoodItemFromJson(json);

  /// Returns the number of days until expiry (negative if expired).
  int get daysLeft {
    final now = DateTime.now().toUtc();
    final expiryUtc = DateTime.utc(expiryDate.year, expiryDate.month, expiryDate.day);
    return expiryUtc.difference(now).inDays;
  }

  /// Returns the expiry status based on days left and thresholds.
  ExpiryStatus get status {
    final days = daysLeft;
    if (days < 0) return ExpiryStatus.expired();
    if (days == 0) return ExpiryStatus.expiring();
    if (days <= 2) return ExpiryStatus.soon();
    return ExpiryStatus.safe();
  }

  /// Returns true if the item is expired.
  bool get isExpired => daysLeft < 0;

  /// Returns true if the item expires today.
  bool get expiresToday => daysLeft == 0;

  /// Returns true if the item is expiring soon (within 3 days).
  bool get isExpiringSoon => daysLeft > 0 && daysLeft <= 3;

  /// Creates a copy with updated sync metadata.
  FoodItem markSynced({DateTime? syncedAt, int? version, String? serverId}) {
    return copyWith(
      syncedAt: syncedAt ?? DateTime.now().toUtc(),
      version: version ?? this.version + 1,
      serverId: serverId ?? this.serverId,
    );
  }

  /// Creates a copy marked as deleted (soft delete).
  FoodItem markDeleted() {
    return copyWith(
      deletedAt: DateTime.now().toUtc(),
      version: version + 1,
    );
  }

  /// Returns true if this item matches the given barcode.
  bool matchesBarcode(String barcode) {
    return this.barcode.isNotEmpty && this.barcode == barcode;
  }

  /// Returns true if this item is a duplicate of another (same deterministic ID).
  bool isDuplicateOf(FoodItem other) {
    return id.isNotEmpty && id == other.id;
  }

  /// Converts this item to a consumption record.
  ConsumptionRecord toConsumptionRecord({required String usedBy}) {
    return ConsumptionRecord(
      id: '',
      itemId: id,
      itemName: name,
      category: category,
      expiryDate: expiryDate,
      usedOn: DateTime.now().toUtc(),
      usedBy: usedBy,
      wasExpiringAtUse: isExpired || expiresToday,
    );
  }
}