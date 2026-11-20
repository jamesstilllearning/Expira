// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'household.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Household _$HouseholdFromJson(Map<String, dynamic> json) {
  return _Household.fromJson(json);
}

/// @nodoc
mixin _$Household {
  /// Unique household ID
  String get id => throw _privateConstructorUsedError;

  /// Household name
  String get name => throw _privateConstructorUsedError;

  /// Creator user ID
  String get createdBy => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Household settings
  @JsonKey(
      fromJson: _householdSettingsFromJson, toJson: _householdSettingsToJson)
  HouseholdSettings get settings => throw _privateConstructorUsedError;

  /// Number of admins (for security rules)
  int get adminCount => throw _privateConstructorUsedError;

  /// Server document ID
  String get serverId => throw _privateConstructorUsedError;

  /// Serializes this Household to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Household
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseholdCopyWith<Household> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdCopyWith<$Res> {
  factory $HouseholdCopyWith(Household value, $Res Function(Household) then) =
      _$HouseholdCopyWithImpl<$Res, Household>;
  @useResult
  $Res call(
      {String id,
      String name,
      String createdBy,
      DateTime? createdAt,
      @JsonKey(
          fromJson: _householdSettingsFromJson,
          toJson: _householdSettingsToJson)
      HouseholdSettings settings,
      int adminCount,
      String serverId});
}

/// @nodoc
class _$HouseholdCopyWithImpl<$Res, $Val extends Household>
    implements $HouseholdCopyWith<$Res> {
  _$HouseholdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Household
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdBy = null,
    Object? createdAt = freezed,
    Object? settings = null,
    Object? adminCount = null,
    Object? serverId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as HouseholdSettings,
      adminCount: null == adminCount
          ? _value.adminCount
          : adminCount // ignore: cast_nullable_to_non_nullable
              as int,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdImplCopyWith<$Res>
    implements $HouseholdCopyWith<$Res> {
  factory _$$HouseholdImplCopyWith(
          _$HouseholdImpl value, $Res Function(_$HouseholdImpl) then) =
      __$$HouseholdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String createdBy,
      DateTime? createdAt,
      @JsonKey(
          fromJson: _householdSettingsFromJson,
          toJson: _householdSettingsToJson)
      HouseholdSettings settings,
      int adminCount,
      String serverId});
}

/// @nodoc
class __$$HouseholdImplCopyWithImpl<$Res>
    extends _$HouseholdCopyWithImpl<$Res, _$HouseholdImpl>
    implements _$$HouseholdImplCopyWith<$Res> {
  __$$HouseholdImplCopyWithImpl(
      _$HouseholdImpl _value, $Res Function(_$HouseholdImpl) _then)
      : super(_value, _then);

  /// Create a copy of Household
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdBy = null,
    Object? createdAt = freezed,
    Object? settings = null,
    Object? adminCount = null,
    Object? serverId = null,
  }) {
    return _then(_$HouseholdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as HouseholdSettings,
      adminCount: null == adminCount
          ? _value.adminCount
          : adminCount // ignore: cast_nullable_to_non_nullable
              as int,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseholdImpl extends _Household {
  const _$HouseholdImpl(
      {this.id = '',
      this.name = '',
      this.createdBy = '',
      this.createdAt,
      @JsonKey(
          fromJson: _householdSettingsFromJson,
          toJson: _householdSettingsToJson)
      this.settings = const HouseholdSettings(),
      this.adminCount = 1,
      this.serverId = ''})
      : super._();

  factory _$HouseholdImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseholdImplFromJson(json);

  /// Unique household ID
  @override
  @JsonKey()
  final String id;

  /// Household name
  @override
  @JsonKey()
  final String name;

  /// Creator user ID
  @override
  @JsonKey()
  final String createdBy;

  /// Creation timestamp
  @override
  final DateTime? createdAt;

  /// Household settings
  @override
  @JsonKey(
      fromJson: _householdSettingsFromJson, toJson: _householdSettingsToJson)
  final HouseholdSettings settings;

  /// Number of admins (for security rules)
  @override
  @JsonKey()
  final int adminCount;

  /// Server document ID
  @override
  @JsonKey()
  final String serverId;

  @override
  String toString() {
    return 'Household(id: $id, name: $name, createdBy: $createdBy, createdAt: $createdAt, settings: $settings, adminCount: $adminCount, serverId: $serverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            (identical(other.adminCount, adminCount) ||
                other.adminCount == adminCount) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdBy, createdAt,
      settings, adminCount, serverId);

  /// Create a copy of Household
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdImplCopyWith<_$HouseholdImpl> get copyWith =>
      __$$HouseholdImplCopyWithImpl<_$HouseholdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseholdImplToJson(
      this,
    );
  }
}

abstract class _Household extends Household {
  const factory _Household(
      {final String id,
      final String name,
      final String createdBy,
      final DateTime? createdAt,
      @JsonKey(
          fromJson: _householdSettingsFromJson,
          toJson: _householdSettingsToJson)
      final HouseholdSettings settings,
      final int adminCount,
      final String serverId}) = _$HouseholdImpl;
  const _Household._() : super._();

  factory _Household.fromJson(Map<String, dynamic> json) =
      _$HouseholdImpl.fromJson;

  /// Unique household ID
  @override
  String get id;

  /// Household name
  @override
  String get name;

  /// Creator user ID
  @override
  String get createdBy;

  /// Creation timestamp
  @override
  DateTime? get createdAt;

  /// Household settings
  @override
  @JsonKey(
      fromJson: _householdSettingsFromJson, toJson: _householdSettingsToJson)
  HouseholdSettings get settings;

  /// Number of admins (for security rules)
  @override
  int get adminCount;

  /// Server document ID
  @override
  String get serverId;

  /// Create a copy of Household
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseholdImplCopyWith<_$HouseholdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Membership _$MembershipFromJson(Map<String, dynamic> json) {
  return _Membership.fromJson(json);
}

/// @nodoc
mixin _$Membership {
  /// Household ID
  String get householdId => throw _privateConstructorUsedError;

  /// User ID
  String get userId => throw _privateConstructorUsedError;

  /// Role in household
  MemberRole get role => throw _privateConstructorUsedError;

  /// When the user joined
  DateTime? get joinedAt => throw _privateConstructorUsedError;

  /// Who invited this user
  String get invitedBy => throw _privateConstructorUsedError;

  /// Membership status
  MembershipStatus get status => throw _privateConstructorUsedError;

  /// Server document ID
  String get serverId => throw _privateConstructorUsedError;

  /// Serializes this Membership to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MembershipCopyWith<Membership> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipCopyWith<$Res> {
  factory $MembershipCopyWith(
          Membership value, $Res Function(Membership) then) =
      _$MembershipCopyWithImpl<$Res, Membership>;
  @useResult
  $Res call(
      {String householdId,
      String userId,
      MemberRole role,
      DateTime? joinedAt,
      String invitedBy,
      MembershipStatus status,
      String serverId});

  $MemberRoleCopyWith<$Res> get role;
  $MembershipStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$MembershipCopyWithImpl<$Res, $Val extends Membership>
    implements $MembershipCopyWith<$Res> {
  _$MembershipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? householdId = null,
    Object? userId = null,
    Object? role = null,
    Object? joinedAt = freezed,
    Object? invitedBy = null,
    Object? status = null,
    Object? serverId = null,
  }) {
    return _then(_value.copyWith(
      householdId: null == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MemberRole,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MembershipStatus,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberRoleCopyWith<$Res> get role {
    return $MemberRoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MembershipStatusCopyWith<$Res> get status {
    return $MembershipStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MembershipImplCopyWith<$Res>
    implements $MembershipCopyWith<$Res> {
  factory _$$MembershipImplCopyWith(
          _$MembershipImpl value, $Res Function(_$MembershipImpl) then) =
      __$$MembershipImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String householdId,
      String userId,
      MemberRole role,
      DateTime? joinedAt,
      String invitedBy,
      MembershipStatus status,
      String serverId});

  @override
  $MemberRoleCopyWith<$Res> get role;
  @override
  $MembershipStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$MembershipImplCopyWithImpl<$Res>
    extends _$MembershipCopyWithImpl<$Res, _$MembershipImpl>
    implements _$$MembershipImplCopyWith<$Res> {
  __$$MembershipImplCopyWithImpl(
      _$MembershipImpl _value, $Res Function(_$MembershipImpl) _then)
      : super(_value, _then);

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? householdId = null,
    Object? userId = null,
    Object? role = null,
    Object? joinedAt = freezed,
    Object? invitedBy = null,
    Object? status = null,
    Object? serverId = null,
  }) {
    return _then(_$MembershipImpl(
      householdId: null == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MemberRole,
      joinedAt: freezed == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as MembershipStatus,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MembershipImpl extends _Membership {
  const _$MembershipImpl(
      {this.householdId = '',
      this.userId = '',
      this.role = const MemberRole.member(),
      this.joinedAt,
      this.invitedBy = '',
      this.status = const MembershipStatus.active(),
      this.serverId = ''})
      : super._();

  factory _$MembershipImpl.fromJson(Map<String, dynamic> json) =>
      _$$MembershipImplFromJson(json);

  /// Household ID
  @override
  @JsonKey()
  final String householdId;

  /// User ID
  @override
  @JsonKey()
  final String userId;

  /// Role in household
  @override
  @JsonKey()
  final MemberRole role;

  /// When the user joined
  @override
  final DateTime? joinedAt;

  /// Who invited this user
  @override
  @JsonKey()
  final String invitedBy;

  /// Membership status
  @override
  @JsonKey()
  final MembershipStatus status;

  /// Server document ID
  @override
  @JsonKey()
  final String serverId;

  @override
  String toString() {
    return 'Membership(householdId: $householdId, userId: $userId, role: $role, joinedAt: $joinedAt, invitedBy: $invitedBy, status: $status, serverId: $serverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MembershipImpl &&
            (identical(other.householdId, householdId) ||
                other.householdId == householdId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, householdId, userId, role,
      joinedAt, invitedBy, status, serverId);

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MembershipImplCopyWith<_$MembershipImpl> get copyWith =>
      __$$MembershipImplCopyWithImpl<_$MembershipImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MembershipImplToJson(
      this,
    );
  }
}

abstract class _Membership extends Membership {
  const factory _Membership(
      {final String householdId,
      final String userId,
      final MemberRole role,
      final DateTime? joinedAt,
      final String invitedBy,
      final MembershipStatus status,
      final String serverId}) = _$MembershipImpl;
  const _Membership._() : super._();

  factory _Membership.fromJson(Map<String, dynamic> json) =
      _$MembershipImpl.fromJson;

  /// Household ID
  @override
  String get householdId;

  /// User ID
  @override
  String get userId;

  /// Role in household
  @override
  MemberRole get role;

  /// When the user joined
  @override
  DateTime? get joinedAt;

  /// Who invited this user
  @override
  String get invitedBy;

  /// Membership status
  @override
  MembershipStatus get status;

  /// Server document ID
  @override
  String get serverId;

  /// Create a copy of Membership
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MembershipImplCopyWith<_$MembershipImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MemberRole _$MemberRoleFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'admin':
      return Admin.fromJson(json);
    case 'member':
      return Member.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MemberRole',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MemberRole {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() member,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? member,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? member,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(Member value) member,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(Member value)? member,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(Member value)? member,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this MemberRole to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberRoleCopyWith<$Res> {
  factory $MemberRoleCopyWith(
          MemberRole value, $Res Function(MemberRole) then) =
      _$MemberRoleCopyWithImpl<$Res, MemberRole>;
}

/// @nodoc
class _$MemberRoleCopyWithImpl<$Res, $Val extends MemberRole>
    implements $MemberRoleCopyWith<$Res> {
  _$MemberRoleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberRole
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AdminImplCopyWith<$Res> {
  factory _$$AdminImplCopyWith(
          _$AdminImpl value, $Res Function(_$AdminImpl) then) =
      __$$AdminImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AdminImplCopyWithImpl<$Res>
    extends _$MemberRoleCopyWithImpl<$Res, _$AdminImpl>
    implements _$$AdminImplCopyWith<$Res> {
  __$$AdminImplCopyWithImpl(
      _$AdminImpl _value, $Res Function(_$AdminImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberRole
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AdminImpl extends Admin {
  const _$AdminImpl({final String? $type})
      : $type = $type ?? 'admin',
        super._();

  factory _$AdminImpl.fromJson(Map<String, dynamic> json) =>
      _$$AdminImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MemberRole.admin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AdminImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() member,
  }) {
    return admin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? member,
  }) {
    return admin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? member,
    required TResult orElse(),
  }) {
    if (admin != null) {
      return admin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(Member value) member,
  }) {
    return admin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(Member value)? member,
  }) {
    return admin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(Member value)? member,
    required TResult orElse(),
  }) {
    if (admin != null) {
      return admin(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AdminImplToJson(
      this,
    );
  }
}

abstract class Admin extends MemberRole {
  const factory Admin() = _$AdminImpl;
  const Admin._() : super._();

  factory Admin.fromJson(Map<String, dynamic> json) = _$AdminImpl.fromJson;
}

/// @nodoc
abstract class _$$MemberImplCopyWith<$Res> {
  factory _$$MemberImplCopyWith(
          _$MemberImpl value, $Res Function(_$MemberImpl) then) =
      __$$MemberImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemberImplCopyWithImpl<$Res>
    extends _$MemberRoleCopyWithImpl<$Res, _$MemberImpl>
    implements _$$MemberImplCopyWith<$Res> {
  __$$MemberImplCopyWithImpl(
      _$MemberImpl _value, $Res Function(_$MemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberRole
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$MemberImpl extends Member {
  const _$MemberImpl({final String? $type})
      : $type = $type ?? 'member',
        super._();

  factory _$MemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MemberRole.member()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MemberImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() admin,
    required TResult Function() member,
  }) {
    return member();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? admin,
    TResult? Function()? member,
  }) {
    return member?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? admin,
    TResult Function()? member,
    required TResult orElse(),
  }) {
    if (member != null) {
      return member();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Admin value) admin,
    required TResult Function(Member value) member,
  }) {
    return member(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Admin value)? admin,
    TResult? Function(Member value)? member,
  }) {
    return member?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Admin value)? admin,
    TResult Function(Member value)? member,
    required TResult orElse(),
  }) {
    if (member != null) {
      return member(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberImplToJson(
      this,
    );
  }
}

abstract class Member extends MemberRole {
  const factory Member() = _$MemberImpl;
  const Member._() : super._();

  factory Member.fromJson(Map<String, dynamic> json) = _$MemberImpl.fromJson;
}

MembershipStatus _$MembershipStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'membershipPending':
      return MembershipPending.fromJson(json);
    case 'active':
      return Active.fromJson(json);
    case 'removed':
      return Removed.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'MembershipStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$MembershipStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() membershipPending,
    required TResult Function() active,
    required TResult Function() removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? membershipPending,
    TResult? Function()? active,
    TResult? Function()? removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? membershipPending,
    TResult Function()? active,
    TResult Function()? removed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MembershipPending value) membershipPending,
    required TResult Function(Active value) active,
    required TResult Function(Removed value) removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MembershipPending value)? membershipPending,
    TResult? Function(Active value)? active,
    TResult? Function(Removed value)? removed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MembershipPending value)? membershipPending,
    TResult Function(Active value)? active,
    TResult Function(Removed value)? removed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this MembershipStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MembershipStatusCopyWith<$Res> {
  factory $MembershipStatusCopyWith(
          MembershipStatus value, $Res Function(MembershipStatus) then) =
      _$MembershipStatusCopyWithImpl<$Res, MembershipStatus>;
}

/// @nodoc
class _$MembershipStatusCopyWithImpl<$Res, $Val extends MembershipStatus>
    implements $MembershipStatusCopyWith<$Res> {
  _$MembershipStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MembershipStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MembershipPendingImplCopyWith<$Res> {
  factory _$$MembershipPendingImplCopyWith(_$MembershipPendingImpl value,
          $Res Function(_$MembershipPendingImpl) then) =
      __$$MembershipPendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MembershipPendingImplCopyWithImpl<$Res>
    extends _$MembershipStatusCopyWithImpl<$Res, _$MembershipPendingImpl>
    implements _$$MembershipPendingImplCopyWith<$Res> {
  __$$MembershipPendingImplCopyWithImpl(_$MembershipPendingImpl _value,
      $Res Function(_$MembershipPendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MembershipStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$MembershipPendingImpl extends MembershipPending {
  const _$MembershipPendingImpl({final String? $type})
      : $type = $type ?? 'membershipPending',
        super._();

  factory _$MembershipPendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$MembershipPendingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MembershipStatus.membershipPending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MembershipPendingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() membershipPending,
    required TResult Function() active,
    required TResult Function() removed,
  }) {
    return membershipPending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? membershipPending,
    TResult? Function()? active,
    TResult? Function()? removed,
  }) {
    return membershipPending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? membershipPending,
    TResult Function()? active,
    TResult Function()? removed,
    required TResult orElse(),
  }) {
    if (membershipPending != null) {
      return membershipPending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MembershipPending value) membershipPending,
    required TResult Function(Active value) active,
    required TResult Function(Removed value) removed,
  }) {
    return membershipPending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MembershipPending value)? membershipPending,
    TResult? Function(Active value)? active,
    TResult? Function(Removed value)? removed,
  }) {
    return membershipPending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MembershipPending value)? membershipPending,
    TResult Function(Active value)? active,
    TResult Function(Removed value)? removed,
    required TResult orElse(),
  }) {
    if (membershipPending != null) {
      return membershipPending(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MembershipPendingImplToJson(
      this,
    );
  }
}

abstract class MembershipPending extends MembershipStatus {
  const factory MembershipPending() = _$MembershipPendingImpl;
  const MembershipPending._() : super._();

  factory MembershipPending.fromJson(Map<String, dynamic> json) =
      _$MembershipPendingImpl.fromJson;
}

/// @nodoc
abstract class _$$ActiveImplCopyWith<$Res> {
  factory _$$ActiveImplCopyWith(
          _$ActiveImpl value, $Res Function(_$ActiveImpl) then) =
      __$$ActiveImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ActiveImplCopyWithImpl<$Res>
    extends _$MembershipStatusCopyWithImpl<$Res, _$ActiveImpl>
    implements _$$ActiveImplCopyWith<$Res> {
  __$$ActiveImplCopyWithImpl(
      _$ActiveImpl _value, $Res Function(_$ActiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of MembershipStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ActiveImpl extends Active {
  const _$ActiveImpl({final String? $type})
      : $type = $type ?? 'active',
        super._();

  factory _$ActiveImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MembershipStatus.active()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ActiveImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() membershipPending,
    required TResult Function() active,
    required TResult Function() removed,
  }) {
    return active();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? membershipPending,
    TResult? Function()? active,
    TResult? Function()? removed,
  }) {
    return active?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? membershipPending,
    TResult Function()? active,
    TResult Function()? removed,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MembershipPending value) membershipPending,
    required TResult Function(Active value) active,
    required TResult Function(Removed value) removed,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MembershipPending value)? membershipPending,
    TResult? Function(Active value)? active,
    TResult? Function(Removed value)? removed,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MembershipPending value)? membershipPending,
    TResult Function(Active value)? active,
    TResult Function(Removed value)? removed,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveImplToJson(
      this,
    );
  }
}

abstract class Active extends MembershipStatus {
  const factory Active() = _$ActiveImpl;
  const Active._() : super._();

  factory Active.fromJson(Map<String, dynamic> json) = _$ActiveImpl.fromJson;
}

/// @nodoc
abstract class _$$RemovedImplCopyWith<$Res> {
  factory _$$RemovedImplCopyWith(
          _$RemovedImpl value, $Res Function(_$RemovedImpl) then) =
      __$$RemovedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemovedImplCopyWithImpl<$Res>
    extends _$MembershipStatusCopyWithImpl<$Res, _$RemovedImpl>
    implements _$$RemovedImplCopyWith<$Res> {
  __$$RemovedImplCopyWithImpl(
      _$RemovedImpl _value, $Res Function(_$RemovedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MembershipStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$RemovedImpl extends Removed {
  const _$RemovedImpl({final String? $type})
      : $type = $type ?? 'removed',
        super._();

  factory _$RemovedImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemovedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'MembershipStatus.removed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RemovedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() membershipPending,
    required TResult Function() active,
    required TResult Function() removed,
  }) {
    return removed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? membershipPending,
    TResult? Function()? active,
    TResult? Function()? removed,
  }) {
    return removed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? membershipPending,
    TResult Function()? active,
    TResult Function()? removed,
    required TResult orElse(),
  }) {
    if (removed != null) {
      return removed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MembershipPending value) membershipPending,
    required TResult Function(Active value) active,
    required TResult Function(Removed value) removed,
  }) {
    return removed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MembershipPending value)? membershipPending,
    TResult? Function(Active value)? active,
    TResult? Function(Removed value)? removed,
  }) {
    return removed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MembershipPending value)? membershipPending,
    TResult Function(Active value)? active,
    TResult Function(Removed value)? removed,
    required TResult orElse(),
  }) {
    if (removed != null) {
      return removed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$RemovedImplToJson(
      this,
    );
  }
}

abstract class Removed extends MembershipStatus {
  const factory Removed() = _$RemovedImpl;
  const Removed._() : super._();

  factory Removed.fromJson(Map<String, dynamic> json) = _$RemovedImpl.fromJson;
}

Invitation _$InvitationFromJson(Map<String, dynamic> json) {
  return _Invitation.fromJson(json);
}

/// @nodoc
mixin _$Invitation {
  /// Unique invitation ID
  String get id => throw _privateConstructorUsedError;

  /// Household ID
  String get householdId => throw _privateConstructorUsedError;

  /// Invitee email
  String get email => throw _privateConstructorUsedError;

  /// Role to assign
  MemberRole get role => throw _privateConstructorUsedError;

  /// Inviter user ID
  String get invitedBy => throw _privateConstructorUsedError;

  /// Inviter name (for display)
  String get invitedByName => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Expiry timestamp
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  /// Invitation status
  InvitationStatus get status => throw _privateConstructorUsedError;

  /// Server document ID
  String get serverId => throw _privateConstructorUsedError;

  /// Serializes this Invitation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvitationCopyWith<Invitation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationCopyWith<$Res> {
  factory $InvitationCopyWith(
          Invitation value, $Res Function(Invitation) then) =
      _$InvitationCopyWithImpl<$Res, Invitation>;
  @useResult
  $Res call(
      {String id,
      String householdId,
      String email,
      MemberRole role,
      String invitedBy,
      String invitedByName,
      DateTime? createdAt,
      DateTime? expiresAt,
      InvitationStatus status,
      String serverId});

  $MemberRoleCopyWith<$Res> get role;
  $InvitationStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$InvitationCopyWithImpl<$Res, $Val extends Invitation>
    implements $InvitationCopyWith<$Res> {
  _$InvitationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? householdId = null,
    Object? email = null,
    Object? role = null,
    Object? invitedBy = null,
    Object? invitedByName = null,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? status = null,
    Object? serverId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      householdId: null == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MemberRole,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByName: null == invitedByName
          ? _value.invitedByName
          : invitedByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberRoleCopyWith<$Res> get role {
    return $MemberRoleCopyWith<$Res>(_value.role, (value) {
      return _then(_value.copyWith(role: value) as $Val);
    });
  }

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvitationStatusCopyWith<$Res> get status {
    return $InvitationStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InvitationImplCopyWith<$Res>
    implements $InvitationCopyWith<$Res> {
  factory _$$InvitationImplCopyWith(
          _$InvitationImpl value, $Res Function(_$InvitationImpl) then) =
      __$$InvitationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String householdId,
      String email,
      MemberRole role,
      String invitedBy,
      String invitedByName,
      DateTime? createdAt,
      DateTime? expiresAt,
      InvitationStatus status,
      String serverId});

  @override
  $MemberRoleCopyWith<$Res> get role;
  @override
  $InvitationStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$InvitationImplCopyWithImpl<$Res>
    extends _$InvitationCopyWithImpl<$Res, _$InvitationImpl>
    implements _$$InvitationImplCopyWith<$Res> {
  __$$InvitationImplCopyWithImpl(
      _$InvitationImpl _value, $Res Function(_$InvitationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? householdId = null,
    Object? email = null,
    Object? role = null,
    Object? invitedBy = null,
    Object? invitedByName = null,
    Object? createdAt = freezed,
    Object? expiresAt = freezed,
    Object? status = null,
    Object? serverId = null,
  }) {
    return _then(_$InvitationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      householdId: null == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as MemberRole,
      invitedBy: null == invitedBy
          ? _value.invitedBy
          : invitedBy // ignore: cast_nullable_to_non_nullable
              as String,
      invitedByName: null == invitedByName
          ? _value.invitedByName
          : invitedByName // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as InvitationStatus,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvitationImpl extends _Invitation {
  const _$InvitationImpl(
      {this.id = '',
      this.householdId = '',
      this.email = '',
      this.role = const MemberRole.member(),
      this.invitedBy = '',
      this.invitedByName = '',
      this.createdAt,
      this.expiresAt,
      this.status = const InvitationStatus.pending(),
      this.serverId = ''})
      : super._();

  factory _$InvitationImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationImplFromJson(json);

  /// Unique invitation ID
  @override
  @JsonKey()
  final String id;

  /// Household ID
  @override
  @JsonKey()
  final String householdId;

  /// Invitee email
  @override
  @JsonKey()
  final String email;

  /// Role to assign
  @override
  @JsonKey()
  final MemberRole role;

  /// Inviter user ID
  @override
  @JsonKey()
  final String invitedBy;

  /// Inviter name (for display)
  @override
  @JsonKey()
  final String invitedByName;

  /// Creation timestamp
  @override
  final DateTime? createdAt;

  /// Expiry timestamp
  @override
  final DateTime? expiresAt;

  /// Invitation status
  @override
  @JsonKey()
  final InvitationStatus status;

  /// Server document ID
  @override
  @JsonKey()
  final String serverId;

  @override
  String toString() {
    return 'Invitation(id: $id, householdId: $householdId, email: $email, role: $role, invitedBy: $invitedBy, invitedByName: $invitedByName, createdAt: $createdAt, expiresAt: $expiresAt, status: $status, serverId: $serverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvitationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.householdId, householdId) ||
                other.householdId == householdId) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.invitedBy, invitedBy) ||
                other.invitedBy == invitedBy) &&
            (identical(other.invitedByName, invitedByName) ||
                other.invitedByName == invitedByName) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, householdId, email, role,
      invitedBy, invitedByName, createdAt, expiresAt, status, serverId);

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvitationImplCopyWith<_$InvitationImpl> get copyWith =>
      __$$InvitationImplCopyWithImpl<_$InvitationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationImplToJson(
      this,
    );
  }
}

abstract class _Invitation extends Invitation {
  const factory _Invitation(
      {final String id,
      final String householdId,
      final String email,
      final MemberRole role,
      final String invitedBy,
      final String invitedByName,
      final DateTime? createdAt,
      final DateTime? expiresAt,
      final InvitationStatus status,
      final String serverId}) = _$InvitationImpl;
  const _Invitation._() : super._();

  factory _Invitation.fromJson(Map<String, dynamic> json) =
      _$InvitationImpl.fromJson;

  /// Unique invitation ID
  @override
  String get id;

  /// Household ID
  @override
  String get householdId;

  /// Invitee email
  @override
  String get email;

  /// Role to assign
  @override
  MemberRole get role;

  /// Inviter user ID
  @override
  String get invitedBy;

  /// Inviter name (for display)
  @override
  String get invitedByName;

  /// Creation timestamp
  @override
  DateTime? get createdAt;

  /// Expiry timestamp
  @override
  DateTime? get expiresAt;

  /// Invitation status
  @override
  InvitationStatus get status;

  /// Server document ID
  @override
  String get serverId;

  /// Create a copy of Invitation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvitationImplCopyWith<_$InvitationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InvitationStatus _$InvitationStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'pending':
      return InvitationPending.fromJson(json);
    case 'accepted':
      return Accepted.fromJson(json);
    case 'declined':
      return Declined.fromJson(json);
    case 'expired':
      return Expired.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'InvitationStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$InvitationStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() accepted,
    required TResult Function() declined,
    required TResult Function() expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? accepted,
    TResult? Function()? declined,
    TResult? Function()? expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? accepted,
    TResult Function()? declined,
    TResult Function()? expired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvitationPending value) pending,
    required TResult Function(Accepted value) accepted,
    required TResult Function(Declined value) declined,
    required TResult Function(Expired value) expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvitationPending value)? pending,
    TResult? Function(Accepted value)? accepted,
    TResult? Function(Declined value)? declined,
    TResult? Function(Expired value)? expired,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvitationPending value)? pending,
    TResult Function(Accepted value)? accepted,
    TResult Function(Declined value)? declined,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this InvitationStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvitationStatusCopyWith<$Res> {
  factory $InvitationStatusCopyWith(
          InvitationStatus value, $Res Function(InvitationStatus) then) =
      _$InvitationStatusCopyWithImpl<$Res, InvitationStatus>;
}

/// @nodoc
class _$InvitationStatusCopyWithImpl<$Res, $Val extends InvitationStatus>
    implements $InvitationStatusCopyWith<$Res> {
  _$InvitationStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvitationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InvitationPendingImplCopyWith<$Res> {
  factory _$$InvitationPendingImplCopyWith(_$InvitationPendingImpl value,
          $Res Function(_$InvitationPendingImpl) then) =
      __$$InvitationPendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvitationPendingImplCopyWithImpl<$Res>
    extends _$InvitationStatusCopyWithImpl<$Res, _$InvitationPendingImpl>
    implements _$$InvitationPendingImplCopyWith<$Res> {
  __$$InvitationPendingImplCopyWithImpl(_$InvitationPendingImpl _value,
      $Res Function(_$InvitationPendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvitationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$InvitationPendingImpl extends InvitationPending {
  const _$InvitationPendingImpl({final String? $type})
      : $type = $type ?? 'pending',
        super._();

  factory _$InvitationPendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvitationPendingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InvitationStatus.pending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InvitationPendingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() accepted,
    required TResult Function() declined,
    required TResult Function() expired,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? accepted,
    TResult? Function()? declined,
    TResult? Function()? expired,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? accepted,
    TResult Function()? declined,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvitationPending value) pending,
    required TResult Function(Accepted value) accepted,
    required TResult Function(Declined value) declined,
    required TResult Function(Expired value) expired,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvitationPending value)? pending,
    TResult? Function(Accepted value)? accepted,
    TResult? Function(Declined value)? declined,
    TResult? Function(Expired value)? expired,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvitationPending value)? pending,
    TResult Function(Accepted value)? accepted,
    TResult Function(Declined value)? declined,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InvitationPendingImplToJson(
      this,
    );
  }
}

abstract class InvitationPending extends InvitationStatus {
  const factory InvitationPending() = _$InvitationPendingImpl;
  const InvitationPending._() : super._();

  factory InvitationPending.fromJson(Map<String, dynamic> json) =
      _$InvitationPendingImpl.fromJson;
}

/// @nodoc
abstract class _$$AcceptedImplCopyWith<$Res> {
  factory _$$AcceptedImplCopyWith(
          _$AcceptedImpl value, $Res Function(_$AcceptedImpl) then) =
      __$$AcceptedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AcceptedImplCopyWithImpl<$Res>
    extends _$InvitationStatusCopyWithImpl<$Res, _$AcceptedImpl>
    implements _$$AcceptedImplCopyWith<$Res> {
  __$$AcceptedImplCopyWithImpl(
      _$AcceptedImpl _value, $Res Function(_$AcceptedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvitationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AcceptedImpl extends Accepted {
  const _$AcceptedImpl({final String? $type})
      : $type = $type ?? 'accepted',
        super._();

  factory _$AcceptedImpl.fromJson(Map<String, dynamic> json) =>
      _$$AcceptedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InvitationStatus.accepted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AcceptedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() accepted,
    required TResult Function() declined,
    required TResult Function() expired,
  }) {
    return accepted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? accepted,
    TResult? Function()? declined,
    TResult? Function()? expired,
  }) {
    return accepted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? accepted,
    TResult Function()? declined,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (accepted != null) {
      return accepted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvitationPending value) pending,
    required TResult Function(Accepted value) accepted,
    required TResult Function(Declined value) declined,
    required TResult Function(Expired value) expired,
  }) {
    return accepted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvitationPending value)? pending,
    TResult? Function(Accepted value)? accepted,
    TResult? Function(Declined value)? declined,
    TResult? Function(Expired value)? expired,
  }) {
    return accepted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvitationPending value)? pending,
    TResult Function(Accepted value)? accepted,
    TResult Function(Declined value)? declined,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (accepted != null) {
      return accepted(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AcceptedImplToJson(
      this,
    );
  }
}

abstract class Accepted extends InvitationStatus {
  const factory Accepted() = _$AcceptedImpl;
  const Accepted._() : super._();

  factory Accepted.fromJson(Map<String, dynamic> json) =
      _$AcceptedImpl.fromJson;
}

/// @nodoc
abstract class _$$DeclinedImplCopyWith<$Res> {
  factory _$$DeclinedImplCopyWith(
          _$DeclinedImpl value, $Res Function(_$DeclinedImpl) then) =
      __$$DeclinedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeclinedImplCopyWithImpl<$Res>
    extends _$InvitationStatusCopyWithImpl<$Res, _$DeclinedImpl>
    implements _$$DeclinedImplCopyWith<$Res> {
  __$$DeclinedImplCopyWithImpl(
      _$DeclinedImpl _value, $Res Function(_$DeclinedImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvitationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$DeclinedImpl extends Declined {
  const _$DeclinedImpl({final String? $type})
      : $type = $type ?? 'declined',
        super._();

  factory _$DeclinedImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeclinedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InvitationStatus.declined()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeclinedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() accepted,
    required TResult Function() declined,
    required TResult Function() expired,
  }) {
    return declined();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? accepted,
    TResult? Function()? declined,
    TResult? Function()? expired,
  }) {
    return declined?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? accepted,
    TResult Function()? declined,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (declined != null) {
      return declined();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvitationPending value) pending,
    required TResult Function(Accepted value) accepted,
    required TResult Function(Declined value) declined,
    required TResult Function(Expired value) expired,
  }) {
    return declined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvitationPending value)? pending,
    TResult? Function(Accepted value)? accepted,
    TResult? Function(Declined value)? declined,
    TResult? Function(Expired value)? expired,
  }) {
    return declined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvitationPending value)? pending,
    TResult Function(Accepted value)? accepted,
    TResult Function(Declined value)? declined,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (declined != null) {
      return declined(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeclinedImplToJson(
      this,
    );
  }
}

abstract class Declined extends InvitationStatus {
  const factory Declined() = _$DeclinedImpl;
  const Declined._() : super._();

  factory Declined.fromJson(Map<String, dynamic> json) =
      _$DeclinedImpl.fromJson;
}

/// @nodoc
abstract class _$$ExpiredImplCopyWith<$Res> {
  factory _$$ExpiredImplCopyWith(
          _$ExpiredImpl value, $Res Function(_$ExpiredImpl) then) =
      __$$ExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpiredImplCopyWithImpl<$Res>
    extends _$InvitationStatusCopyWithImpl<$Res, _$ExpiredImpl>
    implements _$$ExpiredImplCopyWith<$Res> {
  __$$ExpiredImplCopyWithImpl(
      _$ExpiredImpl _value, $Res Function(_$ExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvitationStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ExpiredImpl extends Expired {
  const _$ExpiredImpl({final String? $type})
      : $type = $type ?? 'expired',
        super._();

  factory _$ExpiredImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiredImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InvitationStatus.expired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpiredImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() accepted,
    required TResult Function() declined,
    required TResult Function() expired,
  }) {
    return expired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? accepted,
    TResult? Function()? declined,
    TResult? Function()? expired,
  }) {
    return expired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? accepted,
    TResult Function()? declined,
    TResult Function()? expired,
    required TResult orElse(),
  }) {
    if (expired != null) {
      return expired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvitationPending value) pending,
    required TResult Function(Accepted value) accepted,
    required TResult Function(Declined value) declined,
    required TResult Function(Expired value) expired,
  }) {
    return expired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvitationPending value)? pending,
    TResult? Function(Accepted value)? accepted,
    TResult? Function(Declined value)? declined,
    TResult? Function(Expired value)? expired,
  }) {
    return expired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvitationPending value)? pending,
    TResult Function(Accepted value)? accepted,
    TResult Function(Declined value)? declined,
    TResult Function(Expired value)? expired,
    required TResult orElse(),
  }) {
    if (expired != null) {
      return expired(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiredImplToJson(
      this,
    );
  }
}

abstract class Expired extends InvitationStatus {
  const factory Expired() = _$ExpiredImpl;
  const Expired._() : super._();

  factory Expired.fromJson(Map<String, dynamic> json) = _$ExpiredImpl.fromJson;
}
