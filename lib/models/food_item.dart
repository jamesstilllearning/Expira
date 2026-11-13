import 'package:flutter/material.dart';

import 'storage_location.dart';

enum ExpiryStatus { expired, expiring, soon, safe }

/// Day windows that decide how an item's expiry is classified.
@immutable
class ExpiryThresholds {
  const ExpiryThresholds({
    required this.expiringWithinDays,
    required this.soonWithinDays,
  });

  /// Strict: warn 2 days before expiry, and flag "soon" within a week.
  static const strict =
      ExpiryThresholds(expiringWithinDays: 2, soonWithinDays: 7);

  /// Relaxed: warn only in the final day, and flag "soon" within 3 days.
  static const relaxed =
      ExpiryThresholds(expiringWithinDays: 1, soonWithinDays: 3);

  final int expiringWithinDays;
  final int soonWithinDays;

  ExpiryStatus classify(int daysLeft) {
    if (daysLeft < 0) return ExpiryStatus.expired;
    if (daysLeft <= expiringWithinDays) return ExpiryStatus.expiring;
    if (daysLeft <= soonWithinDays) return ExpiryStatus.soon;
    return ExpiryStatus.safe;
  }
}

@immutable
class FoodItem {
  const FoodItem({
    required this.id,
    required this.name,
    required this.category,
    required this.expiryDate,
    this.quantity = 1,
    this.barcode,
    this.location,
    this.productId,
    this.brand,
    this.purchaseDate,
    this.imageUrl,
    this.notes,
  });

  final String id;
  final String name;
  final String category;
  final DateTime expiryDate;
  final int quantity;
  final String? barcode;
  final StorageLocation? location;
  final String? productId;
  final String? brand;
  final DateTime? purchaseDate;
  final String? imageUrl;
  final String? notes;

  int get daysLeft {
    final today = DateUtils.dateOnly(DateTime.now());
    return DateUtils.dateOnly(expiryDate).difference(today).inDays;
  }

  FoodItem copyWith({
    String? name,
    String? category,
    DateTime? expiryDate,
    int? quantity,
    String? barcode,
    String? brand,
    DateTime? purchaseDate,
    String? imageUrl,
    String? notes,
  }) {
    return FoodItem(
      id: id,
      name: name ?? this.name,
      category: category ?? this.category,
      expiryDate: expiryDate ?? this.expiryDate,
      quantity: quantity ?? this.quantity,
      barcode: barcode ?? this.barcode,
      location: location,
      productId: productId,
      brand: brand ?? this.brand,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      imageUrl: imageUrl ?? this.imageUrl,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'expiryDate': expiryDate.toIso8601String(),
        'quantity': quantity,
        'barcode': barcode,
        'location': location?.name,
        'productId': productId,
        'brand': brand,
        'purchaseDate': purchaseDate?.toIso8601String(),
        'imageUrl': imageUrl,
        'notes': notes,
      };

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
        id: json['id'] as String,
        name: json['name'] as String,
        category: json['category'] as String? ?? 'Other',
        expiryDate: DateTime.parse(json['expiryDate'] as String),
        quantity: (json['quantity'] as num?)?.toInt() ?? 1,
        barcode: json['barcode'] as String?,
        location: StorageLocation.fromKey(json['location'] as String?),
        productId: json['productId'] as String?,
        brand: json['brand'] as String?,
        purchaseDate: json['purchaseDate'] == null
            ? null
            : DateTime.parse(json['purchaseDate'] as String),
        imageUrl: json['imageUrl'] as String?,
        notes: json['notes'] as String?,
      );
}
