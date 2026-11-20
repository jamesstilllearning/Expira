// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemAddedImpl _$$ItemAddedImplFromJson(Map<String, dynamic> json) =>
    _$ItemAddedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItemAddedImplToJson(_$ItemAddedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ItemUpdatedImpl _$$ItemUpdatedImplFromJson(Map<String, dynamic> json) =>
    _$ItemUpdatedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItemUpdatedImplToJson(_$ItemUpdatedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ItemUsedImpl _$$ItemUsedImplFromJson(Map<String, dynamic> json) =>
    _$ItemUsedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItemUsedImplToJson(_$ItemUsedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ItemExpiredImpl _$$ItemExpiredImplFromJson(Map<String, dynamic> json) =>
    _$ItemExpiredImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItemExpiredImplToJson(_$ItemExpiredImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ItemDeletedImpl _$$ItemDeletedImplFromJson(Map<String, dynamic> json) =>
    _$ItemDeletedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItemDeletedImplToJson(_$ItemDeletedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MemberJoinedImpl _$$MemberJoinedImplFromJson(Map<String, dynamic> json) =>
    _$MemberJoinedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MemberJoinedImplToJson(_$MemberJoinedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MemberLeftImpl _$$MemberLeftImplFromJson(Map<String, dynamic> json) =>
    _$MemberLeftImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MemberLeftImplToJson(_$MemberLeftImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MemberRoleChangedImpl _$$MemberRoleChangedImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberRoleChangedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MemberRoleChangedImplToJson(
        _$MemberRoleChangedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$SettingsChangedImpl _$$SettingsChangedImplFromJson(
        Map<String, dynamic> json) =>
    _$SettingsChangedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SettingsChangedImplToJson(
        _$SettingsChangedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$HouseholdCreatedImpl _$$HouseholdCreatedImplFromJson(
        Map<String, dynamic> json) =>
    _$HouseholdCreatedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HouseholdCreatedImplToJson(
        _$HouseholdCreatedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ActivityEventImpl _$$ActivityEventImplFromJson(Map<String, dynamic> json) =>
    _$ActivityEventImpl(
      id: json['id'] as String? ?? '',
      householdId: json['householdId'] as String? ?? '',
      type: ActivityType.fromJson(json['type'] as Map<String, dynamic>),
      actorUid: json['actorUid'] as String? ?? '',
      actorName: json['actorName'] as String? ?? '',
      payload: json['payload'] as Map<String, dynamic>? ?? const {},
      timestamp: DateTime.parse(json['timestamp'] as String),
      serverId: json['serverId'] as String? ?? '',
    );

Map<String, dynamic> _$$ActivityEventImplToJson(_$ActivityEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'householdId': instance.householdId,
      'type': instance.type,
      'actorUid': instance.actorUid,
      'actorName': instance.actorName,
      'payload': instance.payload,
      'timestamp': instance.timestamp.toIso8601String(),
      'serverId': instance.serverId,
    };
