// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      uid: json['uid'] as String? ?? '',
      email: json['email'] as String? ?? '',
      displayName: json['displayName'] as String? ?? '',
      photoURL: json['photoURL'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      settings: json['settings'] == null
          ? const UserSettings()
          : _userSettingsFromJson(json['settings'] as Map<String, dynamic>),
      householdIds: (json['householdIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fcmToken: json['fcmToken'] as String? ?? '',
      platform: json['platform'] as String? ?? '',
      lastLoginAt: json['lastLoginAt'] == null
          ? null
          : DateTime.parse(json['lastLoginAt'] as String),
      serverId: json['serverId'] as String? ?? '',
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoURL': instance.photoURL,
      'createdAt': instance.createdAt?.toIso8601String(),
      'settings': _userSettingsToJson(instance.settings),
      'householdIds': instance.householdIds,
      'fcmToken': instance.fcmToken,
      'platform': instance.platform,
      'lastLoginAt': instance.lastLoginAt?.toIso8601String(),
      'serverId': instance.serverId,
    };
