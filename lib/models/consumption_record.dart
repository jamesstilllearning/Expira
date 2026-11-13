import 'package:flutter/material.dart';

/// One unit of an item that the user marked as used.
@immutable
class ConsumptionRecord {
  const ConsumptionRecord({
    required this.itemName,
    required this.category,
    required this.expiryDate,
    required this.usedOn,
    required this.wasExpiringAtUse,
  });

  final String itemName;
  final String category;
  final DateTime expiryDate;
  final DateTime usedOn;

  /// Whether the item was in the "expiring" window when it was used.
  final bool wasExpiringAtUse;

  /// True when the item was used on or before its expiry day.
  bool get usedBeforeExpiry => !usedOn.isAfter(expiryDate);

  Map<String, dynamic> toJson() => {
        'itemName': itemName,
        'category': category,
        'expiryDate': expiryDate.toIso8601String(),
        'usedOn': usedOn.toIso8601String(),
        'wasExpiringAtUse': wasExpiringAtUse,
      };

  factory ConsumptionRecord.fromJson(Map<String, dynamic> json) =>
      ConsumptionRecord(
        itemName: json['itemName'] as String,
        category: json['category'] as String? ?? 'Other',
        expiryDate: DateTime.parse(json['expiryDate'] as String),
        usedOn: DateTime.parse(json['usedOn'] as String),
        wasExpiringAtUse: json['wasExpiringAtUse'] as bool? ?? false,
      );
}
