// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsumptionRecordImpl _$$ConsumptionRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$ConsumptionRecordImpl(
      id: json['id'] as String? ?? '',
      itemId: json['itemId'] as String? ?? '',
      itemName: json['itemName'] as String? ?? '',
      category: json['category'] as String? ?? '',
      expiryDate: DateTime.parse(json['expiryDate'] as String),
      usedOn: DateTime.parse(json['usedOn'] as String),
      usedBy: json['usedBy'] as String? ?? '',
      householdId: json['householdId'] as String? ?? '',
      wasExpiringAtUse: json['wasExpiringAtUse'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      serverId: json['serverId'] as String? ?? '',
    );

Map<String, dynamic> _$$ConsumptionRecordImplToJson(
        _$ConsumptionRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'category': instance.category,
      'expiryDate': instance.expiryDate.toIso8601String(),
      'usedOn': instance.usedOn.toIso8601String(),
      'usedBy': instance.usedBy,
      'householdId': instance.householdId,
      'wasExpiringAtUse': instance.wasExpiringAtUse,
      'createdAt': instance.createdAt?.toIso8601String(),
      'serverId': instance.serverId,
    };
