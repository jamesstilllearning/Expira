// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationRecord _$NotificationRecordFromJson(Map<String, dynamic> json) {
  return _NotificationRecord.fromJson(json);
}

/// @nodoc
mixin _$NotificationRecord {
  /// Unique ID
  String get id => throw _privateConstructorUsedError;

  /// Notification type
  NotificationType get type => throw _privateConstructorUsedError;

  /// Item ID (if related to an item)
  String get itemId => throw _privateConstructorUsedError;

  /// Item name (denormalized)
  String get itemName => throw _privateConstructorUsedError;

  /// Title
  String get title => throw _privateConstructorUsedError;

  /// Body message
  String get body => throw _privateConstructorUsedError;

  /// Whether read
  bool get read => throw _privateConstructorUsedError;

  /// Timestamp
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Payload data (JSON)
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;

  /// Serializes this NotificationRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationRecordCopyWith<NotificationRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationRecordCopyWith<$Res> {
  factory $NotificationRecordCopyWith(
          NotificationRecord value, $Res Function(NotificationRecord) then) =
      _$NotificationRecordCopyWithImpl<$Res, NotificationRecord>;
  @useResult
  $Res call(
      {String id,
      NotificationType type,
      String itemId,
      String itemName,
      String title,
      String body,
      bool read,
      DateTime timestamp,
      Map<String, dynamic> payload});

  $NotificationTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$NotificationRecordCopyWithImpl<$Res, $Val extends NotificationRecord>
    implements $NotificationRecordCopyWith<$Res> {
  _$NotificationRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? itemId = null,
    Object? itemName = null,
    Object? title = null,
    Object? body = null,
    Object? read = null,
    Object? timestamp = null,
    Object? payload = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  /// Create a copy of NotificationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationTypeCopyWith<$Res> get type {
    return $NotificationTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NotificationRecordImplCopyWith<$Res>
    implements $NotificationRecordCopyWith<$Res> {
  factory _$$NotificationRecordImplCopyWith(_$NotificationRecordImpl value,
          $Res Function(_$NotificationRecordImpl) then) =
      __$$NotificationRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      NotificationType type,
      String itemId,
      String itemName,
      String title,
      String body,
      bool read,
      DateTime timestamp,
      Map<String, dynamic> payload});

  @override
  $NotificationTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$NotificationRecordImplCopyWithImpl<$Res>
    extends _$NotificationRecordCopyWithImpl<$Res, _$NotificationRecordImpl>
    implements _$$NotificationRecordImplCopyWith<$Res> {
  __$$NotificationRecordImplCopyWithImpl(_$NotificationRecordImpl _value,
      $Res Function(_$NotificationRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? itemId = null,
    Object? itemName = null,
    Object? title = null,
    Object? body = null,
    Object? read = null,
    Object? timestamp = null,
    Object? payload = null,
  }) {
    return _then(_$NotificationRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      read: null == read
          ? _value.read
          : read // ignore: cast_nullable_to_non_nullable
              as bool,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationRecordImpl extends _NotificationRecord {
  const _$NotificationRecordImpl(
      {this.id = '',
      this.type = const NotificationType.expiryReminder(),
      this.itemId = '',
      this.itemName = '',
      this.title = '',
      this.body = '',
      this.read = false,
      required this.timestamp,
      final Map<String, dynamic> payload = const {}})
      : _payload = payload,
        super._();

  factory _$NotificationRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationRecordImplFromJson(json);

  /// Unique ID
  @override
  @JsonKey()
  final String id;

  /// Notification type
  @override
  @JsonKey()
  final NotificationType type;

  /// Item ID (if related to an item)
  @override
  @JsonKey()
  final String itemId;

  /// Item name (denormalized)
  @override
  @JsonKey()
  final String itemName;

  /// Title
  @override
  @JsonKey()
  final String title;

  /// Body message
  @override
  @JsonKey()
  final String body;

  /// Whether read
  @override
  @JsonKey()
  final bool read;

  /// Timestamp
  @override
  final DateTime timestamp;

  /// Payload data (JSON)
  final Map<String, dynamic> _payload;

  /// Payload data (JSON)
  @override
  @JsonKey()
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'NotificationRecord(id: $id, type: $type, itemId: $itemId, itemName: $itemName, title: $title, body: $body, read: $read, timestamp: $timestamp, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.read, read) || other.read == read) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      itemId,
      itemName,
      title,
      body,
      read,
      timestamp,
      const DeepCollectionEquality().hash(_payload));

  /// Create a copy of NotificationRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationRecordImplCopyWith<_$NotificationRecordImpl> get copyWith =>
      __$$NotificationRecordImplCopyWithImpl<_$NotificationRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationRecordImplToJson(
      this,
    );
  }
}

abstract class _NotificationRecord extends NotificationRecord {
  const factory _NotificationRecord(
      {final String id,
      final NotificationType type,
      final String itemId,
      final String itemName,
      final String title,
      final String body,
      final bool read,
      required final DateTime timestamp,
      final Map<String, dynamic> payload}) = _$NotificationRecordImpl;
  const _NotificationRecord._() : super._();

  factory _NotificationRecord.fromJson(Map<String, dynamic> json) =
      _$NotificationRecordImpl.fromJson;

  /// Unique ID
  @override
  String get id;

  /// Notification type
  @override
  NotificationType get type;

  /// Item ID (if related to an item)
  @override
  String get itemId;

  /// Item name (denormalized)
  @override
  String get itemName;

  /// Title
  @override
  String get title;

  /// Body message
  @override
  String get body;

  /// Whether read
  @override
  bool get read;

  /// Timestamp
  @override
  DateTime get timestamp;

  /// Payload data (JSON)
  @override
  Map<String, dynamic> get payload;

  /// Create a copy of NotificationRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationRecordImplCopyWith<_$NotificationRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationType _$NotificationTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'expiryReminder':
      return ExpiryReminder.fromJson(json);
    case 'itemExpired':
      return ItemExpired.fromJson(json);
    case 'itemUsed':
      return ItemUsed.fromJson(json);
    case 'householdInvite':
      return HouseholdInvite.fromJson(json);
    case 'settingsChanged':
      return SettingsChanged.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'NotificationType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$NotificationType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expiryReminder,
    required TResult Function() itemExpired,
    required TResult Function() itemUsed,
    required TResult Function() householdInvite,
    required TResult Function() settingsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expiryReminder,
    TResult? Function()? itemExpired,
    TResult? Function()? itemUsed,
    TResult? Function()? householdInvite,
    TResult? Function()? settingsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expiryReminder,
    TResult Function()? itemExpired,
    TResult Function()? itemUsed,
    TResult Function()? householdInvite,
    TResult Function()? settingsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExpiryReminder value) expiryReminder,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(HouseholdInvite value) householdInvite,
    required TResult Function(SettingsChanged value) settingsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpiryReminder value)? expiryReminder,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(HouseholdInvite value)? householdInvite,
    TResult? Function(SettingsChanged value)? settingsChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpiryReminder value)? expiryReminder,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(HouseholdInvite value)? householdInvite,
    TResult Function(SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this NotificationType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationTypeCopyWith<$Res> {
  factory $NotificationTypeCopyWith(
          NotificationType value, $Res Function(NotificationType) then) =
      _$NotificationTypeCopyWithImpl<$Res, NotificationType>;
}

/// @nodoc
class _$NotificationTypeCopyWithImpl<$Res, $Val extends NotificationType>
    implements $NotificationTypeCopyWith<$Res> {
  _$NotificationTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ExpiryReminderImplCopyWith<$Res> {
  factory _$$ExpiryReminderImplCopyWith(_$ExpiryReminderImpl value,
          $Res Function(_$ExpiryReminderImpl) then) =
      __$$ExpiryReminderImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpiryReminderImplCopyWithImpl<$Res>
    extends _$NotificationTypeCopyWithImpl<$Res, _$ExpiryReminderImpl>
    implements _$$ExpiryReminderImplCopyWith<$Res> {
  __$$ExpiryReminderImplCopyWithImpl(
      _$ExpiryReminderImpl _value, $Res Function(_$ExpiryReminderImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ExpiryReminderImpl extends ExpiryReminder {
  const _$ExpiryReminderImpl({final String? $type})
      : $type = $type ?? 'expiryReminder',
        super._();

  factory _$ExpiryReminderImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiryReminderImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationType.expiryReminder()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpiryReminderImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expiryReminder,
    required TResult Function() itemExpired,
    required TResult Function() itemUsed,
    required TResult Function() householdInvite,
    required TResult Function() settingsChanged,
  }) {
    return expiryReminder();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expiryReminder,
    TResult? Function()? itemExpired,
    TResult? Function()? itemUsed,
    TResult? Function()? householdInvite,
    TResult? Function()? settingsChanged,
  }) {
    return expiryReminder?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expiryReminder,
    TResult Function()? itemExpired,
    TResult Function()? itemUsed,
    TResult Function()? householdInvite,
    TResult Function()? settingsChanged,
    required TResult orElse(),
  }) {
    if (expiryReminder != null) {
      return expiryReminder();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExpiryReminder value) expiryReminder,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(HouseholdInvite value) householdInvite,
    required TResult Function(SettingsChanged value) settingsChanged,
  }) {
    return expiryReminder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpiryReminder value)? expiryReminder,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(HouseholdInvite value)? householdInvite,
    TResult? Function(SettingsChanged value)? settingsChanged,
  }) {
    return expiryReminder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpiryReminder value)? expiryReminder,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(HouseholdInvite value)? householdInvite,
    TResult Function(SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (expiryReminder != null) {
      return expiryReminder(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiryReminderImplToJson(
      this,
    );
  }
}

abstract class ExpiryReminder extends NotificationType {
  const factory ExpiryReminder() = _$ExpiryReminderImpl;
  const ExpiryReminder._() : super._();

  factory ExpiryReminder.fromJson(Map<String, dynamic> json) =
      _$ExpiryReminderImpl.fromJson;
}

/// @nodoc
abstract class _$$ItemExpiredImplCopyWith<$Res> {
  factory _$$ItemExpiredImplCopyWith(
          _$ItemExpiredImpl value, $Res Function(_$ItemExpiredImpl) then) =
      __$$ItemExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemExpiredImplCopyWithImpl<$Res>
    extends _$NotificationTypeCopyWithImpl<$Res, _$ItemExpiredImpl>
    implements _$$ItemExpiredImplCopyWith<$Res> {
  __$$ItemExpiredImplCopyWithImpl(
      _$ItemExpiredImpl _value, $Res Function(_$ItemExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ItemExpiredImpl extends ItemExpired {
  const _$ItemExpiredImpl({final String? $type})
      : $type = $type ?? 'itemExpired',
        super._();

  factory _$ItemExpiredImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemExpiredImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationType.itemExpired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ItemExpiredImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expiryReminder,
    required TResult Function() itemExpired,
    required TResult Function() itemUsed,
    required TResult Function() householdInvite,
    required TResult Function() settingsChanged,
  }) {
    return itemExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expiryReminder,
    TResult? Function()? itemExpired,
    TResult? Function()? itemUsed,
    TResult? Function()? householdInvite,
    TResult? Function()? settingsChanged,
  }) {
    return itemExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expiryReminder,
    TResult Function()? itemExpired,
    TResult Function()? itemUsed,
    TResult Function()? householdInvite,
    TResult Function()? settingsChanged,
    required TResult orElse(),
  }) {
    if (itemExpired != null) {
      return itemExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExpiryReminder value) expiryReminder,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(HouseholdInvite value) householdInvite,
    required TResult Function(SettingsChanged value) settingsChanged,
  }) {
    return itemExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpiryReminder value)? expiryReminder,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(HouseholdInvite value)? householdInvite,
    TResult? Function(SettingsChanged value)? settingsChanged,
  }) {
    return itemExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpiryReminder value)? expiryReminder,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(HouseholdInvite value)? householdInvite,
    TResult Function(SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (itemExpired != null) {
      return itemExpired(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemExpiredImplToJson(
      this,
    );
  }
}

abstract class ItemExpired extends NotificationType {
  const factory ItemExpired() = _$ItemExpiredImpl;
  const ItemExpired._() : super._();

  factory ItemExpired.fromJson(Map<String, dynamic> json) =
      _$ItemExpiredImpl.fromJson;
}

/// @nodoc
abstract class _$$ItemUsedImplCopyWith<$Res> {
  factory _$$ItemUsedImplCopyWith(
          _$ItemUsedImpl value, $Res Function(_$ItemUsedImpl) then) =
      __$$ItemUsedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemUsedImplCopyWithImpl<$Res>
    extends _$NotificationTypeCopyWithImpl<$Res, _$ItemUsedImpl>
    implements _$$ItemUsedImplCopyWith<$Res> {
  __$$ItemUsedImplCopyWithImpl(
      _$ItemUsedImpl _value, $Res Function(_$ItemUsedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ItemUsedImpl extends ItemUsed {
  const _$ItemUsedImpl({final String? $type})
      : $type = $type ?? 'itemUsed',
        super._();

  factory _$ItemUsedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemUsedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationType.itemUsed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ItemUsedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expiryReminder,
    required TResult Function() itemExpired,
    required TResult Function() itemUsed,
    required TResult Function() householdInvite,
    required TResult Function() settingsChanged,
  }) {
    return itemUsed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expiryReminder,
    TResult? Function()? itemExpired,
    TResult? Function()? itemUsed,
    TResult? Function()? householdInvite,
    TResult? Function()? settingsChanged,
  }) {
    return itemUsed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expiryReminder,
    TResult Function()? itemExpired,
    TResult Function()? itemUsed,
    TResult Function()? householdInvite,
    TResult Function()? settingsChanged,
    required TResult orElse(),
  }) {
    if (itemUsed != null) {
      return itemUsed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExpiryReminder value) expiryReminder,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(HouseholdInvite value) householdInvite,
    required TResult Function(SettingsChanged value) settingsChanged,
  }) {
    return itemUsed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpiryReminder value)? expiryReminder,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(HouseholdInvite value)? householdInvite,
    TResult? Function(SettingsChanged value)? settingsChanged,
  }) {
    return itemUsed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpiryReminder value)? expiryReminder,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(HouseholdInvite value)? householdInvite,
    TResult Function(SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (itemUsed != null) {
      return itemUsed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemUsedImplToJson(
      this,
    );
  }
}

abstract class ItemUsed extends NotificationType {
  const factory ItemUsed() = _$ItemUsedImpl;
  const ItemUsed._() : super._();

  factory ItemUsed.fromJson(Map<String, dynamic> json) =
      _$ItemUsedImpl.fromJson;
}

/// @nodoc
abstract class _$$HouseholdInviteImplCopyWith<$Res> {
  factory _$$HouseholdInviteImplCopyWith(_$HouseholdInviteImpl value,
          $Res Function(_$HouseholdInviteImpl) then) =
      __$$HouseholdInviteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HouseholdInviteImplCopyWithImpl<$Res>
    extends _$NotificationTypeCopyWithImpl<$Res, _$HouseholdInviteImpl>
    implements _$$HouseholdInviteImplCopyWith<$Res> {
  __$$HouseholdInviteImplCopyWithImpl(
      _$HouseholdInviteImpl _value, $Res Function(_$HouseholdInviteImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$HouseholdInviteImpl extends HouseholdInvite {
  const _$HouseholdInviteImpl({final String? $type})
      : $type = $type ?? 'householdInvite',
        super._();

  factory _$HouseholdInviteImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseholdInviteImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationType.householdInvite()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HouseholdInviteImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expiryReminder,
    required TResult Function() itemExpired,
    required TResult Function() itemUsed,
    required TResult Function() householdInvite,
    required TResult Function() settingsChanged,
  }) {
    return householdInvite();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expiryReminder,
    TResult? Function()? itemExpired,
    TResult? Function()? itemUsed,
    TResult? Function()? householdInvite,
    TResult? Function()? settingsChanged,
  }) {
    return householdInvite?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expiryReminder,
    TResult Function()? itemExpired,
    TResult Function()? itemUsed,
    TResult Function()? householdInvite,
    TResult Function()? settingsChanged,
    required TResult orElse(),
  }) {
    if (householdInvite != null) {
      return householdInvite();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExpiryReminder value) expiryReminder,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(HouseholdInvite value) householdInvite,
    required TResult Function(SettingsChanged value) settingsChanged,
  }) {
    return householdInvite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpiryReminder value)? expiryReminder,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(HouseholdInvite value)? householdInvite,
    TResult? Function(SettingsChanged value)? settingsChanged,
  }) {
    return householdInvite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpiryReminder value)? expiryReminder,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(HouseholdInvite value)? householdInvite,
    TResult Function(SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (householdInvite != null) {
      return householdInvite(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseholdInviteImplToJson(
      this,
    );
  }
}

abstract class HouseholdInvite extends NotificationType {
  const factory HouseholdInvite() = _$HouseholdInviteImpl;
  const HouseholdInvite._() : super._();

  factory HouseholdInvite.fromJson(Map<String, dynamic> json) =
      _$HouseholdInviteImpl.fromJson;
}

/// @nodoc
abstract class _$$SettingsChangedImplCopyWith<$Res> {
  factory _$$SettingsChangedImplCopyWith(_$SettingsChangedImpl value,
          $Res Function(_$SettingsChangedImpl) then) =
      __$$SettingsChangedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsChangedImplCopyWithImpl<$Res>
    extends _$NotificationTypeCopyWithImpl<$Res, _$SettingsChangedImpl>
    implements _$$SettingsChangedImplCopyWith<$Res> {
  __$$SettingsChangedImplCopyWithImpl(
      _$SettingsChangedImpl _value, $Res Function(_$SettingsChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SettingsChangedImpl extends SettingsChanged {
  const _$SettingsChangedImpl({final String? $type})
      : $type = $type ?? 'settingsChanged',
        super._();

  factory _$SettingsChangedImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettingsChangedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationType.settingsChanged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SettingsChangedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expiryReminder,
    required TResult Function() itemExpired,
    required TResult Function() itemUsed,
    required TResult Function() householdInvite,
    required TResult Function() settingsChanged,
  }) {
    return settingsChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expiryReminder,
    TResult? Function()? itemExpired,
    TResult? Function()? itemUsed,
    TResult? Function()? householdInvite,
    TResult? Function()? settingsChanged,
  }) {
    return settingsChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expiryReminder,
    TResult Function()? itemExpired,
    TResult Function()? itemUsed,
    TResult Function()? householdInvite,
    TResult Function()? settingsChanged,
    required TResult orElse(),
  }) {
    if (settingsChanged != null) {
      return settingsChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ExpiryReminder value) expiryReminder,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(HouseholdInvite value) householdInvite,
    required TResult Function(SettingsChanged value) settingsChanged,
  }) {
    return settingsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExpiryReminder value)? expiryReminder,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(HouseholdInvite value)? householdInvite,
    TResult? Function(SettingsChanged value)? settingsChanged,
  }) {
    return settingsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExpiryReminder value)? expiryReminder,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(HouseholdInvite value)? householdInvite,
    TResult Function(SettingsChanged value)? settingsChanged,
    required TResult orElse(),
  }) {
    if (settingsChanged != null) {
      return settingsChanged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SettingsChangedImplToJson(
      this,
    );
  }
}

abstract class SettingsChanged extends NotificationType {
  const factory SettingsChanged() = _$SettingsChangedImpl;
  const SettingsChanged._() : super._();

  factory SettingsChanged.fromJson(Map<String, dynamic> json) =
      _$SettingsChangedImpl.fromJson;
}

NotificationFilter _$NotificationFilterFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'all':
      return All.fromJson(json);
    case 'unread':
      return Unread.fromJson(json);
    case 'read':
      return Read.fromJson(json);
    case 'expiryDay':
      return ExpiryDay.fromJson(json);
    case 'upcoming':
      return Upcoming.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'NotificationFilter',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$NotificationFilter {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() all,
    required TResult Function() unread,
    required TResult Function() read,
    required TResult Function() expiryDay,
    required TResult Function() upcoming,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? all,
    TResult? Function()? unread,
    TResult? Function()? read,
    TResult? Function()? expiryDay,
    TResult? Function()? upcoming,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? all,
    TResult Function()? unread,
    TResult Function()? read,
    TResult Function()? expiryDay,
    TResult Function()? upcoming,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(All value) all,
    required TResult Function(Unread value) unread,
    required TResult Function(Read value) read,
    required TResult Function(ExpiryDay value) expiryDay,
    required TResult Function(Upcoming value) upcoming,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(All value)? all,
    TResult? Function(Unread value)? unread,
    TResult? Function(Read value)? read,
    TResult? Function(ExpiryDay value)? expiryDay,
    TResult? Function(Upcoming value)? upcoming,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(All value)? all,
    TResult Function(Unread value)? unread,
    TResult Function(Read value)? read,
    TResult Function(ExpiryDay value)? expiryDay,
    TResult Function(Upcoming value)? upcoming,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this NotificationFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationFilterCopyWith<$Res> {
  factory $NotificationFilterCopyWith(
          NotificationFilter value, $Res Function(NotificationFilter) then) =
      _$NotificationFilterCopyWithImpl<$Res, NotificationFilter>;
}

/// @nodoc
class _$NotificationFilterCopyWithImpl<$Res, $Val extends NotificationFilter>
    implements $NotificationFilterCopyWith<$Res> {
  _$NotificationFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationFilter
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AllImplCopyWith<$Res> {
  factory _$$AllImplCopyWith(_$AllImpl value, $Res Function(_$AllImpl) then) =
      __$$AllImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AllImplCopyWithImpl<$Res>
    extends _$NotificationFilterCopyWithImpl<$Res, _$AllImpl>
    implements _$$AllImplCopyWith<$Res> {
  __$$AllImplCopyWithImpl(_$AllImpl _value, $Res Function(_$AllImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationFilter
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$AllImpl extends All {
  const _$AllImpl({final String? $type})
      : $type = $type ?? 'all',
        super._();

  factory _$AllImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationFilter.all()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AllImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() all,
    required TResult Function() unread,
    required TResult Function() read,
    required TResult Function() expiryDay,
    required TResult Function() upcoming,
  }) {
    return all();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? all,
    TResult? Function()? unread,
    TResult? Function()? read,
    TResult? Function()? expiryDay,
    TResult? Function()? upcoming,
  }) {
    return all?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? all,
    TResult Function()? unread,
    TResult Function()? read,
    TResult Function()? expiryDay,
    TResult Function()? upcoming,
    required TResult orElse(),
  }) {
    if (all != null) {
      return all();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(All value) all,
    required TResult Function(Unread value) unread,
    required TResult Function(Read value) read,
    required TResult Function(ExpiryDay value) expiryDay,
    required TResult Function(Upcoming value) upcoming,
  }) {
    return all(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(All value)? all,
    TResult? Function(Unread value)? unread,
    TResult? Function(Read value)? read,
    TResult? Function(ExpiryDay value)? expiryDay,
    TResult? Function(Upcoming value)? upcoming,
  }) {
    return all?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(All value)? all,
    TResult Function(Unread value)? unread,
    TResult Function(Read value)? read,
    TResult Function(ExpiryDay value)? expiryDay,
    TResult Function(Upcoming value)? upcoming,
    required TResult orElse(),
  }) {
    if (all != null) {
      return all(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AllImplToJson(
      this,
    );
  }
}

abstract class All extends NotificationFilter {
  const factory All() = _$AllImpl;
  const All._() : super._();

  factory All.fromJson(Map<String, dynamic> json) = _$AllImpl.fromJson;
}

/// @nodoc
abstract class _$$UnreadImplCopyWith<$Res> {
  factory _$$UnreadImplCopyWith(
          _$UnreadImpl value, $Res Function(_$UnreadImpl) then) =
      __$$UnreadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnreadImplCopyWithImpl<$Res>
    extends _$NotificationFilterCopyWithImpl<$Res, _$UnreadImpl>
    implements _$$UnreadImplCopyWith<$Res> {
  __$$UnreadImplCopyWithImpl(
      _$UnreadImpl _value, $Res Function(_$UnreadImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationFilter
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$UnreadImpl extends Unread {
  const _$UnreadImpl({final String? $type})
      : $type = $type ?? 'unread',
        super._();

  factory _$UnreadImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnreadImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationFilter.unread()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UnreadImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() all,
    required TResult Function() unread,
    required TResult Function() read,
    required TResult Function() expiryDay,
    required TResult Function() upcoming,
  }) {
    return unread();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? all,
    TResult? Function()? unread,
    TResult? Function()? read,
    TResult? Function()? expiryDay,
    TResult? Function()? upcoming,
  }) {
    return unread?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? all,
    TResult Function()? unread,
    TResult Function()? read,
    TResult Function()? expiryDay,
    TResult Function()? upcoming,
    required TResult orElse(),
  }) {
    if (unread != null) {
      return unread();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(All value) all,
    required TResult Function(Unread value) unread,
    required TResult Function(Read value) read,
    required TResult Function(ExpiryDay value) expiryDay,
    required TResult Function(Upcoming value) upcoming,
  }) {
    return unread(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(All value)? all,
    TResult? Function(Unread value)? unread,
    TResult? Function(Read value)? read,
    TResult? Function(ExpiryDay value)? expiryDay,
    TResult? Function(Upcoming value)? upcoming,
  }) {
    return unread?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(All value)? all,
    TResult Function(Unread value)? unread,
    TResult Function(Read value)? read,
    TResult Function(ExpiryDay value)? expiryDay,
    TResult Function(Upcoming value)? upcoming,
    required TResult orElse(),
  }) {
    if (unread != null) {
      return unread(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UnreadImplToJson(
      this,
    );
  }
}

abstract class Unread extends NotificationFilter {
  const factory Unread() = _$UnreadImpl;
  const Unread._() : super._();

  factory Unread.fromJson(Map<String, dynamic> json) = _$UnreadImpl.fromJson;
}

/// @nodoc
abstract class _$$ReadImplCopyWith<$Res> {
  factory _$$ReadImplCopyWith(
          _$ReadImpl value, $Res Function(_$ReadImpl) then) =
      __$$ReadImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadImplCopyWithImpl<$Res>
    extends _$NotificationFilterCopyWithImpl<$Res, _$ReadImpl>
    implements _$$ReadImplCopyWith<$Res> {
  __$$ReadImplCopyWithImpl(_$ReadImpl _value, $Res Function(_$ReadImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationFilter
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ReadImpl extends Read {
  const _$ReadImpl({final String? $type})
      : $type = $type ?? 'read',
        super._();

  factory _$ReadImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReadImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationFilter.read()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReadImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() all,
    required TResult Function() unread,
    required TResult Function() read,
    required TResult Function() expiryDay,
    required TResult Function() upcoming,
  }) {
    return read();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? all,
    TResult? Function()? unread,
    TResult? Function()? read,
    TResult? Function()? expiryDay,
    TResult? Function()? upcoming,
  }) {
    return read?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? all,
    TResult Function()? unread,
    TResult Function()? read,
    TResult Function()? expiryDay,
    TResult Function()? upcoming,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(All value) all,
    required TResult Function(Unread value) unread,
    required TResult Function(Read value) read,
    required TResult Function(ExpiryDay value) expiryDay,
    required TResult Function(Upcoming value) upcoming,
  }) {
    return read(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(All value)? all,
    TResult? Function(Unread value)? unread,
    TResult? Function(Read value)? read,
    TResult? Function(ExpiryDay value)? expiryDay,
    TResult? Function(Upcoming value)? upcoming,
  }) {
    return read?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(All value)? all,
    TResult Function(Unread value)? unread,
    TResult Function(Read value)? read,
    TResult Function(ExpiryDay value)? expiryDay,
    TResult Function(Upcoming value)? upcoming,
    required TResult orElse(),
  }) {
    if (read != null) {
      return read(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReadImplToJson(
      this,
    );
  }
}

abstract class Read extends NotificationFilter {
  const factory Read() = _$ReadImpl;
  const Read._() : super._();

  factory Read.fromJson(Map<String, dynamic> json) = _$ReadImpl.fromJson;
}

/// @nodoc
abstract class _$$ExpiryDayImplCopyWith<$Res> {
  factory _$$ExpiryDayImplCopyWith(
          _$ExpiryDayImpl value, $Res Function(_$ExpiryDayImpl) then) =
      __$$ExpiryDayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpiryDayImplCopyWithImpl<$Res>
    extends _$NotificationFilterCopyWithImpl<$Res, _$ExpiryDayImpl>
    implements _$$ExpiryDayImplCopyWith<$Res> {
  __$$ExpiryDayImplCopyWithImpl(
      _$ExpiryDayImpl _value, $Res Function(_$ExpiryDayImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationFilter
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ExpiryDayImpl extends ExpiryDay {
  const _$ExpiryDayImpl({final String? $type})
      : $type = $type ?? 'expiryDay',
        super._();

  factory _$ExpiryDayImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiryDayImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationFilter.expiryDay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpiryDayImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() all,
    required TResult Function() unread,
    required TResult Function() read,
    required TResult Function() expiryDay,
    required TResult Function() upcoming,
  }) {
    return expiryDay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? all,
    TResult? Function()? unread,
    TResult? Function()? read,
    TResult? Function()? expiryDay,
    TResult? Function()? upcoming,
  }) {
    return expiryDay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? all,
    TResult Function()? unread,
    TResult Function()? read,
    TResult Function()? expiryDay,
    TResult Function()? upcoming,
    required TResult orElse(),
  }) {
    if (expiryDay != null) {
      return expiryDay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(All value) all,
    required TResult Function(Unread value) unread,
    required TResult Function(Read value) read,
    required TResult Function(ExpiryDay value) expiryDay,
    required TResult Function(Upcoming value) upcoming,
  }) {
    return expiryDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(All value)? all,
    TResult? Function(Unread value)? unread,
    TResult? Function(Read value)? read,
    TResult? Function(ExpiryDay value)? expiryDay,
    TResult? Function(Upcoming value)? upcoming,
  }) {
    return expiryDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(All value)? all,
    TResult Function(Unread value)? unread,
    TResult Function(Read value)? read,
    TResult Function(ExpiryDay value)? expiryDay,
    TResult Function(Upcoming value)? upcoming,
    required TResult orElse(),
  }) {
    if (expiryDay != null) {
      return expiryDay(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiryDayImplToJson(
      this,
    );
  }
}

abstract class ExpiryDay extends NotificationFilter {
  const factory ExpiryDay() = _$ExpiryDayImpl;
  const ExpiryDay._() : super._();

  factory ExpiryDay.fromJson(Map<String, dynamic> json) =
      _$ExpiryDayImpl.fromJson;
}

/// @nodoc
abstract class _$$UpcomingImplCopyWith<$Res> {
  factory _$$UpcomingImplCopyWith(
          _$UpcomingImpl value, $Res Function(_$UpcomingImpl) then) =
      __$$UpcomingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpcomingImplCopyWithImpl<$Res>
    extends _$NotificationFilterCopyWithImpl<$Res, _$UpcomingImpl>
    implements _$$UpcomingImplCopyWith<$Res> {
  __$$UpcomingImplCopyWithImpl(
      _$UpcomingImpl _value, $Res Function(_$UpcomingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationFilter
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$UpcomingImpl extends Upcoming {
  const _$UpcomingImpl({final String? $type})
      : $type = $type ?? 'upcoming',
        super._();

  factory _$UpcomingImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpcomingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NotificationFilter.upcoming()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpcomingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() all,
    required TResult Function() unread,
    required TResult Function() read,
    required TResult Function() expiryDay,
    required TResult Function() upcoming,
  }) {
    return upcoming();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? all,
    TResult? Function()? unread,
    TResult? Function()? read,
    TResult? Function()? expiryDay,
    TResult? Function()? upcoming,
  }) {
    return upcoming?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? all,
    TResult Function()? unread,
    TResult Function()? read,
    TResult Function()? expiryDay,
    TResult Function()? upcoming,
    required TResult orElse(),
  }) {
    if (upcoming != null) {
      return upcoming();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(All value) all,
    required TResult Function(Unread value) unread,
    required TResult Function(Read value) read,
    required TResult Function(ExpiryDay value) expiryDay,
    required TResult Function(Upcoming value) upcoming,
  }) {
    return upcoming(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(All value)? all,
    TResult? Function(Unread value)? unread,
    TResult? Function(Read value)? read,
    TResult? Function(ExpiryDay value)? expiryDay,
    TResult? Function(Upcoming value)? upcoming,
  }) {
    return upcoming?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(All value)? all,
    TResult Function(Unread value)? unread,
    TResult Function(Read value)? read,
    TResult Function(ExpiryDay value)? expiryDay,
    TResult Function(Upcoming value)? upcoming,
    required TResult orElse(),
  }) {
    if (upcoming != null) {
      return upcoming(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpcomingImplToJson(
      this,
    );
  }
}

abstract class Upcoming extends NotificationFilter {
  const factory Upcoming() = _$UpcomingImpl;
  const Upcoming._() : super._();

  factory Upcoming.fromJson(Map<String, dynamic> json) =
      _$UpcomingImpl.fromJson;
}
