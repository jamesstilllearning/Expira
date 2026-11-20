// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reminder_schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReminderScheduleItem _$ReminderScheduleItemFromJson(Map<String, dynamic> json) {
  return _ReminderScheduleItem.fromJson(json);
}

/// @nodoc
mixin _$ReminderScheduleItem {
  /// Days before expiry to notify
  int get daysBefore => throw _privateConstructorUsedError;

  /// Whether this reminder is enabled
  bool get enabled => throw _privateConstructorUsedError;

  /// Custom label (optional)
  String get label => throw _privateConstructorUsedError;

  /// Serializes this ReminderScheduleItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReminderScheduleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReminderScheduleItemCopyWith<ReminderScheduleItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReminderScheduleItemCopyWith<$Res> {
  factory $ReminderScheduleItemCopyWith(ReminderScheduleItem value,
          $Res Function(ReminderScheduleItem) then) =
      _$ReminderScheduleItemCopyWithImpl<$Res, ReminderScheduleItem>;
  @useResult
  $Res call({int daysBefore, bool enabled, String label});
}

/// @nodoc
class _$ReminderScheduleItemCopyWithImpl<$Res,
        $Val extends ReminderScheduleItem>
    implements $ReminderScheduleItemCopyWith<$Res> {
  _$ReminderScheduleItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReminderScheduleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysBefore = null,
    Object? enabled = null,
    Object? label = null,
  }) {
    return _then(_value.copyWith(
      daysBefore: null == daysBefore
          ? _value.daysBefore
          : daysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReminderScheduleItemImplCopyWith<$Res>
    implements $ReminderScheduleItemCopyWith<$Res> {
  factory _$$ReminderScheduleItemImplCopyWith(_$ReminderScheduleItemImpl value,
          $Res Function(_$ReminderScheduleItemImpl) then) =
      __$$ReminderScheduleItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int daysBefore, bool enabled, String label});
}

/// @nodoc
class __$$ReminderScheduleItemImplCopyWithImpl<$Res>
    extends _$ReminderScheduleItemCopyWithImpl<$Res, _$ReminderScheduleItemImpl>
    implements _$$ReminderScheduleItemImplCopyWith<$Res> {
  __$$ReminderScheduleItemImplCopyWithImpl(_$ReminderScheduleItemImpl _value,
      $Res Function(_$ReminderScheduleItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReminderScheduleItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysBefore = null,
    Object? enabled = null,
    Object? label = null,
  }) {
    return _then(_$ReminderScheduleItemImpl(
      daysBefore: null == daysBefore
          ? _value.daysBefore
          : daysBefore // ignore: cast_nullable_to_non_nullable
              as int,
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReminderScheduleItemImpl extends _ReminderScheduleItem {
  const _$ReminderScheduleItemImpl(
      {this.daysBefore = 1, this.enabled = true, this.label = ''})
      : super._();

  factory _$ReminderScheduleItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReminderScheduleItemImplFromJson(json);

  /// Days before expiry to notify
  @override
  @JsonKey()
  final int daysBefore;

  /// Whether this reminder is enabled
  @override
  @JsonKey()
  final bool enabled;

  /// Custom label (optional)
  @override
  @JsonKey()
  final String label;

  @override
  String toString() {
    return 'ReminderScheduleItem(daysBefore: $daysBefore, enabled: $enabled, label: $label)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReminderScheduleItemImpl &&
            (identical(other.daysBefore, daysBefore) ||
                other.daysBefore == daysBefore) &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.label, label) || other.label == label));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, daysBefore, enabled, label);

  /// Create a copy of ReminderScheduleItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReminderScheduleItemImplCopyWith<_$ReminderScheduleItemImpl>
      get copyWith =>
          __$$ReminderScheduleItemImplCopyWithImpl<_$ReminderScheduleItemImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReminderScheduleItemImplToJson(
      this,
    );
  }
}

abstract class _ReminderScheduleItem extends ReminderScheduleItem {
  const factory _ReminderScheduleItem(
      {final int daysBefore,
      final bool enabled,
      final String label}) = _$ReminderScheduleItemImpl;
  const _ReminderScheduleItem._() : super._();

  factory _ReminderScheduleItem.fromJson(Map<String, dynamic> json) =
      _$ReminderScheduleItemImpl.fromJson;

  /// Days before expiry to notify
  @override
  int get daysBefore;

  /// Whether this reminder is enabled
  @override
  bool get enabled;

  /// Custom label (optional)
  @override
  String get label;

  /// Create a copy of ReminderScheduleItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReminderScheduleItemImplCopyWith<_$ReminderScheduleItemImpl>
      get copyWith => throw _privateConstructorUsedError;
}
