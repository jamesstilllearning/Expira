// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityType _$ActivityTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'itemAdded':
      return ItemAdded.fromJson(json);
    case 'itemUpdated':
      return ItemUpdated.fromJson(json);
    case 'itemUsed':
      return ItemUsed.fromJson(json);
    case 'itemExpired':
      return ItemExpired.fromJson(json);
    case 'itemDeleted':
      return ItemDeleted.fromJson(json);
    case 'memberJoined':
      return MemberJoined.fromJson(json);
    case 'memberLeft':
      return MemberLeft.fromJson(json);
    case 'memberRoleChanged':
      return MemberRoleChanged.fromJson(json);
    case 'settingsChanged':
      return SettingsChanged.fromJson(json);
    case 'householdCreated':
      return HouseholdCreated.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ActivityType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ActivityType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ActivityType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityTypeCopyWith<$Res> {
  factory $ActivityTypeCopyWith(
          ActivityType value, $Res Function(ActivityType) then) =
      _$ActivityTypeCopyWithImpl<$Res, ActivityType>;
}

/// @nodoc
class _$ActivityTypeCopyWithImpl<$Res, $Val extends ActivityType>
    implements $ActivityTypeCopyWith<$Res> {
  _$ActivityTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ItemAddedImplCopyWith<$Res> {
  factory _$$ItemAddedImplCopyWith(
          _$ItemAddedImpl value, $Res Function(_$ItemAddedImpl) then) =
      __$$ItemAddedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemAddedImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$ItemAddedImpl>
    implements _$$ItemAddedImplCopyWith<$Res> {
  __$$ItemAddedImplCopyWithImpl(
      _$ItemAddedImpl _value, $Res Function(_$ItemAddedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ItemAddedImpl extends ItemAdded {
  const _$ItemAddedImpl({final String? $type})
      : $type = $type ?? 'itemAdded',
        super._();

  factory _$ItemAddedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemAddedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ActivityType.itemAdded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ItemAddedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return itemAdded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return itemAdded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
    required TResult orElse(),
  }) {
    if (itemAdded != null) {
      return itemAdded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return itemAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return itemAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
    required TResult orElse(),
  }) {
    if (itemAdded != null) {
      return itemAdded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemAddedImplToJson(
      this,
    );
  }
}

abstract class ItemAdded extends ActivityType {
  const factory ItemAdded() = _$ItemAddedImpl;
  const ItemAdded._() : super._();

  factory ItemAdded.fromJson(Map<String, dynamic> json) =
      _$ItemAddedImpl.fromJson;
}

/// @nodoc
abstract class _$$ItemUpdatedImplCopyWith<$Res> {
  factory _$$ItemUpdatedImplCopyWith(
          _$ItemUpdatedImpl value, $Res Function(_$ItemUpdatedImpl) then) =
      __$$ItemUpdatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemUpdatedImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$ItemUpdatedImpl>
    implements _$$ItemUpdatedImplCopyWith<$Res> {
  __$$ItemUpdatedImplCopyWithImpl(
      _$ItemUpdatedImpl _value, $Res Function(_$ItemUpdatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ItemUpdatedImpl extends ItemUpdated {
  const _$ItemUpdatedImpl({final String? $type})
      : $type = $type ?? 'itemUpdated',
        super._();

  factory _$ItemUpdatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemUpdatedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ActivityType.itemUpdated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ItemUpdatedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return itemUpdated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return itemUpdated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
    required TResult orElse(),
  }) {
    if (itemUpdated != null) {
      return itemUpdated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return itemUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return itemUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
    required TResult orElse(),
  }) {
    if (itemUpdated != null) {
      return itemUpdated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemUpdatedImplToJson(
      this,
    );
  }
}

abstract class ItemUpdated extends ActivityType {
  const factory ItemUpdated() = _$ItemUpdatedImpl;
  const ItemUpdated._() : super._();

  factory ItemUpdated.fromJson(Map<String, dynamic> json) =
      _$ItemUpdatedImpl.fromJson;
}

/// @nodoc
abstract class _$$ItemUsedImplCopyWith<$Res> {
  factory _$$ItemUsedImplCopyWith(
          _$ItemUsedImpl value, $Res Function(_$ItemUsedImpl) then) =
      __$$ItemUsedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemUsedImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$ItemUsedImpl>
    implements _$$ItemUsedImplCopyWith<$Res> {
  __$$ItemUsedImplCopyWithImpl(
      _$ItemUsedImpl _value, $Res Function(_$ItemUsedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
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
    return 'ActivityType.itemUsed()';
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
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return itemUsed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return itemUsed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
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
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return itemUsed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return itemUsed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
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

abstract class ItemUsed extends ActivityType {
  const factory ItemUsed() = _$ItemUsedImpl;
  const ItemUsed._() : super._();

  factory ItemUsed.fromJson(Map<String, dynamic> json) =
      _$ItemUsedImpl.fromJson;
}

/// @nodoc
abstract class _$$ItemExpiredImplCopyWith<$Res> {
  factory _$$ItemExpiredImplCopyWith(
          _$ItemExpiredImpl value, $Res Function(_$ItemExpiredImpl) then) =
      __$$ItemExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemExpiredImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$ItemExpiredImpl>
    implements _$$ItemExpiredImplCopyWith<$Res> {
  __$$ItemExpiredImplCopyWithImpl(
      _$ItemExpiredImpl _value, $Res Function(_$ItemExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
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
    return 'ActivityType.itemExpired()';
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
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return itemExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return itemExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
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
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return itemExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return itemExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
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

abstract class ItemExpired extends ActivityType {
  const factory ItemExpired() = _$ItemExpiredImpl;
  const ItemExpired._() : super._();

  factory ItemExpired.fromJson(Map<String, dynamic> json) =
      _$ItemExpiredImpl.fromJson;
}

/// @nodoc
abstract class _$$ItemDeletedImplCopyWith<$Res> {
  factory _$$ItemDeletedImplCopyWith(
          _$ItemDeletedImpl value, $Res Function(_$ItemDeletedImpl) then) =
      __$$ItemDeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemDeletedImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$ItemDeletedImpl>
    implements _$$ItemDeletedImplCopyWith<$Res> {
  __$$ItemDeletedImplCopyWithImpl(
      _$ItemDeletedImpl _value, $Res Function(_$ItemDeletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ItemDeletedImpl extends ItemDeleted {
  const _$ItemDeletedImpl({final String? $type})
      : $type = $type ?? 'itemDeleted',
        super._();

  factory _$ItemDeletedImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemDeletedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ActivityType.itemDeleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ItemDeletedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return itemDeleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return itemDeleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
    required TResult orElse(),
  }) {
    if (itemDeleted != null) {
      return itemDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return itemDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return itemDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
    required TResult orElse(),
  }) {
    if (itemDeleted != null) {
      return itemDeleted(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemDeletedImplToJson(
      this,
    );
  }
}

abstract class ItemDeleted extends ActivityType {
  const factory ItemDeleted() = _$ItemDeletedImpl;
  const ItemDeleted._() : super._();

  factory ItemDeleted.fromJson(Map<String, dynamic> json) =
      _$ItemDeletedImpl.fromJson;
}

/// @nodoc
abstract class _$$MemberJoinedImplCopyWith<$Res> {
  factory _$$MemberJoinedImplCopyWith(
          _$MemberJoinedImpl value, $Res Function(_$MemberJoinedImpl) then) =
      __$$MemberJoinedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemberJoinedImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$MemberJoinedImpl>
    implements _$$MemberJoinedImplCopyWith<$Res> {
  __$$MemberJoinedImplCopyWithImpl(
      _$MemberJoinedImpl _value, $Res Function(_$MemberJoinedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$MemberJoinedImpl extends MemberJoined {
  const _$MemberJoinedImpl({final String? $type})
      : $type = $type ?? 'memberJoined',
        super._();

  factory _$MemberJoinedImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberJoinedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ActivityType.memberJoined()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MemberJoinedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return memberJoined();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return memberJoined?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
    required TResult orElse(),
  }) {
    if (memberJoined != null) {
      return memberJoined();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return memberJoined(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return memberJoined?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
    required TResult orElse(),
  }) {
    if (memberJoined != null) {
      return memberJoined(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberJoinedImplToJson(
      this,
    );
  }
}

abstract class MemberJoined extends ActivityType {
  const factory MemberJoined() = _$MemberJoinedImpl;
  const MemberJoined._() : super._();

  factory MemberJoined.fromJson(Map<String, dynamic> json) =
      _$MemberJoinedImpl.fromJson;
}

/// @nodoc
abstract class _$$MemberLeftImplCopyWith<$Res> {
  factory _$$MemberLeftImplCopyWith(
          _$MemberLeftImpl value, $Res Function(_$MemberLeftImpl) then) =
      __$$MemberLeftImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemberLeftImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$MemberLeftImpl>
    implements _$$MemberLeftImplCopyWith<$Res> {
  __$$MemberLeftImplCopyWithImpl(
      _$MemberLeftImpl _value, $Res Function(_$MemberLeftImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$MemberLeftImpl extends MemberLeft {
  const _$MemberLeftImpl({final String? $type})
      : $type = $type ?? 'memberLeft',
        super._();

  factory _$MemberLeftImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberLeftImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ActivityType.memberLeft()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MemberLeftImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return memberLeft();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return memberLeft?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
    required TResult orElse(),
  }) {
    if (memberLeft != null) {
      return memberLeft();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return memberLeft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return memberLeft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
    required TResult orElse(),
  }) {
    if (memberLeft != null) {
      return memberLeft(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberLeftImplToJson(
      this,
    );
  }
}

abstract class MemberLeft extends ActivityType {
  const factory MemberLeft() = _$MemberLeftImpl;
  const MemberLeft._() : super._();

  factory MemberLeft.fromJson(Map<String, dynamic> json) =
      _$MemberLeftImpl.fromJson;
}

/// @nodoc
abstract class _$$MemberRoleChangedImplCopyWith<$Res> {
  factory _$$MemberRoleChangedImplCopyWith(_$MemberRoleChangedImpl value,
          $Res Function(_$MemberRoleChangedImpl) then) =
      __$$MemberRoleChangedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemberRoleChangedImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$MemberRoleChangedImpl>
    implements _$$MemberRoleChangedImplCopyWith<$Res> {
  __$$MemberRoleChangedImplCopyWithImpl(_$MemberRoleChangedImpl _value,
      $Res Function(_$MemberRoleChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$MemberRoleChangedImpl extends MemberRoleChanged {
  const _$MemberRoleChangedImpl({final String? $type})
      : $type = $type ?? 'memberRoleChanged',
        super._();

  factory _$MemberRoleChangedImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberRoleChangedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ActivityType.memberRoleChanged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MemberRoleChangedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return memberRoleChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return memberRoleChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
    required TResult orElse(),
  }) {
    if (memberRoleChanged != null) {
      return memberRoleChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return memberRoleChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return memberRoleChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
    required TResult orElse(),
  }) {
    if (memberRoleChanged != null) {
      return memberRoleChanged(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberRoleChangedImplToJson(
      this,
    );
  }
}

abstract class MemberRoleChanged extends ActivityType {
  const factory MemberRoleChanged() = _$MemberRoleChangedImpl;
  const MemberRoleChanged._() : super._();

  factory MemberRoleChanged.fromJson(Map<String, dynamic> json) =
      _$MemberRoleChangedImpl.fromJson;
}

/// @nodoc
abstract class _$$SettingsChangedImplCopyWith<$Res> {
  factory _$$SettingsChangedImplCopyWith(_$SettingsChangedImpl value,
          $Res Function(_$SettingsChangedImpl) then) =
      __$$SettingsChangedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SettingsChangedImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$SettingsChangedImpl>
    implements _$$SettingsChangedImplCopyWith<$Res> {
  __$$SettingsChangedImplCopyWithImpl(
      _$SettingsChangedImpl _value, $Res Function(_$SettingsChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
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
    return 'ActivityType.settingsChanged()';
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
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return settingsChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return settingsChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
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
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return settingsChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return settingsChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
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

abstract class SettingsChanged extends ActivityType {
  const factory SettingsChanged() = _$SettingsChangedImpl;
  const SettingsChanged._() : super._();

  factory SettingsChanged.fromJson(Map<String, dynamic> json) =
      _$SettingsChangedImpl.fromJson;
}

/// @nodoc
abstract class _$$HouseholdCreatedImplCopyWith<$Res> {
  factory _$$HouseholdCreatedImplCopyWith(_$HouseholdCreatedImpl value,
          $Res Function(_$HouseholdCreatedImpl) then) =
      __$$HouseholdCreatedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HouseholdCreatedImplCopyWithImpl<$Res>
    extends _$ActivityTypeCopyWithImpl<$Res, _$HouseholdCreatedImpl>
    implements _$$HouseholdCreatedImplCopyWith<$Res> {
  __$$HouseholdCreatedImplCopyWithImpl(_$HouseholdCreatedImpl _value,
      $Res Function(_$HouseholdCreatedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$HouseholdCreatedImpl extends HouseholdCreated {
  const _$HouseholdCreatedImpl({final String? $type})
      : $type = $type ?? 'householdCreated',
        super._();

  factory _$HouseholdCreatedImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseholdCreatedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ActivityType.householdCreated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$HouseholdCreatedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() itemAdded,
    required TResult Function() itemUpdated,
    required TResult Function() itemUsed,
    required TResult Function() itemExpired,
    required TResult Function() itemDeleted,
    required TResult Function() memberJoined,
    required TResult Function() memberLeft,
    required TResult Function() memberRoleChanged,
    required TResult Function() settingsChanged,
    required TResult Function() householdCreated,
  }) {
    return householdCreated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? itemAdded,
    TResult? Function()? itemUpdated,
    TResult? Function()? itemUsed,
    TResult? Function()? itemExpired,
    TResult? Function()? itemDeleted,
    TResult? Function()? memberJoined,
    TResult? Function()? memberLeft,
    TResult? Function()? memberRoleChanged,
    TResult? Function()? settingsChanged,
    TResult? Function()? householdCreated,
  }) {
    return householdCreated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? itemAdded,
    TResult Function()? itemUpdated,
    TResult Function()? itemUsed,
    TResult Function()? itemExpired,
    TResult Function()? itemDeleted,
    TResult Function()? memberJoined,
    TResult Function()? memberLeft,
    TResult Function()? memberRoleChanged,
    TResult Function()? settingsChanged,
    TResult Function()? householdCreated,
    required TResult orElse(),
  }) {
    if (householdCreated != null) {
      return householdCreated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemAdded value) itemAdded,
    required TResult Function(ItemUpdated value) itemUpdated,
    required TResult Function(ItemUsed value) itemUsed,
    required TResult Function(ItemExpired value) itemExpired,
    required TResult Function(ItemDeleted value) itemDeleted,
    required TResult Function(MemberJoined value) memberJoined,
    required TResult Function(MemberLeft value) memberLeft,
    required TResult Function(MemberRoleChanged value) memberRoleChanged,
    required TResult Function(SettingsChanged value) settingsChanged,
    required TResult Function(HouseholdCreated value) householdCreated,
  }) {
    return householdCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemAdded value)? itemAdded,
    TResult? Function(ItemUpdated value)? itemUpdated,
    TResult? Function(ItemUsed value)? itemUsed,
    TResult? Function(ItemExpired value)? itemExpired,
    TResult? Function(ItemDeleted value)? itemDeleted,
    TResult? Function(MemberJoined value)? memberJoined,
    TResult? Function(MemberLeft value)? memberLeft,
    TResult? Function(MemberRoleChanged value)? memberRoleChanged,
    TResult? Function(SettingsChanged value)? settingsChanged,
    TResult? Function(HouseholdCreated value)? householdCreated,
  }) {
    return householdCreated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemAdded value)? itemAdded,
    TResult Function(ItemUpdated value)? itemUpdated,
    TResult Function(ItemUsed value)? itemUsed,
    TResult Function(ItemExpired value)? itemExpired,
    TResult Function(ItemDeleted value)? itemDeleted,
    TResult Function(MemberJoined value)? memberJoined,
    TResult Function(MemberLeft value)? memberLeft,
    TResult Function(MemberRoleChanged value)? memberRoleChanged,
    TResult Function(SettingsChanged value)? settingsChanged,
    TResult Function(HouseholdCreated value)? householdCreated,
    required TResult orElse(),
  }) {
    if (householdCreated != null) {
      return householdCreated(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseholdCreatedImplToJson(
      this,
    );
  }
}

abstract class HouseholdCreated extends ActivityType {
  const factory HouseholdCreated() = _$HouseholdCreatedImpl;
  const HouseholdCreated._() : super._();

  factory HouseholdCreated.fromJson(Map<String, dynamic> json) =
      _$HouseholdCreatedImpl.fromJson;
}

ActivityEvent _$ActivityEventFromJson(Map<String, dynamic> json) {
  return _ActivityEvent.fromJson(json);
}

/// @nodoc
mixin _$ActivityEvent {
  /// Unique event ID
  String get id => throw _privateConstructorUsedError;

  /// Household ID
  String get householdId => throw _privateConstructorUsedError;

  /// Event type
  ActivityType get type => throw _privateConstructorUsedError;

  /// Actor user ID
  String get actorUid => throw _privateConstructorUsedError;

  /// Actor display name
  String get actorName => throw _privateConstructorUsedError;

  /// Event payload (structured data)
  Map<String, dynamic> get payload => throw _privateConstructorUsedError;

  /// Timestamp
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Server document ID
  String get serverId => throw _privateConstructorUsedError;

  /// Serializes this ActivityEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityEventCopyWith<ActivityEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityEventCopyWith<$Res> {
  factory $ActivityEventCopyWith(
          ActivityEvent value, $Res Function(ActivityEvent) then) =
      _$ActivityEventCopyWithImpl<$Res, ActivityEvent>;
  @useResult
  $Res call(
      {String id,
      String householdId,
      ActivityType type,
      String actorUid,
      String actorName,
      Map<String, dynamic> payload,
      DateTime timestamp,
      String serverId});

  $ActivityTypeCopyWith<$Res> get type;
}

/// @nodoc
class _$ActivityEventCopyWithImpl<$Res, $Val extends ActivityEvent>
    implements $ActivityEventCopyWith<$Res> {
  _$ActivityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? householdId = null,
    Object? type = null,
    Object? actorUid = null,
    Object? actorName = null,
    Object? payload = null,
    Object? timestamp = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      actorUid: null == actorUid
          ? _value.actorUid
          : actorUid // ignore: cast_nullable_to_non_nullable
              as String,
      actorName: null == actorName
          ? _value.actorName
          : actorName // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActivityTypeCopyWith<$Res> get type {
    return $ActivityTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActivityEventImplCopyWith<$Res>
    implements $ActivityEventCopyWith<$Res> {
  factory _$$ActivityEventImplCopyWith(
          _$ActivityEventImpl value, $Res Function(_$ActivityEventImpl) then) =
      __$$ActivityEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String householdId,
      ActivityType type,
      String actorUid,
      String actorName,
      Map<String, dynamic> payload,
      DateTime timestamp,
      String serverId});

  @override
  $ActivityTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$ActivityEventImplCopyWithImpl<$Res>
    extends _$ActivityEventCopyWithImpl<$Res, _$ActivityEventImpl>
    implements _$$ActivityEventImplCopyWith<$Res> {
  __$$ActivityEventImplCopyWithImpl(
      _$ActivityEventImpl _value, $Res Function(_$ActivityEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? householdId = null,
    Object? type = null,
    Object? actorUid = null,
    Object? actorName = null,
    Object? payload = null,
    Object? timestamp = null,
    Object? serverId = null,
  }) {
    return _then(_$ActivityEventImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      householdId: null == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      actorUid: null == actorUid
          ? _value.actorUid
          : actorUid // ignore: cast_nullable_to_non_nullable
              as String,
      actorName: null == actorName
          ? _value.actorName
          : actorName // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityEventImpl extends _ActivityEvent {
  const _$ActivityEventImpl(
      {this.id = '',
      this.householdId = '',
      required this.type,
      this.actorUid = '',
      this.actorName = '',
      final Map<String, dynamic> payload = const {},
      required this.timestamp,
      this.serverId = ''})
      : _payload = payload,
        super._();

  factory _$ActivityEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityEventImplFromJson(json);

  /// Unique event ID
  @override
  @JsonKey()
  final String id;

  /// Household ID
  @override
  @JsonKey()
  final String householdId;

  /// Event type
  @override
  final ActivityType type;

  /// Actor user ID
  @override
  @JsonKey()
  final String actorUid;

  /// Actor display name
  @override
  @JsonKey()
  final String actorName;

  /// Event payload (structured data)
  final Map<String, dynamic> _payload;

  /// Event payload (structured data)
  @override
  @JsonKey()
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  /// Timestamp
  @override
  final DateTime timestamp;

  /// Server document ID
  @override
  @JsonKey()
  final String serverId;

  @override
  String toString() {
    return 'ActivityEvent(id: $id, householdId: $householdId, type: $type, actorUid: $actorUid, actorName: $actorName, payload: $payload, timestamp: $timestamp, serverId: $serverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.householdId, householdId) ||
                other.householdId == householdId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.actorUid, actorUid) ||
                other.actorUid == actorUid) &&
            (identical(other.actorName, actorName) ||
                other.actorName == actorName) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      householdId,
      type,
      actorUid,
      actorName,
      const DeepCollectionEquality().hash(_payload),
      timestamp,
      serverId);

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityEventImplCopyWith<_$ActivityEventImpl> get copyWith =>
      __$$ActivityEventImplCopyWithImpl<_$ActivityEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityEventImplToJson(
      this,
    );
  }
}

abstract class _ActivityEvent extends ActivityEvent {
  const factory _ActivityEvent(
      {final String id,
      final String householdId,
      required final ActivityType type,
      final String actorUid,
      final String actorName,
      final Map<String, dynamic> payload,
      required final DateTime timestamp,
      final String serverId}) = _$ActivityEventImpl;
  const _ActivityEvent._() : super._();

  factory _ActivityEvent.fromJson(Map<String, dynamic> json) =
      _$ActivityEventImpl.fromJson;

  /// Unique event ID
  @override
  String get id;

  /// Household ID
  @override
  String get householdId;

  /// Event type
  @override
  ActivityType get type;

  /// Actor user ID
  @override
  String get actorUid;

  /// Actor display name
  @override
  String get actorName;

  /// Event payload (structured data)
  @override
  Map<String, dynamic> get payload;

  /// Timestamp
  @override
  DateTime get timestamp;

  /// Server document ID
  @override
  String get serverId;

  /// Create a copy of ActivityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityEventImplCopyWith<_$ActivityEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
