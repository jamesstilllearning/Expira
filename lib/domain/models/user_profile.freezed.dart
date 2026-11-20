// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  /// Unique user ID (Firebase Auth UID)
  String get uid => throw _privateConstructorUsedError;

  /// Email address
  String get email => throw _privateConstructorUsedError;

  /// Display name
  String get displayName => throw _privateConstructorUsedError;

  /// Photo URL
  String get photoURL => throw _privateConstructorUsedError;

  /// Creation timestamp
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// User settings
  @JsonKey(fromJson: _userSettingsFromJson, toJson: _userSettingsToJson)
  UserSettings get settings => throw _privateConstructorUsedError;

  /// List of household IDs this user belongs to
  List<String> get householdIds => throw _privateConstructorUsedError;

  /// FCM token for push notifications
  String get fcmToken => throw _privateConstructorUsedError;

  /// Platform (ios, android, web)
  String get platform => throw _privateConstructorUsedError;

  /// Last login timestamp
  DateTime? get lastLoginAt => throw _privateConstructorUsedError;

  /// Server document ID
  String get serverId => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String photoURL,
      DateTime? createdAt,
      @JsonKey(fromJson: _userSettingsFromJson, toJson: _userSettingsToJson)
      UserSettings settings,
      List<String> householdIds,
      String fcmToken,
      String platform,
      DateTime? lastLoginAt,
      String serverId});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? photoURL = null,
    Object? createdAt = freezed,
    Object? settings = null,
    Object? householdIds = null,
    Object? fcmToken = null,
    Object? platform = null,
    Object? lastLoginAt = freezed,
    Object? serverId = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: null == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as UserSettings,
      householdIds: null == householdIds
          ? _value.householdIds
          : householdIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String email,
      String displayName,
      String photoURL,
      DateTime? createdAt,
      @JsonKey(fromJson: _userSettingsFromJson, toJson: _userSettingsToJson)
      UserSettings settings,
      List<String> householdIds,
      String fcmToken,
      String platform,
      DateTime? lastLoginAt,
      String serverId});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? email = null,
    Object? displayName = null,
    Object? photoURL = null,
    Object? createdAt = freezed,
    Object? settings = null,
    Object? householdIds = null,
    Object? fcmToken = null,
    Object? platform = null,
    Object? lastLoginAt = freezed,
    Object? serverId = null,
  }) {
    return _then(_$UserProfileImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      photoURL: null == photoURL
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as UserSettings,
      householdIds: null == householdIds
          ? _value._householdIds
          : householdIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fcmToken: null == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      lastLoginAt: freezed == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl extends _UserProfile {
  const _$UserProfileImpl(
      {this.uid = '',
      this.email = '',
      this.displayName = '',
      this.photoURL = '',
      this.createdAt,
      @JsonKey(fromJson: _userSettingsFromJson, toJson: _userSettingsToJson)
      this.settings = const UserSettings(),
      final List<String> householdIds = const [],
      this.fcmToken = '',
      this.platform = '',
      this.lastLoginAt,
      this.serverId = ''})
      : _householdIds = householdIds,
        super._();

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  /// Unique user ID (Firebase Auth UID)
  @override
  @JsonKey()
  final String uid;

  /// Email address
  @override
  @JsonKey()
  final String email;

  /// Display name
  @override
  @JsonKey()
  final String displayName;

  /// Photo URL
  @override
  @JsonKey()
  final String photoURL;

  /// Creation timestamp
  @override
  final DateTime? createdAt;

  /// User settings
  @override
  @JsonKey(fromJson: _userSettingsFromJson, toJson: _userSettingsToJson)
  final UserSettings settings;

  /// List of household IDs this user belongs to
  final List<String> _householdIds;

  /// List of household IDs this user belongs to
  @override
  @JsonKey()
  List<String> get householdIds {
    if (_householdIds is EqualUnmodifiableListView) return _householdIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_householdIds);
  }

  /// FCM token for push notifications
  @override
  @JsonKey()
  final String fcmToken;

  /// Platform (ios, android, web)
  @override
  @JsonKey()
  final String platform;

  /// Last login timestamp
  @override
  final DateTime? lastLoginAt;

  /// Server document ID
  @override
  @JsonKey()
  final String serverId;

  @override
  String toString() {
    return 'UserProfile(uid: $uid, email: $email, displayName: $displayName, photoURL: $photoURL, createdAt: $createdAt, settings: $settings, householdIds: $householdIds, fcmToken: $fcmToken, platform: $platform, lastLoginAt: $lastLoginAt, serverId: $serverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.photoURL, photoURL) ||
                other.photoURL == photoURL) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.settings, settings) ||
                other.settings == settings) &&
            const DeepCollectionEquality()
                .equals(other._householdIds, _householdIds) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      email,
      displayName,
      photoURL,
      createdAt,
      settings,
      const DeepCollectionEquality().hash(_householdIds),
      fcmToken,
      platform,
      lastLoginAt,
      serverId);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile extends UserProfile {
  const factory _UserProfile(
      {final String uid,
      final String email,
      final String displayName,
      final String photoURL,
      final DateTime? createdAt,
      @JsonKey(fromJson: _userSettingsFromJson, toJson: _userSettingsToJson)
      final UserSettings settings,
      final List<String> householdIds,
      final String fcmToken,
      final String platform,
      final DateTime? lastLoginAt,
      final String serverId}) = _$UserProfileImpl;
  const _UserProfile._() : super._();

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  /// Unique user ID (Firebase Auth UID)
  @override
  String get uid;

  /// Email address
  @override
  String get email;

  /// Display name
  @override
  String get displayName;

  /// Photo URL
  @override
  String get photoURL;

  /// Creation timestamp
  @override
  DateTime? get createdAt;

  /// User settings
  @override
  @JsonKey(fromJson: _userSettingsFromJson, toJson: _userSettingsToJson)
  UserSettings get settings;

  /// List of household IDs this user belongs to
  @override
  List<String> get householdIds;

  /// FCM token for push notifications
  @override
  String get fcmToken;

  /// Platform (ios, android, web)
  @override
  String get platform;

  /// Last login timestamp
  @override
  DateTime? get lastLoginAt;

  /// Server document ID
  @override
  String get serverId;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
