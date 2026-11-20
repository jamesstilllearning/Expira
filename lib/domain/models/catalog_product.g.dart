// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CatalogProductImpl _$$CatalogProductImplFromJson(Map<String, dynamic> json) =>
    _$CatalogProductImpl(
      barcode: json['barcode'] as String? ?? '',
      name: json['name'] as String? ?? '',
      brand: json['brand'] as String? ?? '',
      category: json['category'] as String? ?? '',
      packageSize: json['packageSize'] as String? ?? '',
      packageUnit: json['packageUnit'] as String? ?? '',
      description: json['description'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      provider: json['provider'] as String? ?? '',
      providerId: json['providerId'] as String? ?? '',
      lastVerified: json['lastVerified'] == null
          ? null
          : DateTime.parse(json['lastVerified'] as String),
      lookupStatus: json['lookupStatus'] == null
          ? const LookupStatus.pending()
          : LookupStatus.fromJson(json['lookupStatus'] as Map<String, dynamic>),
      lastAttempt: json['lastAttempt'] == null
          ? null
          : DateTime.parse(json['lastAttempt'] as String),
    );

Map<String, dynamic> _$$CatalogProductImplToJson(
        _$CatalogProductImpl instance) =>
    <String, dynamic>{
      'barcode': instance.barcode,
      'name': instance.name,
      'brand': instance.brand,
      'category': instance.category,
      'packageSize': instance.packageSize,
      'packageUnit': instance.packageUnit,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'provider': instance.provider,
      'providerId': instance.providerId,
      'lastVerified': instance.lastVerified?.toIso8601String(),
      'lookupStatus': instance.lookupStatus,
      'lastAttempt': instance.lastAttempt?.toIso8601String(),
    };

_$PendingImpl _$$PendingImplFromJson(Map<String, dynamic> json) =>
    _$PendingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$PendingImplToJson(_$PendingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$FoundImpl _$$FoundImplFromJson(Map<String, dynamic> json) => _$FoundImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$FoundImplToJson(_$FoundImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$NotFoundImpl _$$NotFoundImplFromJson(Map<String, dynamic> json) =>
    _$NotFoundImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$NotFoundImplToJson(_$NotFoundImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
