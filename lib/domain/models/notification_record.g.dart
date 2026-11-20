// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationRecordImpl _$$NotificationRecordImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationRecordImpl(
      id: json['id'] as String? ?? '',
      type: json['type'] == null
          ? const NotificationType.expiryReminder()
          : NotificationType.fromJson(json['type'] as Map<String, dynamic>),
      itemId: json['itemId'] as String? ?? '',
      itemName: json['itemName'] as String? ?? '',
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      read: json['read'] as bool? ?? false,
      timestamp: DateTime.parse(json['timestamp'] as String),
      payload: json['payload'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$$NotificationRecordImplToJson(
        _$NotificationRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'title': instance.title,
      'body': instance.body,
      'read': instance.read,
      'timestamp': instance.timestamp.toIso8601String(),
      'payload': instance.payload,
    };

_$ExpiryReminderImpl _$$ExpiryReminderImplFromJson(Map<String, dynamic> json) =>
    _$ExpiryReminderImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExpiryReminderImplToJson(
        _$ExpiryReminderImpl instance) =>
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

_$ItemUsedImpl _$$ItemUsedImplFromJson(Map<String, dynamic> json) =>
    _$ItemUsedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ItemUsedImplToJson(_$ItemUsedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$HouseholdInviteImpl _$$HouseholdInviteImplFromJson(
        Map<String, dynamic> json) =>
    _$HouseholdInviteImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$HouseholdInviteImplToJson(
        _$HouseholdInviteImpl instance) =>
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

_$AllImpl _$$AllImplFromJson(Map<String, dynamic> json) => _$AllImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AllImplToJson(_$AllImpl instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UnreadImpl _$$UnreadImplFromJson(Map<String, dynamic> json) => _$UnreadImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UnreadImplToJson(_$UnreadImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ReadImpl _$$ReadImplFromJson(Map<String, dynamic> json) => _$ReadImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ReadImplToJson(_$ReadImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ExpiryDayImpl _$$ExpiryDayImplFromJson(Map<String, dynamic> json) =>
    _$ExpiryDayImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExpiryDayImplToJson(_$ExpiryDayImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UpcomingImpl _$$UpcomingImplFromJson(Map<String, dynamic> json) =>
    _$UpcomingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UpcomingImplToJson(_$UpcomingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
