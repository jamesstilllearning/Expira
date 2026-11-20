// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseholdImpl _$$HouseholdImplFromJson(Map<String, dynamic> json) =>
    _$HouseholdImpl(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      createdBy: json['createdBy'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      settings: json['settings'] == null
          ? const HouseholdSettings()
          : _householdSettingsFromJson(
              json['settings'] as Map<String, dynamic>),
      adminCount: (json['adminCount'] as num?)?.toInt() ?? 1,
      serverId: json['serverId'] as String? ?? '',
    );

Map<String, dynamic> _$$HouseholdImplToJson(_$HouseholdImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'settings': _householdSettingsToJson(instance.settings),
      'adminCount': instance.adminCount,
      'serverId': instance.serverId,
    };

_$MembershipImpl _$$MembershipImplFromJson(Map<String, dynamic> json) =>
    _$MembershipImpl(
      householdId: json['householdId'] as String? ?? '',
      userId: json['userId'] as String? ?? '',
      role: json['role'] == null
          ? const MemberRole.member()
          : MemberRole.fromJson(json['role'] as Map<String, dynamic>),
      joinedAt: json['joinedAt'] == null
          ? null
          : DateTime.parse(json['joinedAt'] as String),
      invitedBy: json['invitedBy'] as String? ?? '',
      status: json['status'] == null
          ? const MembershipStatus.active()
          : MembershipStatus.fromJson(json['status'] as Map<String, dynamic>),
      serverId: json['serverId'] as String? ?? '',
    );

Map<String, dynamic> _$$MembershipImplToJson(_$MembershipImpl instance) =>
    <String, dynamic>{
      'householdId': instance.householdId,
      'userId': instance.userId,
      'role': instance.role,
      'joinedAt': instance.joinedAt?.toIso8601String(),
      'invitedBy': instance.invitedBy,
      'status': instance.status,
      'serverId': instance.serverId,
    };

_$AdminImpl _$$AdminImplFromJson(Map<String, dynamic> json) => _$AdminImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AdminImplToJson(_$AdminImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MemberImpl _$$MemberImplFromJson(Map<String, dynamic> json) => _$MemberImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MemberImplToJson(_$MemberImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$MembershipPendingImpl _$$MembershipPendingImplFromJson(
        Map<String, dynamic> json) =>
    _$MembershipPendingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MembershipPendingImplToJson(
        _$MembershipPendingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ActiveImpl _$$ActiveImplFromJson(Map<String, dynamic> json) => _$ActiveImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ActiveImplToJson(_$ActiveImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$RemovedImpl _$$RemovedImplFromJson(Map<String, dynamic> json) =>
    _$RemovedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$RemovedImplToJson(_$RemovedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$InvitationImpl _$$InvitationImplFromJson(Map<String, dynamic> json) =>
    _$InvitationImpl(
      id: json['id'] as String? ?? '',
      householdId: json['householdId'] as String? ?? '',
      email: json['email'] as String? ?? '',
      role: json['role'] == null
          ? const MemberRole.member()
          : MemberRole.fromJson(json['role'] as Map<String, dynamic>),
      invitedBy: json['invitedBy'] as String? ?? '',
      invitedByName: json['invitedByName'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      expiresAt: json['expiresAt'] == null
          ? null
          : DateTime.parse(json['expiresAt'] as String),
      status: json['status'] == null
          ? const InvitationStatus.pending()
          : InvitationStatus.fromJson(json['status'] as Map<String, dynamic>),
      serverId: json['serverId'] as String? ?? '',
    );

Map<String, dynamic> _$$InvitationImplToJson(_$InvitationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'householdId': instance.householdId,
      'email': instance.email,
      'role': instance.role,
      'invitedBy': instance.invitedBy,
      'invitedByName': instance.invitedByName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'expiresAt': instance.expiresAt?.toIso8601String(),
      'status': instance.status,
      'serverId': instance.serverId,
    };

_$InvitationPendingImpl _$$InvitationPendingImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationPendingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$InvitationPendingImplToJson(
        _$InvitationPendingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$AcceptedImpl _$$AcceptedImplFromJson(Map<String, dynamic> json) =>
    _$AcceptedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$AcceptedImplToJson(_$AcceptedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$DeclinedImpl _$$DeclinedImplFromJson(Map<String, dynamic> json) =>
    _$DeclinedImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DeclinedImplToJson(_$DeclinedImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ExpiredImpl _$$ExpiredImplFromJson(Map<String, dynamic> json) =>
    _$ExpiredImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ExpiredImplToJson(_$ExpiredImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
