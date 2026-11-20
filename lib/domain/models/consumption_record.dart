import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

import 'storage_location.dart';

part 'consumption_record.freezed.dart';
part 'consumption_record.g.dart';

/// Domain model for a consumption record (item marked as used).
@freezed
abstract class ConsumptionRecord with _$ConsumptionRecord {
  const ConsumptionRecord._();

  const factory ConsumptionRecord({
    /// Unique identifier
    @Default('') String id,

    /// Reference to the inventory item
    @Default('') String itemId,

    /// Item name (denormalized for history)
    @Default('') String itemName,

    /// Category (denormalized)
    @Default('') String category,

    /// Expiry date at time of consumption
    required DateTime expiryDate,

    /// When the item was used (UTC)
    required DateTime usedOn,

    /// User ID who marked it as used
    @Default('') String usedBy,

    /// Household ID
    @Default('') String householdId,

    /// Whether the item was expiring/expired at time of use
    @Default(false) bool wasExpiringAtUse,

    /// Creation timestamp (UTC)
    DateTime? createdAt,

    /// Server document ID (Firestore)
    @Default('') String serverId,
  }) = _ConsumptionRecord;

  factory ConsumptionRecord.fromJson(Map<String, dynamic> json) => _$ConsumptionRecordFromJson(json);

  /// Returns true if the item was used before its expiry date.
  bool get usedBeforeExpiry {
    final expiryUtc = DateTime.utc(expiryDate.year, expiryDate.month, expiryDate.day);
    final usedUtc = DateTime.utc(usedOn.year, usedOn.month, usedOn.day);
    return !usedUtc.isAfter(expiryUtc);
  }

  /// Returns the number of days before/after expiry when used.
  int get daysRelativeToExpiry {
    final expiryUtc = DateTime.utc(expiryDate.year, expiryDate.month, expiryDate.day);
    final usedUtc = DateTime.utc(usedOn.year, usedOn.month, usedOn.day);
    return expiryUtc.difference(usedUtc).inDays;
  }

  /// Creates a copy with server sync metadata.
  ConsumptionRecord markSynced({String? serverId}) {
    return copyWith(serverId: serverId ?? this.serverId);
  }
}