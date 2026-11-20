// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodItemImpl _$$FoodItemImplFromJson(Map<String, dynamic> json) =>
    _$FoodItemImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      category: json['category'] as String? ?? '',
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      barcode: json['barcode'] as String? ?? '',
      location: json['location'] == null
          ? const StorageLocation.pantry()
          : StorageLocation.fromJson(json['location'] as Map<String, dynamic>),
      brand: json['brand'] as String? ?? '',
      purchaseDate: json['purchaseDate'] == null
          ? null
          : DateTime.parse(json['purchaseDate'] as String),
      imageUrl: json['imageUrl'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
      householdId: json['householdId'] as String? ?? '',
      addedBy: json['addedBy'] as String? ?? '',
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      version: (json['version'] as num?)?.toInt() ?? 1,
      syncedAt: json['syncedAt'] == null
          ? null
          : DateTime.parse(json['syncedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      productId: json['productId'] as String? ?? '',
      serverId: json['serverId'] as String? ?? '',
    );

Map<String, dynamic> _$$FoodItemImplToJson(_$FoodItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'expiryDate': instance.expiryDate.toIso8601String(),
      'quantity': instance.quantity,
      'barcode': instance.barcode,
      'location': instance.location,
      'brand': instance.brand,
      'purchaseDate': instance.purchaseDate?.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'notes': instance.notes,
      'householdId': instance.householdId,
      'addedBy': instance.addedBy,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'version': instance.version,
      'syncedAt': instance.syncedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'productId': instance.productId,
      'serverId': instance.serverId,
    };
