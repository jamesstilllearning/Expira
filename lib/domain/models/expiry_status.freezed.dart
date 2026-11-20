// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expiry_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpiryStatus _$ExpiryStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'expired':
      return Expired.fromJson(json);
    case 'expiring':
      return Expiring.fromJson(json);
    case 'soon':
      return Soon.fromJson(json);
    case 'safe':
      return Safe.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ExpiryStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ExpiryStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expired,
    required TResult Function() expiring,
    required TResult Function() soon,
    required TResult Function() safe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expired,
    TResult? Function()? expiring,
    TResult? Function()? soon,
    TResult? Function()? safe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expired,
    TResult Function()? expiring,
    TResult Function()? soon,
    TResult Function()? safe,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expired value) expired,
    required TResult Function(Expiring value) expiring,
    required TResult Function(Soon value) soon,
    required TResult Function(Safe value) safe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Expired value)? expired,
    TResult? Function(Expiring value)? expiring,
    TResult? Function(Soon value)? soon,
    TResult? Function(Safe value)? safe,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expired value)? expired,
    TResult Function(Expiring value)? expiring,
    TResult Function(Soon value)? soon,
    TResult Function(Safe value)? safe,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ExpiryStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpiryStatusCopyWith<$Res> {
  factory $ExpiryStatusCopyWith(
          ExpiryStatus value, $Res Function(ExpiryStatus) then) =
      _$ExpiryStatusCopyWithImpl<$Res, ExpiryStatus>;
}

/// @nodoc
class _$ExpiryStatusCopyWithImpl<$Res, $Val extends ExpiryStatus>
    implements $ExpiryStatusCopyWith<$Res> {
  _$ExpiryStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpiryStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ExpiredImplCopyWith<$Res> {
  factory _$$ExpiredImplCopyWith(
          _$ExpiredImpl value, $Res Function(_$ExpiredImpl) then) =
      __$$ExpiredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpiredImplCopyWithImpl<$Res>
    extends _$ExpiryStatusCopyWithImpl<$Res, _$ExpiredImpl>
    implements _$$ExpiredImplCopyWith<$Res> {
  __$$ExpiredImplCopyWithImpl(
      _$ExpiredImpl _value, $Res Function(_$ExpiredImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpiryStatus
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
    return 'ExpiryStatus.expired()';
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
    required TResult Function() expired,
    required TResult Function() expiring,
    required TResult Function() soon,
    required TResult Function() safe,
  }) {
    return expired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expired,
    TResult? Function()? expiring,
    TResult? Function()? soon,
    TResult? Function()? safe,
  }) {
    return expired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expired,
    TResult Function()? expiring,
    TResult Function()? soon,
    TResult Function()? safe,
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
    required TResult Function(Expired value) expired,
    required TResult Function(Expiring value) expiring,
    required TResult Function(Soon value) soon,
    required TResult Function(Safe value) safe,
  }) {
    return expired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Expired value)? expired,
    TResult? Function(Expiring value)? expiring,
    TResult? Function(Soon value)? soon,
    TResult? Function(Safe value)? safe,
  }) {
    return expired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expired value)? expired,
    TResult Function(Expiring value)? expiring,
    TResult Function(Soon value)? soon,
    TResult Function(Safe value)? safe,
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

abstract class Expired extends ExpiryStatus {
  const factory Expired() = _$ExpiredImpl;
  const Expired._() : super._();

  factory Expired.fromJson(Map<String, dynamic> json) = _$ExpiredImpl.fromJson;
}

/// @nodoc
abstract class _$$ExpiringImplCopyWith<$Res> {
  factory _$$ExpiringImplCopyWith(
          _$ExpiringImpl value, $Res Function(_$ExpiringImpl) then) =
      __$$ExpiringImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpiringImplCopyWithImpl<$Res>
    extends _$ExpiryStatusCopyWithImpl<$Res, _$ExpiringImpl>
    implements _$$ExpiringImplCopyWith<$Res> {
  __$$ExpiringImplCopyWithImpl(
      _$ExpiringImpl _value, $Res Function(_$ExpiringImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpiryStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ExpiringImpl extends Expiring {
  const _$ExpiringImpl({final String? $type})
      : $type = $type ?? 'expiring',
        super._();

  factory _$ExpiringImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiringImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ExpiryStatus.expiring()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpiringImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expired,
    required TResult Function() expiring,
    required TResult Function() soon,
    required TResult Function() safe,
  }) {
    return expiring();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expired,
    TResult? Function()? expiring,
    TResult? Function()? soon,
    TResult? Function()? safe,
  }) {
    return expiring?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expired,
    TResult Function()? expiring,
    TResult Function()? soon,
    TResult Function()? safe,
    required TResult orElse(),
  }) {
    if (expiring != null) {
      return expiring();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expired value) expired,
    required TResult Function(Expiring value) expiring,
    required TResult Function(Soon value) soon,
    required TResult Function(Safe value) safe,
  }) {
    return expiring(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Expired value)? expired,
    TResult? Function(Expiring value)? expiring,
    TResult? Function(Soon value)? soon,
    TResult? Function(Safe value)? safe,
  }) {
    return expiring?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expired value)? expired,
    TResult Function(Expiring value)? expiring,
    TResult Function(Soon value)? soon,
    TResult Function(Safe value)? safe,
    required TResult orElse(),
  }) {
    if (expiring != null) {
      return expiring(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiringImplToJson(
      this,
    );
  }
}

abstract class Expiring extends ExpiryStatus {
  const factory Expiring() = _$ExpiringImpl;
  const Expiring._() : super._();

  factory Expiring.fromJson(Map<String, dynamic> json) =
      _$ExpiringImpl.fromJson;
}

/// @nodoc
abstract class _$$SoonImplCopyWith<$Res> {
  factory _$$SoonImplCopyWith(
          _$SoonImpl value, $Res Function(_$SoonImpl) then) =
      __$$SoonImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SoonImplCopyWithImpl<$Res>
    extends _$ExpiryStatusCopyWithImpl<$Res, _$SoonImpl>
    implements _$$SoonImplCopyWith<$Res> {
  __$$SoonImplCopyWithImpl(_$SoonImpl _value, $Res Function(_$SoonImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpiryStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SoonImpl extends Soon {
  const _$SoonImpl({final String? $type})
      : $type = $type ?? 'soon',
        super._();

  factory _$SoonImpl.fromJson(Map<String, dynamic> json) =>
      _$$SoonImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ExpiryStatus.soon()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SoonImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expired,
    required TResult Function() expiring,
    required TResult Function() soon,
    required TResult Function() safe,
  }) {
    return soon();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expired,
    TResult? Function()? expiring,
    TResult? Function()? soon,
    TResult? Function()? safe,
  }) {
    return soon?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expired,
    TResult Function()? expiring,
    TResult Function()? soon,
    TResult Function()? safe,
    required TResult orElse(),
  }) {
    if (soon != null) {
      return soon();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expired value) expired,
    required TResult Function(Expiring value) expiring,
    required TResult Function(Soon value) soon,
    required TResult Function(Safe value) safe,
  }) {
    return soon(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Expired value)? expired,
    TResult? Function(Expiring value)? expiring,
    TResult? Function(Soon value)? soon,
    TResult? Function(Safe value)? safe,
  }) {
    return soon?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expired value)? expired,
    TResult Function(Expiring value)? expiring,
    TResult Function(Soon value)? soon,
    TResult Function(Safe value)? safe,
    required TResult orElse(),
  }) {
    if (soon != null) {
      return soon(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SoonImplToJson(
      this,
    );
  }
}

abstract class Soon extends ExpiryStatus {
  const factory Soon() = _$SoonImpl;
  const Soon._() : super._();

  factory Soon.fromJson(Map<String, dynamic> json) = _$SoonImpl.fromJson;
}

/// @nodoc
abstract class _$$SafeImplCopyWith<$Res> {
  factory _$$SafeImplCopyWith(
          _$SafeImpl value, $Res Function(_$SafeImpl) then) =
      __$$SafeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SafeImplCopyWithImpl<$Res>
    extends _$ExpiryStatusCopyWithImpl<$Res, _$SafeImpl>
    implements _$$SafeImplCopyWith<$Res> {
  __$$SafeImplCopyWithImpl(_$SafeImpl _value, $Res Function(_$SafeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpiryStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SafeImpl extends Safe {
  const _$SafeImpl({final String? $type})
      : $type = $type ?? 'safe',
        super._();

  factory _$SafeImpl.fromJson(Map<String, dynamic> json) =>
      _$$SafeImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ExpiryStatus.safe()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SafeImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() expired,
    required TResult Function() expiring,
    required TResult Function() soon,
    required TResult Function() safe,
  }) {
    return safe();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? expired,
    TResult? Function()? expiring,
    TResult? Function()? soon,
    TResult? Function()? safe,
  }) {
    return safe?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? expired,
    TResult Function()? expiring,
    TResult Function()? soon,
    TResult Function()? safe,
    required TResult orElse(),
  }) {
    if (safe != null) {
      return safe();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Expired value) expired,
    required TResult Function(Expiring value) expiring,
    required TResult Function(Soon value) soon,
    required TResult Function(Safe value) safe,
  }) {
    return safe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Expired value)? expired,
    TResult? Function(Expiring value)? expiring,
    TResult? Function(Soon value)? soon,
    TResult? Function(Safe value)? safe,
  }) {
    return safe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Expired value)? expired,
    TResult Function(Expiring value)? expiring,
    TResult Function(Soon value)? soon,
    TResult Function(Safe value)? safe,
    required TResult orElse(),
  }) {
    if (safe != null) {
      return safe(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SafeImplToJson(
      this,
    );
  }
}

abstract class Safe extends ExpiryStatus {
  const factory Safe() = _$SafeImpl;
  const Safe._() : super._();

  factory Safe.fromJson(Map<String, dynamic> json) = _$SafeImpl.fromJson;
}
