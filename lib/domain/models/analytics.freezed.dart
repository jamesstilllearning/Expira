// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AnalyticsPeriod _$AnalyticsPeriodFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'week':
      return Week.fromJson(json);
    case 'month':
      return Month.fromJson(json);
    case 'year':
      return Year.fromJson(json);
    case 'custom':
      return Custom.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'AnalyticsPeriod',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$AnalyticsPeriod {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() week,
    required TResult Function() month,
    required TResult Function() year,
    required TResult Function(DateTime start, DateTime end) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? week,
    TResult? Function()? month,
    TResult? Function()? year,
    TResult? Function(DateTime start, DateTime end)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? week,
    TResult Function()? month,
    TResult Function()? year,
    TResult Function(DateTime start, DateTime end)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Week value) week,
    required TResult Function(Month value) month,
    required TResult Function(Year value) year,
    required TResult Function(Custom value) custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Week value)? week,
    TResult? Function(Month value)? month,
    TResult? Function(Year value)? year,
    TResult? Function(Custom value)? custom,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Week value)? week,
    TResult Function(Month value)? month,
    TResult Function(Year value)? year,
    TResult Function(Custom value)? custom,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this AnalyticsPeriod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsPeriodCopyWith<$Res> {
  factory $AnalyticsPeriodCopyWith(
          AnalyticsPeriod value, $Res Function(AnalyticsPeriod) then) =
      _$AnalyticsPeriodCopyWithImpl<$Res, AnalyticsPeriod>;
}

/// @nodoc
class _$AnalyticsPeriodCopyWithImpl<$Res, $Val extends AnalyticsPeriod>
    implements $AnalyticsPeriodCopyWith<$Res> {
  _$AnalyticsPeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsPeriod
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WeekImplCopyWith<$Res> {
  factory _$$WeekImplCopyWith(
          _$WeekImpl value, $Res Function(_$WeekImpl) then) =
      __$$WeekImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeekImplCopyWithImpl<$Res>
    extends _$AnalyticsPeriodCopyWithImpl<$Res, _$WeekImpl>
    implements _$$WeekImplCopyWith<$Res> {
  __$$WeekImplCopyWithImpl(_$WeekImpl _value, $Res Function(_$WeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsPeriod
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$WeekImpl extends Week {
  const _$WeekImpl({final String? $type})
      : $type = $type ?? 'week',
        super._();

  factory _$WeekImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeekImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AnalyticsPeriod.week()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeekImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() week,
    required TResult Function() month,
    required TResult Function() year,
    required TResult Function(DateTime start, DateTime end) custom,
  }) {
    return week();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? week,
    TResult? Function()? month,
    TResult? Function()? year,
    TResult? Function(DateTime start, DateTime end)? custom,
  }) {
    return week?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? week,
    TResult Function()? month,
    TResult Function()? year,
    TResult Function(DateTime start, DateTime end)? custom,
    required TResult orElse(),
  }) {
    if (week != null) {
      return week();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Week value) week,
    required TResult Function(Month value) month,
    required TResult Function(Year value) year,
    required TResult Function(Custom value) custom,
  }) {
    return week(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Week value)? week,
    TResult? Function(Month value)? month,
    TResult? Function(Year value)? year,
    TResult? Function(Custom value)? custom,
  }) {
    return week?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Week value)? week,
    TResult Function(Month value)? month,
    TResult Function(Year value)? year,
    TResult Function(Custom value)? custom,
    required TResult orElse(),
  }) {
    if (week != null) {
      return week(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WeekImplToJson(
      this,
    );
  }
}

abstract class Week extends AnalyticsPeriod {
  const factory Week() = _$WeekImpl;
  const Week._() : super._();

  factory Week.fromJson(Map<String, dynamic> json) = _$WeekImpl.fromJson;
}

/// @nodoc
abstract class _$$MonthImplCopyWith<$Res> {
  factory _$$MonthImplCopyWith(
          _$MonthImpl value, $Res Function(_$MonthImpl) then) =
      __$$MonthImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MonthImplCopyWithImpl<$Res>
    extends _$AnalyticsPeriodCopyWithImpl<$Res, _$MonthImpl>
    implements _$$MonthImplCopyWith<$Res> {
  __$$MonthImplCopyWithImpl(
      _$MonthImpl _value, $Res Function(_$MonthImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsPeriod
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$MonthImpl extends Month {
  const _$MonthImpl({final String? $type})
      : $type = $type ?? 'month',
        super._();

  factory _$MonthImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AnalyticsPeriod.month()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MonthImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() week,
    required TResult Function() month,
    required TResult Function() year,
    required TResult Function(DateTime start, DateTime end) custom,
  }) {
    return month();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? week,
    TResult? Function()? month,
    TResult? Function()? year,
    TResult? Function(DateTime start, DateTime end)? custom,
  }) {
    return month?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? week,
    TResult Function()? month,
    TResult Function()? year,
    TResult Function(DateTime start, DateTime end)? custom,
    required TResult orElse(),
  }) {
    if (month != null) {
      return month();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Week value) week,
    required TResult Function(Month value) month,
    required TResult Function(Year value) year,
    required TResult Function(Custom value) custom,
  }) {
    return month(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Week value)? week,
    TResult? Function(Month value)? month,
    TResult? Function(Year value)? year,
    TResult? Function(Custom value)? custom,
  }) {
    return month?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Week value)? week,
    TResult Function(Month value)? month,
    TResult Function(Year value)? year,
    TResult Function(Custom value)? custom,
    required TResult orElse(),
  }) {
    if (month != null) {
      return month(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthImplToJson(
      this,
    );
  }
}

abstract class Month extends AnalyticsPeriod {
  const factory Month() = _$MonthImpl;
  const Month._() : super._();

  factory Month.fromJson(Map<String, dynamic> json) = _$MonthImpl.fromJson;
}

/// @nodoc
abstract class _$$YearImplCopyWith<$Res> {
  factory _$$YearImplCopyWith(
          _$YearImpl value, $Res Function(_$YearImpl) then) =
      __$$YearImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$YearImplCopyWithImpl<$Res>
    extends _$AnalyticsPeriodCopyWithImpl<$Res, _$YearImpl>
    implements _$$YearImplCopyWith<$Res> {
  __$$YearImplCopyWithImpl(_$YearImpl _value, $Res Function(_$YearImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsPeriod
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$YearImpl extends Year {
  const _$YearImpl({final String? $type})
      : $type = $type ?? 'year',
        super._();

  factory _$YearImpl.fromJson(Map<String, dynamic> json) =>
      _$$YearImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AnalyticsPeriod.year()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$YearImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() week,
    required TResult Function() month,
    required TResult Function() year,
    required TResult Function(DateTime start, DateTime end) custom,
  }) {
    return year();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? week,
    TResult? Function()? month,
    TResult? Function()? year,
    TResult? Function(DateTime start, DateTime end)? custom,
  }) {
    return year?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? week,
    TResult Function()? month,
    TResult Function()? year,
    TResult Function(DateTime start, DateTime end)? custom,
    required TResult orElse(),
  }) {
    if (year != null) {
      return year();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Week value) week,
    required TResult Function(Month value) month,
    required TResult Function(Year value) year,
    required TResult Function(Custom value) custom,
  }) {
    return year(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Week value)? week,
    TResult? Function(Month value)? month,
    TResult? Function(Year value)? year,
    TResult? Function(Custom value)? custom,
  }) {
    return year?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Week value)? week,
    TResult Function(Month value)? month,
    TResult Function(Year value)? year,
    TResult Function(Custom value)? custom,
    required TResult orElse(),
  }) {
    if (year != null) {
      return year(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$YearImplToJson(
      this,
    );
  }
}

abstract class Year extends AnalyticsPeriod {
  const factory Year() = _$YearImpl;
  const Year._() : super._();

  factory Year.fromJson(Map<String, dynamic> json) = _$YearImpl.fromJson;
}

/// @nodoc
abstract class _$$CustomImplCopyWith<$Res> {
  factory _$$CustomImplCopyWith(
          _$CustomImpl value, $Res Function(_$CustomImpl) then) =
      __$$CustomImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime start, DateTime end});
}

/// @nodoc
class __$$CustomImplCopyWithImpl<$Res>
    extends _$AnalyticsPeriodCopyWithImpl<$Res, _$CustomImpl>
    implements _$$CustomImplCopyWith<$Res> {
  __$$CustomImplCopyWithImpl(
      _$CustomImpl _value, $Res Function(_$CustomImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsPeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? end = null,
  }) {
    return _then(_$CustomImpl(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomImpl extends Custom {
  const _$CustomImpl(
      {required this.start, required this.end, final String? $type})
      : $type = $type ?? 'custom',
        super._();

  factory _$CustomImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomImplFromJson(json);

  @override
  final DateTime start;
  @override
  final DateTime end;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'AnalyticsPeriod.custom(start: $start, end: $end)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomImpl &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  /// Create a copy of AnalyticsPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomImplCopyWith<_$CustomImpl> get copyWith =>
      __$$CustomImplCopyWithImpl<_$CustomImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() week,
    required TResult Function() month,
    required TResult Function() year,
    required TResult Function(DateTime start, DateTime end) custom,
  }) {
    return custom(start, end);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? week,
    TResult? Function()? month,
    TResult? Function()? year,
    TResult? Function(DateTime start, DateTime end)? custom,
  }) {
    return custom?.call(start, end);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? week,
    TResult Function()? month,
    TResult Function()? year,
    TResult Function(DateTime start, DateTime end)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(start, end);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Week value) week,
    required TResult Function(Month value) month,
    required TResult Function(Year value) year,
    required TResult Function(Custom value) custom,
  }) {
    return custom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Week value)? week,
    TResult? Function(Month value)? month,
    TResult? Function(Year value)? year,
    TResult? Function(Custom value)? custom,
  }) {
    return custom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Week value)? week,
    TResult Function(Month value)? month,
    TResult Function(Year value)? year,
    TResult Function(Custom value)? custom,
    required TResult orElse(),
  }) {
    if (custom != null) {
      return custom(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomImplToJson(
      this,
    );
  }
}

abstract class Custom extends AnalyticsPeriod {
  const factory Custom(
      {required final DateTime start,
      required final DateTime end}) = _$CustomImpl;
  const Custom._() : super._();

  factory Custom.fromJson(Map<String, dynamic> json) = _$CustomImpl.fromJson;

  DateTime get start;
  DateTime get end;

  /// Create a copy of AnalyticsPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomImplCopyWith<_$CustomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsSummary _$AnalyticsSummaryFromJson(Map<String, dynamic> json) {
  return _AnalyticsSummary.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsSummary {
  /// Total items consumed
  int get totalConsumed => throw _privateConstructorUsedError;

  /// Items used before expiry
  int get usedBeforeExpiry => throw _privateConstructorUsedError;

  /// Items used after expiry (wasted)
  int get wasted => throw _privateConstructorUsedError;

  /// Items saved from expiring (used during warning period)
  int get savedFromExpiring => throw _privateConstructorUsedError;

  /// On-time usage rate (0.0 - 1.0)
  double get usedBeforeExpiryRate => throw _privateConstructorUsedError;

  /// Average days before expiry when used
  double get avgDaysBeforeExpiry => throw _privateConstructorUsedError;

  /// Total unique items tracked
  int get totalItemsTracked => throw _privateConstructorUsedError;

  /// Current inventory count
  int get currentInventoryCount => throw _privateConstructorUsedError;

  /// Items expiring soon
  int get expiringSoonCount => throw _privateConstructorUsedError;

  /// Expired items
  int get expiredCount => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsSummaryCopyWith<AnalyticsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsSummaryCopyWith<$Res> {
  factory $AnalyticsSummaryCopyWith(
          AnalyticsSummary value, $Res Function(AnalyticsSummary) then) =
      _$AnalyticsSummaryCopyWithImpl<$Res, AnalyticsSummary>;
  @useResult
  $Res call(
      {int totalConsumed,
      int usedBeforeExpiry,
      int wasted,
      int savedFromExpiring,
      double usedBeforeExpiryRate,
      double avgDaysBeforeExpiry,
      int totalItemsTracked,
      int currentInventoryCount,
      int expiringSoonCount,
      int expiredCount});
}

/// @nodoc
class _$AnalyticsSummaryCopyWithImpl<$Res, $Val extends AnalyticsSummary>
    implements $AnalyticsSummaryCopyWith<$Res> {
  _$AnalyticsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalConsumed = null,
    Object? usedBeforeExpiry = null,
    Object? wasted = null,
    Object? savedFromExpiring = null,
    Object? usedBeforeExpiryRate = null,
    Object? avgDaysBeforeExpiry = null,
    Object? totalItemsTracked = null,
    Object? currentInventoryCount = null,
    Object? expiringSoonCount = null,
    Object? expiredCount = null,
  }) {
    return _then(_value.copyWith(
      totalConsumed: null == totalConsumed
          ? _value.totalConsumed
          : totalConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      usedBeforeExpiry: null == usedBeforeExpiry
          ? _value.usedBeforeExpiry
          : usedBeforeExpiry // ignore: cast_nullable_to_non_nullable
              as int,
      wasted: null == wasted
          ? _value.wasted
          : wasted // ignore: cast_nullable_to_non_nullable
              as int,
      savedFromExpiring: null == savedFromExpiring
          ? _value.savedFromExpiring
          : savedFromExpiring // ignore: cast_nullable_to_non_nullable
              as int,
      usedBeforeExpiryRate: null == usedBeforeExpiryRate
          ? _value.usedBeforeExpiryRate
          : usedBeforeExpiryRate // ignore: cast_nullable_to_non_nullable
              as double,
      avgDaysBeforeExpiry: null == avgDaysBeforeExpiry
          ? _value.avgDaysBeforeExpiry
          : avgDaysBeforeExpiry // ignore: cast_nullable_to_non_nullable
              as double,
      totalItemsTracked: null == totalItemsTracked
          ? _value.totalItemsTracked
          : totalItemsTracked // ignore: cast_nullable_to_non_nullable
              as int,
      currentInventoryCount: null == currentInventoryCount
          ? _value.currentInventoryCount
          : currentInventoryCount // ignore: cast_nullable_to_non_nullable
              as int,
      expiringSoonCount: null == expiringSoonCount
          ? _value.expiringSoonCount
          : expiringSoonCount // ignore: cast_nullable_to_non_nullable
              as int,
      expiredCount: null == expiredCount
          ? _value.expiredCount
          : expiredCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsSummaryImplCopyWith<$Res>
    implements $AnalyticsSummaryCopyWith<$Res> {
  factory _$$AnalyticsSummaryImplCopyWith(_$AnalyticsSummaryImpl value,
          $Res Function(_$AnalyticsSummaryImpl) then) =
      __$$AnalyticsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalConsumed,
      int usedBeforeExpiry,
      int wasted,
      int savedFromExpiring,
      double usedBeforeExpiryRate,
      double avgDaysBeforeExpiry,
      int totalItemsTracked,
      int currentInventoryCount,
      int expiringSoonCount,
      int expiredCount});
}

/// @nodoc
class __$$AnalyticsSummaryImplCopyWithImpl<$Res>
    extends _$AnalyticsSummaryCopyWithImpl<$Res, _$AnalyticsSummaryImpl>
    implements _$$AnalyticsSummaryImplCopyWith<$Res> {
  __$$AnalyticsSummaryImplCopyWithImpl(_$AnalyticsSummaryImpl _value,
      $Res Function(_$AnalyticsSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalConsumed = null,
    Object? usedBeforeExpiry = null,
    Object? wasted = null,
    Object? savedFromExpiring = null,
    Object? usedBeforeExpiryRate = null,
    Object? avgDaysBeforeExpiry = null,
    Object? totalItemsTracked = null,
    Object? currentInventoryCount = null,
    Object? expiringSoonCount = null,
    Object? expiredCount = null,
  }) {
    return _then(_$AnalyticsSummaryImpl(
      totalConsumed: null == totalConsumed
          ? _value.totalConsumed
          : totalConsumed // ignore: cast_nullable_to_non_nullable
              as int,
      usedBeforeExpiry: null == usedBeforeExpiry
          ? _value.usedBeforeExpiry
          : usedBeforeExpiry // ignore: cast_nullable_to_non_nullable
              as int,
      wasted: null == wasted
          ? _value.wasted
          : wasted // ignore: cast_nullable_to_non_nullable
              as int,
      savedFromExpiring: null == savedFromExpiring
          ? _value.savedFromExpiring
          : savedFromExpiring // ignore: cast_nullable_to_non_nullable
              as int,
      usedBeforeExpiryRate: null == usedBeforeExpiryRate
          ? _value.usedBeforeExpiryRate
          : usedBeforeExpiryRate // ignore: cast_nullable_to_non_nullable
              as double,
      avgDaysBeforeExpiry: null == avgDaysBeforeExpiry
          ? _value.avgDaysBeforeExpiry
          : avgDaysBeforeExpiry // ignore: cast_nullable_to_non_nullable
              as double,
      totalItemsTracked: null == totalItemsTracked
          ? _value.totalItemsTracked
          : totalItemsTracked // ignore: cast_nullable_to_non_nullable
              as int,
      currentInventoryCount: null == currentInventoryCount
          ? _value.currentInventoryCount
          : currentInventoryCount // ignore: cast_nullable_to_non_nullable
              as int,
      expiringSoonCount: null == expiringSoonCount
          ? _value.expiringSoonCount
          : expiringSoonCount // ignore: cast_nullable_to_non_nullable
              as int,
      expiredCount: null == expiredCount
          ? _value.expiredCount
          : expiredCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsSummaryImpl extends _AnalyticsSummary {
  const _$AnalyticsSummaryImpl(
      {this.totalConsumed = 0,
      this.usedBeforeExpiry = 0,
      this.wasted = 0,
      this.savedFromExpiring = 0,
      this.usedBeforeExpiryRate = 0.0,
      this.avgDaysBeforeExpiry = 0.0,
      this.totalItemsTracked = 0,
      this.currentInventoryCount = 0,
      this.expiringSoonCount = 0,
      this.expiredCount = 0})
      : super._();

  factory _$AnalyticsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsSummaryImplFromJson(json);

  /// Total items consumed
  @override
  @JsonKey()
  final int totalConsumed;

  /// Items used before expiry
  @override
  @JsonKey()
  final int usedBeforeExpiry;

  /// Items used after expiry (wasted)
  @override
  @JsonKey()
  final int wasted;

  /// Items saved from expiring (used during warning period)
  @override
  @JsonKey()
  final int savedFromExpiring;

  /// On-time usage rate (0.0 - 1.0)
  @override
  @JsonKey()
  final double usedBeforeExpiryRate;

  /// Average days before expiry when used
  @override
  @JsonKey()
  final double avgDaysBeforeExpiry;

  /// Total unique items tracked
  @override
  @JsonKey()
  final int totalItemsTracked;

  /// Current inventory count
  @override
  @JsonKey()
  final int currentInventoryCount;

  /// Items expiring soon
  @override
  @JsonKey()
  final int expiringSoonCount;

  /// Expired items
  @override
  @JsonKey()
  final int expiredCount;

  @override
  String toString() {
    return 'AnalyticsSummary(totalConsumed: $totalConsumed, usedBeforeExpiry: $usedBeforeExpiry, wasted: $wasted, savedFromExpiring: $savedFromExpiring, usedBeforeExpiryRate: $usedBeforeExpiryRate, avgDaysBeforeExpiry: $avgDaysBeforeExpiry, totalItemsTracked: $totalItemsTracked, currentInventoryCount: $currentInventoryCount, expiringSoonCount: $expiringSoonCount, expiredCount: $expiredCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsSummaryImpl &&
            (identical(other.totalConsumed, totalConsumed) ||
                other.totalConsumed == totalConsumed) &&
            (identical(other.usedBeforeExpiry, usedBeforeExpiry) ||
                other.usedBeforeExpiry == usedBeforeExpiry) &&
            (identical(other.wasted, wasted) || other.wasted == wasted) &&
            (identical(other.savedFromExpiring, savedFromExpiring) ||
                other.savedFromExpiring == savedFromExpiring) &&
            (identical(other.usedBeforeExpiryRate, usedBeforeExpiryRate) ||
                other.usedBeforeExpiryRate == usedBeforeExpiryRate) &&
            (identical(other.avgDaysBeforeExpiry, avgDaysBeforeExpiry) ||
                other.avgDaysBeforeExpiry == avgDaysBeforeExpiry) &&
            (identical(other.totalItemsTracked, totalItemsTracked) ||
                other.totalItemsTracked == totalItemsTracked) &&
            (identical(other.currentInventoryCount, currentInventoryCount) ||
                other.currentInventoryCount == currentInventoryCount) &&
            (identical(other.expiringSoonCount, expiringSoonCount) ||
                other.expiringSoonCount == expiringSoonCount) &&
            (identical(other.expiredCount, expiredCount) ||
                other.expiredCount == expiredCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalConsumed,
      usedBeforeExpiry,
      wasted,
      savedFromExpiring,
      usedBeforeExpiryRate,
      avgDaysBeforeExpiry,
      totalItemsTracked,
      currentInventoryCount,
      expiringSoonCount,
      expiredCount);

  /// Create a copy of AnalyticsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsSummaryImplCopyWith<_$AnalyticsSummaryImpl> get copyWith =>
      __$$AnalyticsSummaryImplCopyWithImpl<_$AnalyticsSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsSummaryImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsSummary extends AnalyticsSummary {
  const factory _AnalyticsSummary(
      {final int totalConsumed,
      final int usedBeforeExpiry,
      final int wasted,
      final int savedFromExpiring,
      final double usedBeforeExpiryRate,
      final double avgDaysBeforeExpiry,
      final int totalItemsTracked,
      final int currentInventoryCount,
      final int expiringSoonCount,
      final int expiredCount}) = _$AnalyticsSummaryImpl;
  const _AnalyticsSummary._() : super._();

  factory _AnalyticsSummary.fromJson(Map<String, dynamic> json) =
      _$AnalyticsSummaryImpl.fromJson;

  /// Total items consumed
  @override
  int get totalConsumed;

  /// Items used before expiry
  @override
  int get usedBeforeExpiry;

  /// Items used after expiry (wasted)
  @override
  int get wasted;

  /// Items saved from expiring (used during warning period)
  @override
  int get savedFromExpiring;

  /// On-time usage rate (0.0 - 1.0)
  @override
  double get usedBeforeExpiryRate;

  /// Average days before expiry when used
  @override
  double get avgDaysBeforeExpiry;

  /// Total unique items tracked
  @override
  int get totalItemsTracked;

  /// Current inventory count
  @override
  int get currentInventoryCount;

  /// Items expiring soon
  @override
  int get expiringSoonCount;

  /// Expired items
  @override
  int get expiredCount;

  /// Create a copy of AnalyticsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsSummaryImplCopyWith<_$AnalyticsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryDataPoint _$CategoryDataPointFromJson(Map<String, dynamic> json) {
  return _CategoryDataPoint.fromJson(json);
}

/// @nodoc
mixin _$CategoryDataPoint {
  /// Category name
  String get category => throw _privateConstructorUsedError;

  /// Item count
  int get count => throw _privateConstructorUsedError;

  /// Percentage (0.0 - 1.0)
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this CategoryDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryDataPointCopyWith<CategoryDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryDataPointCopyWith<$Res> {
  factory $CategoryDataPointCopyWith(
          CategoryDataPoint value, $Res Function(CategoryDataPoint) then) =
      _$CategoryDataPointCopyWithImpl<$Res, CategoryDataPoint>;
  @useResult
  $Res call({String category, int count, double percentage});
}

/// @nodoc
class _$CategoryDataPointCopyWithImpl<$Res, $Val extends CategoryDataPoint>
    implements $CategoryDataPointCopyWith<$Res> {
  _$CategoryDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryDataPointImplCopyWith<$Res>
    implements $CategoryDataPointCopyWith<$Res> {
  factory _$$CategoryDataPointImplCopyWith(_$CategoryDataPointImpl value,
          $Res Function(_$CategoryDataPointImpl) then) =
      __$$CategoryDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String category, int count, double percentage});
}

/// @nodoc
class __$$CategoryDataPointImplCopyWithImpl<$Res>
    extends _$CategoryDataPointCopyWithImpl<$Res, _$CategoryDataPointImpl>
    implements _$$CategoryDataPointImplCopyWith<$Res> {
  __$$CategoryDataPointImplCopyWithImpl(_$CategoryDataPointImpl _value,
      $Res Function(_$CategoryDataPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_$CategoryDataPointImpl(
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryDataPointImpl extends _CategoryDataPoint {
  const _$CategoryDataPointImpl(
      {this.category = '', this.count = 0, this.percentage = 0.0})
      : super._();

  factory _$CategoryDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryDataPointImplFromJson(json);

  /// Category name
  @override
  @JsonKey()
  final String category;

  /// Item count
  @override
  @JsonKey()
  final int count;

  /// Percentage (0.0 - 1.0)
  @override
  @JsonKey()
  final double percentage;

  @override
  String toString() {
    return 'CategoryDataPoint(category: $category, count: $count, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryDataPointImpl &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, category, count, percentage);

  /// Create a copy of CategoryDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryDataPointImplCopyWith<_$CategoryDataPointImpl> get copyWith =>
      __$$CategoryDataPointImplCopyWithImpl<_$CategoryDataPointImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryDataPointImplToJson(
      this,
    );
  }
}

abstract class _CategoryDataPoint extends CategoryDataPoint {
  const factory _CategoryDataPoint(
      {final String category,
      final int count,
      final double percentage}) = _$CategoryDataPointImpl;
  const _CategoryDataPoint._() : super._();

  factory _CategoryDataPoint.fromJson(Map<String, dynamic> json) =
      _$CategoryDataPointImpl.fromJson;

  /// Category name
  @override
  String get category;

  /// Item count
  @override
  int get count;

  /// Percentage (0.0 - 1.0)
  @override
  double get percentage;

  /// Create a copy of CategoryDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryDataPointImplCopyWith<_$CategoryDataPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpiryStatusDataPoint _$ExpiryStatusDataPointFromJson(
    Map<String, dynamic> json) {
  return _ExpiryStatusDataPoint.fromJson(json);
}

/// @nodoc
mixin _$ExpiryStatusDataPoint {
  /// Status
  String get status => throw _privateConstructorUsedError;

  /// Item count
  int get count => throw _privateConstructorUsedError;

  /// Percentage (0.0 - 1.0)
  double get percentage => throw _privateConstructorUsedError;

  /// Serializes this ExpiryStatusDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpiryStatusDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpiryStatusDataPointCopyWith<ExpiryStatusDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpiryStatusDataPointCopyWith<$Res> {
  factory $ExpiryStatusDataPointCopyWith(ExpiryStatusDataPoint value,
          $Res Function(ExpiryStatusDataPoint) then) =
      _$ExpiryStatusDataPointCopyWithImpl<$Res, ExpiryStatusDataPoint>;
  @useResult
  $Res call({String status, int count, double percentage});
}

/// @nodoc
class _$ExpiryStatusDataPointCopyWithImpl<$Res,
        $Val extends ExpiryStatusDataPoint>
    implements $ExpiryStatusDataPointCopyWith<$Res> {
  _$ExpiryStatusDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpiryStatusDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpiryStatusDataPointImplCopyWith<$Res>
    implements $ExpiryStatusDataPointCopyWith<$Res> {
  factory _$$ExpiryStatusDataPointImplCopyWith(
          _$ExpiryStatusDataPointImpl value,
          $Res Function(_$ExpiryStatusDataPointImpl) then) =
      __$$ExpiryStatusDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String status, int count, double percentage});
}

/// @nodoc
class __$$ExpiryStatusDataPointImplCopyWithImpl<$Res>
    extends _$ExpiryStatusDataPointCopyWithImpl<$Res,
        _$ExpiryStatusDataPointImpl>
    implements _$$ExpiryStatusDataPointImplCopyWith<$Res> {
  __$$ExpiryStatusDataPointImplCopyWithImpl(_$ExpiryStatusDataPointImpl _value,
      $Res Function(_$ExpiryStatusDataPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpiryStatusDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? count = null,
    Object? percentage = null,
  }) {
    return _then(_$ExpiryStatusDataPointImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      percentage: null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpiryStatusDataPointImpl extends _ExpiryStatusDataPoint {
  const _$ExpiryStatusDataPointImpl(
      {required this.status, this.count = 0, this.percentage = 0.0})
      : super._();

  factory _$ExpiryStatusDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiryStatusDataPointImplFromJson(json);

  /// Status
  @override
  final String status;

  /// Item count
  @override
  @JsonKey()
  final int count;

  /// Percentage (0.0 - 1.0)
  @override
  @JsonKey()
  final double percentage;

  @override
  String toString() {
    return 'ExpiryStatusDataPoint(status: $status, count: $count, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpiryStatusDataPointImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, count, percentage);

  /// Create a copy of ExpiryStatusDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpiryStatusDataPointImplCopyWith<_$ExpiryStatusDataPointImpl>
      get copyWith => __$$ExpiryStatusDataPointImplCopyWithImpl<
          _$ExpiryStatusDataPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiryStatusDataPointImplToJson(
      this,
    );
  }
}

abstract class _ExpiryStatusDataPoint extends ExpiryStatusDataPoint {
  const factory _ExpiryStatusDataPoint(
      {required final String status,
      final int count,
      final double percentage}) = _$ExpiryStatusDataPointImpl;
  const _ExpiryStatusDataPoint._() : super._();

  factory _ExpiryStatusDataPoint.fromJson(Map<String, dynamic> json) =
      _$ExpiryStatusDataPointImpl.fromJson;

  /// Status
  @override
  String get status;

  /// Item count
  @override
  int get count;

  /// Percentage (0.0 - 1.0)
  @override
  double get percentage;

  /// Create a copy of ExpiryStatusDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpiryStatusDataPointImplCopyWith<_$ExpiryStatusDataPointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MonthlyTrendDataPoint _$MonthlyTrendDataPointFromJson(
    Map<String, dynamic> json) {
  return _MonthlyTrendDataPoint.fromJson(json);
}

/// @nodoc
mixin _$MonthlyTrendDataPoint {
  /// Month (YYYY-MM format)
  String get month => throw _privateConstructorUsedError;

  /// Items added
  int get added => throw _privateConstructorUsedError;

  /// Items consumed
  int get consumed => throw _privateConstructorUsedError;

  /// Items wasted
  int get wasted => throw _privateConstructorUsedError;

  /// Items saved
  int get saved => throw _privateConstructorUsedError;

  /// Serializes this MonthlyTrendDataPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlyTrendDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlyTrendDataPointCopyWith<MonthlyTrendDataPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyTrendDataPointCopyWith<$Res> {
  factory $MonthlyTrendDataPointCopyWith(MonthlyTrendDataPoint value,
          $Res Function(MonthlyTrendDataPoint) then) =
      _$MonthlyTrendDataPointCopyWithImpl<$Res, MonthlyTrendDataPoint>;
  @useResult
  $Res call({String month, int added, int consumed, int wasted, int saved});
}

/// @nodoc
class _$MonthlyTrendDataPointCopyWithImpl<$Res,
        $Val extends MonthlyTrendDataPoint>
    implements $MonthlyTrendDataPointCopyWith<$Res> {
  _$MonthlyTrendDataPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlyTrendDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? added = null,
    Object? consumed = null,
    Object? wasted = null,
    Object? saved = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      added: null == added
          ? _value.added
          : added // ignore: cast_nullable_to_non_nullable
              as int,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as int,
      wasted: null == wasted
          ? _value.wasted
          : wasted // ignore: cast_nullable_to_non_nullable
              as int,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlyTrendDataPointImplCopyWith<$Res>
    implements $MonthlyTrendDataPointCopyWith<$Res> {
  factory _$$MonthlyTrendDataPointImplCopyWith(
          _$MonthlyTrendDataPointImpl value,
          $Res Function(_$MonthlyTrendDataPointImpl) then) =
      __$$MonthlyTrendDataPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String month, int added, int consumed, int wasted, int saved});
}

/// @nodoc
class __$$MonthlyTrendDataPointImplCopyWithImpl<$Res>
    extends _$MonthlyTrendDataPointCopyWithImpl<$Res,
        _$MonthlyTrendDataPointImpl>
    implements _$$MonthlyTrendDataPointImplCopyWith<$Res> {
  __$$MonthlyTrendDataPointImplCopyWithImpl(_$MonthlyTrendDataPointImpl _value,
      $Res Function(_$MonthlyTrendDataPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlyTrendDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? added = null,
    Object? consumed = null,
    Object? wasted = null,
    Object? saved = null,
  }) {
    return _then(_$MonthlyTrendDataPointImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      added: null == added
          ? _value.added
          : added // ignore: cast_nullable_to_non_nullable
              as int,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as int,
      wasted: null == wasted
          ? _value.wasted
          : wasted // ignore: cast_nullable_to_non_nullable
              as int,
      saved: null == saved
          ? _value.saved
          : saved // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlyTrendDataPointImpl extends _MonthlyTrendDataPoint {
  const _$MonthlyTrendDataPointImpl(
      {this.month = '',
      this.added = 0,
      this.consumed = 0,
      this.wasted = 0,
      this.saved = 0})
      : super._();

  factory _$MonthlyTrendDataPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyTrendDataPointImplFromJson(json);

  /// Month (YYYY-MM format)
  @override
  @JsonKey()
  final String month;

  /// Items added
  @override
  @JsonKey()
  final int added;

  /// Items consumed
  @override
  @JsonKey()
  final int consumed;

  /// Items wasted
  @override
  @JsonKey()
  final int wasted;

  /// Items saved
  @override
  @JsonKey()
  final int saved;

  @override
  String toString() {
    return 'MonthlyTrendDataPoint(month: $month, added: $added, consumed: $consumed, wasted: $wasted, saved: $saved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyTrendDataPointImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.added, added) || other.added == added) &&
            (identical(other.consumed, consumed) ||
                other.consumed == consumed) &&
            (identical(other.wasted, wasted) || other.wasted == wasted) &&
            (identical(other.saved, saved) || other.saved == saved));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, month, added, consumed, wasted, saved);

  /// Create a copy of MonthlyTrendDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyTrendDataPointImplCopyWith<_$MonthlyTrendDataPointImpl>
      get copyWith => __$$MonthlyTrendDataPointImplCopyWithImpl<
          _$MonthlyTrendDataPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyTrendDataPointImplToJson(
      this,
    );
  }
}

abstract class _MonthlyTrendDataPoint extends MonthlyTrendDataPoint {
  const factory _MonthlyTrendDataPoint(
      {final String month,
      final int added,
      final int consumed,
      final int wasted,
      final int saved}) = _$MonthlyTrendDataPointImpl;
  const _MonthlyTrendDataPoint._() : super._();

  factory _MonthlyTrendDataPoint.fromJson(Map<String, dynamic> json) =
      _$MonthlyTrendDataPointImpl.fromJson;

  /// Month (YYYY-MM format)
  @override
  String get month;

  /// Items added
  @override
  int get added;

  /// Items consumed
  @override
  int get consumed;

  /// Items wasted
  @override
  int get wasted;

  /// Items saved
  @override
  int get saved;

  /// Create a copy of MonthlyTrendDataPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlyTrendDataPointImplCopyWith<_$MonthlyTrendDataPointImpl>
      get copyWith => throw _privateConstructorUsedError;
}

InsightType _$InsightTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'wasteReduction':
      return WasteReduction.fromJson(json);
    case 'expiryPatterns':
      return ExpiryPatterns.fromJson(json);
    case 'categoryBalance':
      return CategoryBalance.fromJson(json);
    case 'usageTrends':
      return UsageTrends.fromJson(json);
    case 'shoppingOptimization':
      return ShoppingOptimization.fromJson(json);
    case 'celebration':
      return Celebration.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'InsightType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$InsightType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wasteReduction,
    required TResult Function() expiryPatterns,
    required TResult Function() categoryBalance,
    required TResult Function() usageTrends,
    required TResult Function() shoppingOptimization,
    required TResult Function() celebration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wasteReduction,
    TResult? Function()? expiryPatterns,
    TResult? Function()? categoryBalance,
    TResult? Function()? usageTrends,
    TResult? Function()? shoppingOptimization,
    TResult? Function()? celebration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wasteReduction,
    TResult Function()? expiryPatterns,
    TResult Function()? categoryBalance,
    TResult Function()? usageTrends,
    TResult Function()? shoppingOptimization,
    TResult Function()? celebration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WasteReduction value) wasteReduction,
    required TResult Function(ExpiryPatterns value) expiryPatterns,
    required TResult Function(CategoryBalance value) categoryBalance,
    required TResult Function(UsageTrends value) usageTrends,
    required TResult Function(ShoppingOptimization value) shoppingOptimization,
    required TResult Function(Celebration value) celebration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WasteReduction value)? wasteReduction,
    TResult? Function(ExpiryPatterns value)? expiryPatterns,
    TResult? Function(CategoryBalance value)? categoryBalance,
    TResult? Function(UsageTrends value)? usageTrends,
    TResult? Function(ShoppingOptimization value)? shoppingOptimization,
    TResult? Function(Celebration value)? celebration,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WasteReduction value)? wasteReduction,
    TResult Function(ExpiryPatterns value)? expiryPatterns,
    TResult Function(CategoryBalance value)? categoryBalance,
    TResult Function(UsageTrends value)? usageTrends,
    TResult Function(ShoppingOptimization value)? shoppingOptimization,
    TResult Function(Celebration value)? celebration,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this InsightType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightTypeCopyWith<$Res> {
  factory $InsightTypeCopyWith(
          InsightType value, $Res Function(InsightType) then) =
      _$InsightTypeCopyWithImpl<$Res, InsightType>;
}

/// @nodoc
class _$InsightTypeCopyWithImpl<$Res, $Val extends InsightType>
    implements $InsightTypeCopyWith<$Res> {
  _$InsightTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InsightType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WasteReductionImplCopyWith<$Res> {
  factory _$$WasteReductionImplCopyWith(_$WasteReductionImpl value,
          $Res Function(_$WasteReductionImpl) then) =
      __$$WasteReductionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WasteReductionImplCopyWithImpl<$Res>
    extends _$InsightTypeCopyWithImpl<$Res, _$WasteReductionImpl>
    implements _$$WasteReductionImplCopyWith<$Res> {
  __$$WasteReductionImplCopyWithImpl(
      _$WasteReductionImpl _value, $Res Function(_$WasteReductionImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$WasteReductionImpl extends WasteReduction {
  const _$WasteReductionImpl({final String? $type})
      : $type = $type ?? 'wasteReduction',
        super._();

  factory _$WasteReductionImpl.fromJson(Map<String, dynamic> json) =>
      _$$WasteReductionImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightType.wasteReduction()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WasteReductionImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wasteReduction,
    required TResult Function() expiryPatterns,
    required TResult Function() categoryBalance,
    required TResult Function() usageTrends,
    required TResult Function() shoppingOptimization,
    required TResult Function() celebration,
  }) {
    return wasteReduction();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wasteReduction,
    TResult? Function()? expiryPatterns,
    TResult? Function()? categoryBalance,
    TResult? Function()? usageTrends,
    TResult? Function()? shoppingOptimization,
    TResult? Function()? celebration,
  }) {
    return wasteReduction?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wasteReduction,
    TResult Function()? expiryPatterns,
    TResult Function()? categoryBalance,
    TResult Function()? usageTrends,
    TResult Function()? shoppingOptimization,
    TResult Function()? celebration,
    required TResult orElse(),
  }) {
    if (wasteReduction != null) {
      return wasteReduction();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WasteReduction value) wasteReduction,
    required TResult Function(ExpiryPatterns value) expiryPatterns,
    required TResult Function(CategoryBalance value) categoryBalance,
    required TResult Function(UsageTrends value) usageTrends,
    required TResult Function(ShoppingOptimization value) shoppingOptimization,
    required TResult Function(Celebration value) celebration,
  }) {
    return wasteReduction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WasteReduction value)? wasteReduction,
    TResult? Function(ExpiryPatterns value)? expiryPatterns,
    TResult? Function(CategoryBalance value)? categoryBalance,
    TResult? Function(UsageTrends value)? usageTrends,
    TResult? Function(ShoppingOptimization value)? shoppingOptimization,
    TResult? Function(Celebration value)? celebration,
  }) {
    return wasteReduction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WasteReduction value)? wasteReduction,
    TResult Function(ExpiryPatterns value)? expiryPatterns,
    TResult Function(CategoryBalance value)? categoryBalance,
    TResult Function(UsageTrends value)? usageTrends,
    TResult Function(ShoppingOptimization value)? shoppingOptimization,
    TResult Function(Celebration value)? celebration,
    required TResult orElse(),
  }) {
    if (wasteReduction != null) {
      return wasteReduction(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WasteReductionImplToJson(
      this,
    );
  }
}

abstract class WasteReduction extends InsightType {
  const factory WasteReduction() = _$WasteReductionImpl;
  const WasteReduction._() : super._();

  factory WasteReduction.fromJson(Map<String, dynamic> json) =
      _$WasteReductionImpl.fromJson;
}

/// @nodoc
abstract class _$$ExpiryPatternsImplCopyWith<$Res> {
  factory _$$ExpiryPatternsImplCopyWith(_$ExpiryPatternsImpl value,
          $Res Function(_$ExpiryPatternsImpl) then) =
      __$$ExpiryPatternsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ExpiryPatternsImplCopyWithImpl<$Res>
    extends _$InsightTypeCopyWithImpl<$Res, _$ExpiryPatternsImpl>
    implements _$$ExpiryPatternsImplCopyWith<$Res> {
  __$$ExpiryPatternsImplCopyWithImpl(
      _$ExpiryPatternsImpl _value, $Res Function(_$ExpiryPatternsImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ExpiryPatternsImpl extends ExpiryPatterns {
  const _$ExpiryPatternsImpl({final String? $type})
      : $type = $type ?? 'expiryPatterns',
        super._();

  factory _$ExpiryPatternsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiryPatternsImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightType.expiryPatterns()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ExpiryPatternsImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wasteReduction,
    required TResult Function() expiryPatterns,
    required TResult Function() categoryBalance,
    required TResult Function() usageTrends,
    required TResult Function() shoppingOptimization,
    required TResult Function() celebration,
  }) {
    return expiryPatterns();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wasteReduction,
    TResult? Function()? expiryPatterns,
    TResult? Function()? categoryBalance,
    TResult? Function()? usageTrends,
    TResult? Function()? shoppingOptimization,
    TResult? Function()? celebration,
  }) {
    return expiryPatterns?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wasteReduction,
    TResult Function()? expiryPatterns,
    TResult Function()? categoryBalance,
    TResult Function()? usageTrends,
    TResult Function()? shoppingOptimization,
    TResult Function()? celebration,
    required TResult orElse(),
  }) {
    if (expiryPatterns != null) {
      return expiryPatterns();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WasteReduction value) wasteReduction,
    required TResult Function(ExpiryPatterns value) expiryPatterns,
    required TResult Function(CategoryBalance value) categoryBalance,
    required TResult Function(UsageTrends value) usageTrends,
    required TResult Function(ShoppingOptimization value) shoppingOptimization,
    required TResult Function(Celebration value) celebration,
  }) {
    return expiryPatterns(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WasteReduction value)? wasteReduction,
    TResult? Function(ExpiryPatterns value)? expiryPatterns,
    TResult? Function(CategoryBalance value)? categoryBalance,
    TResult? Function(UsageTrends value)? usageTrends,
    TResult? Function(ShoppingOptimization value)? shoppingOptimization,
    TResult? Function(Celebration value)? celebration,
  }) {
    return expiryPatterns?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WasteReduction value)? wasteReduction,
    TResult Function(ExpiryPatterns value)? expiryPatterns,
    TResult Function(CategoryBalance value)? categoryBalance,
    TResult Function(UsageTrends value)? usageTrends,
    TResult Function(ShoppingOptimization value)? shoppingOptimization,
    TResult Function(Celebration value)? celebration,
    required TResult orElse(),
  }) {
    if (expiryPatterns != null) {
      return expiryPatterns(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiryPatternsImplToJson(
      this,
    );
  }
}

abstract class ExpiryPatterns extends InsightType {
  const factory ExpiryPatterns() = _$ExpiryPatternsImpl;
  const ExpiryPatterns._() : super._();

  factory ExpiryPatterns.fromJson(Map<String, dynamic> json) =
      _$ExpiryPatternsImpl.fromJson;
}

/// @nodoc
abstract class _$$CategoryBalanceImplCopyWith<$Res> {
  factory _$$CategoryBalanceImplCopyWith(_$CategoryBalanceImpl value,
          $Res Function(_$CategoryBalanceImpl) then) =
      __$$CategoryBalanceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryBalanceImplCopyWithImpl<$Res>
    extends _$InsightTypeCopyWithImpl<$Res, _$CategoryBalanceImpl>
    implements _$$CategoryBalanceImplCopyWith<$Res> {
  __$$CategoryBalanceImplCopyWithImpl(
      _$CategoryBalanceImpl _value, $Res Function(_$CategoryBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CategoryBalanceImpl extends CategoryBalance {
  const _$CategoryBalanceImpl({final String? $type})
      : $type = $type ?? 'categoryBalance',
        super._();

  factory _$CategoryBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryBalanceImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightType.categoryBalance()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryBalanceImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wasteReduction,
    required TResult Function() expiryPatterns,
    required TResult Function() categoryBalance,
    required TResult Function() usageTrends,
    required TResult Function() shoppingOptimization,
    required TResult Function() celebration,
  }) {
    return categoryBalance();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wasteReduction,
    TResult? Function()? expiryPatterns,
    TResult? Function()? categoryBalance,
    TResult? Function()? usageTrends,
    TResult? Function()? shoppingOptimization,
    TResult? Function()? celebration,
  }) {
    return categoryBalance?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wasteReduction,
    TResult Function()? expiryPatterns,
    TResult Function()? categoryBalance,
    TResult Function()? usageTrends,
    TResult Function()? shoppingOptimization,
    TResult Function()? celebration,
    required TResult orElse(),
  }) {
    if (categoryBalance != null) {
      return categoryBalance();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WasteReduction value) wasteReduction,
    required TResult Function(ExpiryPatterns value) expiryPatterns,
    required TResult Function(CategoryBalance value) categoryBalance,
    required TResult Function(UsageTrends value) usageTrends,
    required TResult Function(ShoppingOptimization value) shoppingOptimization,
    required TResult Function(Celebration value) celebration,
  }) {
    return categoryBalance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WasteReduction value)? wasteReduction,
    TResult? Function(ExpiryPatterns value)? expiryPatterns,
    TResult? Function(CategoryBalance value)? categoryBalance,
    TResult? Function(UsageTrends value)? usageTrends,
    TResult? Function(ShoppingOptimization value)? shoppingOptimization,
    TResult? Function(Celebration value)? celebration,
  }) {
    return categoryBalance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WasteReduction value)? wasteReduction,
    TResult Function(ExpiryPatterns value)? expiryPatterns,
    TResult Function(CategoryBalance value)? categoryBalance,
    TResult Function(UsageTrends value)? usageTrends,
    TResult Function(ShoppingOptimization value)? shoppingOptimization,
    TResult Function(Celebration value)? celebration,
    required TResult orElse(),
  }) {
    if (categoryBalance != null) {
      return categoryBalance(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryBalanceImplToJson(
      this,
    );
  }
}

abstract class CategoryBalance extends InsightType {
  const factory CategoryBalance() = _$CategoryBalanceImpl;
  const CategoryBalance._() : super._();

  factory CategoryBalance.fromJson(Map<String, dynamic> json) =
      _$CategoryBalanceImpl.fromJson;
}

/// @nodoc
abstract class _$$UsageTrendsImplCopyWith<$Res> {
  factory _$$UsageTrendsImplCopyWith(
          _$UsageTrendsImpl value, $Res Function(_$UsageTrendsImpl) then) =
      __$$UsageTrendsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UsageTrendsImplCopyWithImpl<$Res>
    extends _$InsightTypeCopyWithImpl<$Res, _$UsageTrendsImpl>
    implements _$$UsageTrendsImplCopyWith<$Res> {
  __$$UsageTrendsImplCopyWithImpl(
      _$UsageTrendsImpl _value, $Res Function(_$UsageTrendsImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$UsageTrendsImpl extends UsageTrends {
  const _$UsageTrendsImpl({final String? $type})
      : $type = $type ?? 'usageTrends',
        super._();

  factory _$UsageTrendsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UsageTrendsImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightType.usageTrends()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UsageTrendsImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wasteReduction,
    required TResult Function() expiryPatterns,
    required TResult Function() categoryBalance,
    required TResult Function() usageTrends,
    required TResult Function() shoppingOptimization,
    required TResult Function() celebration,
  }) {
    return usageTrends();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wasteReduction,
    TResult? Function()? expiryPatterns,
    TResult? Function()? categoryBalance,
    TResult? Function()? usageTrends,
    TResult? Function()? shoppingOptimization,
    TResult? Function()? celebration,
  }) {
    return usageTrends?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wasteReduction,
    TResult Function()? expiryPatterns,
    TResult Function()? categoryBalance,
    TResult Function()? usageTrends,
    TResult Function()? shoppingOptimization,
    TResult Function()? celebration,
    required TResult orElse(),
  }) {
    if (usageTrends != null) {
      return usageTrends();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WasteReduction value) wasteReduction,
    required TResult Function(ExpiryPatterns value) expiryPatterns,
    required TResult Function(CategoryBalance value) categoryBalance,
    required TResult Function(UsageTrends value) usageTrends,
    required TResult Function(ShoppingOptimization value) shoppingOptimization,
    required TResult Function(Celebration value) celebration,
  }) {
    return usageTrends(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WasteReduction value)? wasteReduction,
    TResult? Function(ExpiryPatterns value)? expiryPatterns,
    TResult? Function(CategoryBalance value)? categoryBalance,
    TResult? Function(UsageTrends value)? usageTrends,
    TResult? Function(ShoppingOptimization value)? shoppingOptimization,
    TResult? Function(Celebration value)? celebration,
  }) {
    return usageTrends?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WasteReduction value)? wasteReduction,
    TResult Function(ExpiryPatterns value)? expiryPatterns,
    TResult Function(CategoryBalance value)? categoryBalance,
    TResult Function(UsageTrends value)? usageTrends,
    TResult Function(ShoppingOptimization value)? shoppingOptimization,
    TResult Function(Celebration value)? celebration,
    required TResult orElse(),
  }) {
    if (usageTrends != null) {
      return usageTrends(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UsageTrendsImplToJson(
      this,
    );
  }
}

abstract class UsageTrends extends InsightType {
  const factory UsageTrends() = _$UsageTrendsImpl;
  const UsageTrends._() : super._();

  factory UsageTrends.fromJson(Map<String, dynamic> json) =
      _$UsageTrendsImpl.fromJson;
}

/// @nodoc
abstract class _$$ShoppingOptimizationImplCopyWith<$Res> {
  factory _$$ShoppingOptimizationImplCopyWith(_$ShoppingOptimizationImpl value,
          $Res Function(_$ShoppingOptimizationImpl) then) =
      __$$ShoppingOptimizationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShoppingOptimizationImplCopyWithImpl<$Res>
    extends _$InsightTypeCopyWithImpl<$Res, _$ShoppingOptimizationImpl>
    implements _$$ShoppingOptimizationImplCopyWith<$Res> {
  __$$ShoppingOptimizationImplCopyWithImpl(_$ShoppingOptimizationImpl _value,
      $Res Function(_$ShoppingOptimizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ShoppingOptimizationImpl extends ShoppingOptimization {
  const _$ShoppingOptimizationImpl({final String? $type})
      : $type = $type ?? 'shoppingOptimization',
        super._();

  factory _$ShoppingOptimizationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ShoppingOptimizationImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightType.shoppingOptimization()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShoppingOptimizationImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wasteReduction,
    required TResult Function() expiryPatterns,
    required TResult Function() categoryBalance,
    required TResult Function() usageTrends,
    required TResult Function() shoppingOptimization,
    required TResult Function() celebration,
  }) {
    return shoppingOptimization();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wasteReduction,
    TResult? Function()? expiryPatterns,
    TResult? Function()? categoryBalance,
    TResult? Function()? usageTrends,
    TResult? Function()? shoppingOptimization,
    TResult? Function()? celebration,
  }) {
    return shoppingOptimization?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wasteReduction,
    TResult Function()? expiryPatterns,
    TResult Function()? categoryBalance,
    TResult Function()? usageTrends,
    TResult Function()? shoppingOptimization,
    TResult Function()? celebration,
    required TResult orElse(),
  }) {
    if (shoppingOptimization != null) {
      return shoppingOptimization();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WasteReduction value) wasteReduction,
    required TResult Function(ExpiryPatterns value) expiryPatterns,
    required TResult Function(CategoryBalance value) categoryBalance,
    required TResult Function(UsageTrends value) usageTrends,
    required TResult Function(ShoppingOptimization value) shoppingOptimization,
    required TResult Function(Celebration value) celebration,
  }) {
    return shoppingOptimization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WasteReduction value)? wasteReduction,
    TResult? Function(ExpiryPatterns value)? expiryPatterns,
    TResult? Function(CategoryBalance value)? categoryBalance,
    TResult? Function(UsageTrends value)? usageTrends,
    TResult? Function(ShoppingOptimization value)? shoppingOptimization,
    TResult? Function(Celebration value)? celebration,
  }) {
    return shoppingOptimization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WasteReduction value)? wasteReduction,
    TResult Function(ExpiryPatterns value)? expiryPatterns,
    TResult Function(CategoryBalance value)? categoryBalance,
    TResult Function(UsageTrends value)? usageTrends,
    TResult Function(ShoppingOptimization value)? shoppingOptimization,
    TResult Function(Celebration value)? celebration,
    required TResult orElse(),
  }) {
    if (shoppingOptimization != null) {
      return shoppingOptimization(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ShoppingOptimizationImplToJson(
      this,
    );
  }
}

abstract class ShoppingOptimization extends InsightType {
  const factory ShoppingOptimization() = _$ShoppingOptimizationImpl;
  const ShoppingOptimization._() : super._();

  factory ShoppingOptimization.fromJson(Map<String, dynamic> json) =
      _$ShoppingOptimizationImpl.fromJson;
}

/// @nodoc
abstract class _$$CelebrationImplCopyWith<$Res> {
  factory _$$CelebrationImplCopyWith(
          _$CelebrationImpl value, $Res Function(_$CelebrationImpl) then) =
      __$$CelebrationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CelebrationImplCopyWithImpl<$Res>
    extends _$InsightTypeCopyWithImpl<$Res, _$CelebrationImpl>
    implements _$$CelebrationImplCopyWith<$Res> {
  __$$CelebrationImplCopyWithImpl(
      _$CelebrationImpl _value, $Res Function(_$CelebrationImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CelebrationImpl extends Celebration {
  const _$CelebrationImpl({final String? $type})
      : $type = $type ?? 'celebration',
        super._();

  factory _$CelebrationImpl.fromJson(Map<String, dynamic> json) =>
      _$$CelebrationImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightType.celebration()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CelebrationImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wasteReduction,
    required TResult Function() expiryPatterns,
    required TResult Function() categoryBalance,
    required TResult Function() usageTrends,
    required TResult Function() shoppingOptimization,
    required TResult Function() celebration,
  }) {
    return celebration();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? wasteReduction,
    TResult? Function()? expiryPatterns,
    TResult? Function()? categoryBalance,
    TResult? Function()? usageTrends,
    TResult? Function()? shoppingOptimization,
    TResult? Function()? celebration,
  }) {
    return celebration?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wasteReduction,
    TResult Function()? expiryPatterns,
    TResult Function()? categoryBalance,
    TResult Function()? usageTrends,
    TResult Function()? shoppingOptimization,
    TResult Function()? celebration,
    required TResult orElse(),
  }) {
    if (celebration != null) {
      return celebration();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WasteReduction value) wasteReduction,
    required TResult Function(ExpiryPatterns value) expiryPatterns,
    required TResult Function(CategoryBalance value) categoryBalance,
    required TResult Function(UsageTrends value) usageTrends,
    required TResult Function(ShoppingOptimization value) shoppingOptimization,
    required TResult Function(Celebration value) celebration,
  }) {
    return celebration(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WasteReduction value)? wasteReduction,
    TResult? Function(ExpiryPatterns value)? expiryPatterns,
    TResult? Function(CategoryBalance value)? categoryBalance,
    TResult? Function(UsageTrends value)? usageTrends,
    TResult? Function(ShoppingOptimization value)? shoppingOptimization,
    TResult? Function(Celebration value)? celebration,
  }) {
    return celebration?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WasteReduction value)? wasteReduction,
    TResult Function(ExpiryPatterns value)? expiryPatterns,
    TResult Function(CategoryBalance value)? categoryBalance,
    TResult Function(UsageTrends value)? usageTrends,
    TResult Function(ShoppingOptimization value)? shoppingOptimization,
    TResult Function(Celebration value)? celebration,
    required TResult orElse(),
  }) {
    if (celebration != null) {
      return celebration(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CelebrationImplToJson(
      this,
    );
  }
}

abstract class Celebration extends InsightType {
  const factory Celebration() = _$CelebrationImpl;
  const Celebration._() : super._();

  factory Celebration.fromJson(Map<String, dynamic> json) =
      _$CelebrationImpl.fromJson;
}

InsightSeverity _$InsightSeverityFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'info':
      return Info.fromJson(json);
    case 'warning':
      return Warning.fromJson(json);
    case 'success':
      return Success.fromJson(json);
    case 'critical':
      return Critical.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'InsightSeverity',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$InsightSeverity {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() info,
    required TResult Function() warning,
    required TResult Function() success,
    required TResult Function() critical,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? info,
    TResult? Function()? warning,
    TResult? Function()? success,
    TResult? Function()? critical,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? info,
    TResult Function()? warning,
    TResult Function()? success,
    TResult Function()? critical,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Info value) info,
    required TResult Function(Warning value) warning,
    required TResult Function(Success value) success,
    required TResult Function(Critical value) critical,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Info value)? info,
    TResult? Function(Warning value)? warning,
    TResult? Function(Success value)? success,
    TResult? Function(Critical value)? critical,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Info value)? info,
    TResult Function(Warning value)? warning,
    TResult Function(Success value)? success,
    TResult Function(Critical value)? critical,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this InsightSeverity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsightSeverityCopyWith<$Res> {
  factory $InsightSeverityCopyWith(
          InsightSeverity value, $Res Function(InsightSeverity) then) =
      _$InsightSeverityCopyWithImpl<$Res, InsightSeverity>;
}

/// @nodoc
class _$InsightSeverityCopyWithImpl<$Res, $Val extends InsightSeverity>
    implements $InsightSeverityCopyWith<$Res> {
  _$InsightSeverityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InsightSeverity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InfoImplCopyWith<$Res> {
  factory _$$InfoImplCopyWith(
          _$InfoImpl value, $Res Function(_$InfoImpl) then) =
      __$$InfoImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InfoImplCopyWithImpl<$Res>
    extends _$InsightSeverityCopyWithImpl<$Res, _$InfoImpl>
    implements _$$InfoImplCopyWith<$Res> {
  __$$InfoImplCopyWithImpl(_$InfoImpl _value, $Res Function(_$InfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightSeverity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$InfoImpl extends Info {
  const _$InfoImpl({final String? $type})
      : $type = $type ?? 'info',
        super._();

  factory _$InfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$InfoImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightSeverity.info()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InfoImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() info,
    required TResult Function() warning,
    required TResult Function() success,
    required TResult Function() critical,
  }) {
    return info();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? info,
    TResult? Function()? warning,
    TResult? Function()? success,
    TResult? Function()? critical,
  }) {
    return info?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? info,
    TResult Function()? warning,
    TResult Function()? success,
    TResult Function()? critical,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Info value) info,
    required TResult Function(Warning value) warning,
    required TResult Function(Success value) success,
    required TResult Function(Critical value) critical,
  }) {
    return info(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Info value)? info,
    TResult? Function(Warning value)? warning,
    TResult? Function(Success value)? success,
    TResult? Function(Critical value)? critical,
  }) {
    return info?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Info value)? info,
    TResult Function(Warning value)? warning,
    TResult Function(Success value)? success,
    TResult Function(Critical value)? critical,
    required TResult orElse(),
  }) {
    if (info != null) {
      return info(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$InfoImplToJson(
      this,
    );
  }
}

abstract class Info extends InsightSeverity {
  const factory Info() = _$InfoImpl;
  const Info._() : super._();

  factory Info.fromJson(Map<String, dynamic> json) = _$InfoImpl.fromJson;
}

/// @nodoc
abstract class _$$WarningImplCopyWith<$Res> {
  factory _$$WarningImplCopyWith(
          _$WarningImpl value, $Res Function(_$WarningImpl) then) =
      __$$WarningImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WarningImplCopyWithImpl<$Res>
    extends _$InsightSeverityCopyWithImpl<$Res, _$WarningImpl>
    implements _$$WarningImplCopyWith<$Res> {
  __$$WarningImplCopyWithImpl(
      _$WarningImpl _value, $Res Function(_$WarningImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightSeverity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$WarningImpl extends Warning {
  const _$WarningImpl({final String? $type})
      : $type = $type ?? 'warning',
        super._();

  factory _$WarningImpl.fromJson(Map<String, dynamic> json) =>
      _$$WarningImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightSeverity.warning()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WarningImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() info,
    required TResult Function() warning,
    required TResult Function() success,
    required TResult Function() critical,
  }) {
    return warning();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? info,
    TResult? Function()? warning,
    TResult? Function()? success,
    TResult? Function()? critical,
  }) {
    return warning?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? info,
    TResult Function()? warning,
    TResult Function()? success,
    TResult Function()? critical,
    required TResult orElse(),
  }) {
    if (warning != null) {
      return warning();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Info value) info,
    required TResult Function(Warning value) warning,
    required TResult Function(Success value) success,
    required TResult Function(Critical value) critical,
  }) {
    return warning(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Info value)? info,
    TResult? Function(Warning value)? warning,
    TResult? Function(Success value)? success,
    TResult? Function(Critical value)? critical,
  }) {
    return warning?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Info value)? info,
    TResult Function(Warning value)? warning,
    TResult Function(Success value)? success,
    TResult Function(Critical value)? critical,
    required TResult orElse(),
  }) {
    if (warning != null) {
      return warning(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$WarningImplToJson(
      this,
    );
  }
}

abstract class Warning extends InsightSeverity {
  const factory Warning() = _$WarningImpl;
  const Warning._() : super._();

  factory Warning.fromJson(Map<String, dynamic> json) = _$WarningImpl.fromJson;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$InsightSeverityCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightSeverity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SuccessImpl extends Success {
  const _$SuccessImpl({final String? $type})
      : $type = $type ?? 'success',
        super._();

  factory _$SuccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$SuccessImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightSeverity.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() info,
    required TResult Function() warning,
    required TResult Function() success,
    required TResult Function() critical,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? info,
    TResult? Function()? warning,
    TResult? Function()? success,
    TResult? Function()? critical,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? info,
    TResult Function()? warning,
    TResult Function()? success,
    TResult Function()? critical,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Info value) info,
    required TResult Function(Warning value) warning,
    required TResult Function(Success value) success,
    required TResult Function(Critical value) critical,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Info value)? info,
    TResult? Function(Warning value)? warning,
    TResult? Function(Success value)? success,
    TResult? Function(Critical value)? critical,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Info value)? info,
    TResult Function(Warning value)? warning,
    TResult Function(Success value)? success,
    TResult Function(Critical value)? critical,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SuccessImplToJson(
      this,
    );
  }
}

abstract class Success extends InsightSeverity {
  const factory Success() = _$SuccessImpl;
  const Success._() : super._();

  factory Success.fromJson(Map<String, dynamic> json) = _$SuccessImpl.fromJson;
}

/// @nodoc
abstract class _$$CriticalImplCopyWith<$Res> {
  factory _$$CriticalImplCopyWith(
          _$CriticalImpl value, $Res Function(_$CriticalImpl) then) =
      __$$CriticalImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CriticalImplCopyWithImpl<$Res>
    extends _$InsightSeverityCopyWithImpl<$Res, _$CriticalImpl>
    implements _$$CriticalImplCopyWith<$Res> {
  __$$CriticalImplCopyWithImpl(
      _$CriticalImpl _value, $Res Function(_$CriticalImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsightSeverity
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CriticalImpl extends Critical {
  const _$CriticalImpl({final String? $type})
      : $type = $type ?? 'critical',
        super._();

  factory _$CriticalImpl.fromJson(Map<String, dynamic> json) =>
      _$$CriticalImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'InsightSeverity.critical()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CriticalImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() info,
    required TResult Function() warning,
    required TResult Function() success,
    required TResult Function() critical,
  }) {
    return critical();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? info,
    TResult? Function()? warning,
    TResult? Function()? success,
    TResult? Function()? critical,
  }) {
    return critical?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? info,
    TResult Function()? warning,
    TResult Function()? success,
    TResult Function()? critical,
    required TResult orElse(),
  }) {
    if (critical != null) {
      return critical();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Info value) info,
    required TResult Function(Warning value) warning,
    required TResult Function(Success value) success,
    required TResult Function(Critical value) critical,
  }) {
    return critical(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Info value)? info,
    TResult? Function(Warning value)? warning,
    TResult? Function(Success value)? success,
    TResult? Function(Critical value)? critical,
  }) {
    return critical?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Info value)? info,
    TResult Function(Warning value)? warning,
    TResult Function(Success value)? success,
    TResult Function(Critical value)? critical,
    required TResult orElse(),
  }) {
    if (critical != null) {
      return critical(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CriticalImplToJson(
      this,
    );
  }
}

abstract class Critical extends InsightSeverity {
  const factory Critical() = _$CriticalImpl;
  const Critical._() : super._();

  factory Critical.fromJson(Map<String, dynamic> json) =
      _$CriticalImpl.fromJson;
}

SmartInsight _$SmartInsightFromJson(Map<String, dynamic> json) {
  return _SmartInsight.fromJson(json);
}

/// @nodoc
mixin _$SmartInsight {
  /// Insight type
  InsightType get type => throw _privateConstructorUsedError;

  /// Severity
  InsightSeverity get severity => throw _privateConstructorUsedError;

  /// Title
  String get title => throw _privateConstructorUsedError;

  /// Description
  String get description => throw _privateConstructorUsedError;

  /// Actionable recommendation
  String get recommendation => throw _privateConstructorUsedError;

  /// Related data (optional)
  Map<String, dynamic> get data => throw _privateConstructorUsedError;

  /// Serializes this SmartInsight to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SmartInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SmartInsightCopyWith<SmartInsight> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SmartInsightCopyWith<$Res> {
  factory $SmartInsightCopyWith(
          SmartInsight value, $Res Function(SmartInsight) then) =
      _$SmartInsightCopyWithImpl<$Res, SmartInsight>;
  @useResult
  $Res call(
      {InsightType type,
      InsightSeverity severity,
      String title,
      String description,
      String recommendation,
      Map<String, dynamic> data});

  $InsightTypeCopyWith<$Res> get type;
  $InsightSeverityCopyWith<$Res> get severity;
}

/// @nodoc
class _$SmartInsightCopyWithImpl<$Res, $Val extends SmartInsight>
    implements $SmartInsightCopyWith<$Res> {
  _$SmartInsightCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SmartInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? description = null,
    Object? recommendation = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InsightType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as InsightSeverity,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ) as $Val);
  }

  /// Create a copy of SmartInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InsightTypeCopyWith<$Res> get type {
    return $InsightTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }

  /// Create a copy of SmartInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InsightSeverityCopyWith<$Res> get severity {
    return $InsightSeverityCopyWith<$Res>(_value.severity, (value) {
      return _then(_value.copyWith(severity: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SmartInsightImplCopyWith<$Res>
    implements $SmartInsightCopyWith<$Res> {
  factory _$$SmartInsightImplCopyWith(
          _$SmartInsightImpl value, $Res Function(_$SmartInsightImpl) then) =
      __$$SmartInsightImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {InsightType type,
      InsightSeverity severity,
      String title,
      String description,
      String recommendation,
      Map<String, dynamic> data});

  @override
  $InsightTypeCopyWith<$Res> get type;
  @override
  $InsightSeverityCopyWith<$Res> get severity;
}

/// @nodoc
class __$$SmartInsightImplCopyWithImpl<$Res>
    extends _$SmartInsightCopyWithImpl<$Res, _$SmartInsightImpl>
    implements _$$SmartInsightImplCopyWith<$Res> {
  __$$SmartInsightImplCopyWithImpl(
      _$SmartInsightImpl _value, $Res Function(_$SmartInsightImpl) _then)
      : super(_value, _then);

  /// Create a copy of SmartInsight
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? severity = null,
    Object? title = null,
    Object? description = null,
    Object? recommendation = null,
    Object? data = null,
  }) {
    return _then(_$SmartInsightImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as InsightType,
      severity: null == severity
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as InsightSeverity,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      recommendation: null == recommendation
          ? _value.recommendation
          : recommendation // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SmartInsightImpl extends _SmartInsight {
  const _$SmartInsightImpl(
      {required this.type,
      required this.severity,
      this.title = '',
      this.description = '',
      this.recommendation = '',
      final Map<String, dynamic> data = const {}})
      : _data = data,
        super._();

  factory _$SmartInsightImpl.fromJson(Map<String, dynamic> json) =>
      _$$SmartInsightImplFromJson(json);

  /// Insight type
  @override
  final InsightType type;

  /// Severity
  @override
  final InsightSeverity severity;

  /// Title
  @override
  @JsonKey()
  final String title;

  /// Description
  @override
  @JsonKey()
  final String description;

  /// Actionable recommendation
  @override
  @JsonKey()
  final String recommendation;

  /// Related data (optional)
  final Map<String, dynamic> _data;

  /// Related data (optional)
  @override
  @JsonKey()
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  String toString() {
    return 'SmartInsight(type: $type, severity: $severity, title: $title, description: $description, recommendation: $recommendation, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SmartInsightImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.severity, severity) ||
                other.severity == severity) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.recommendation, recommendation) ||
                other.recommendation == recommendation) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, severity, title,
      description, recommendation, const DeepCollectionEquality().hash(_data));

  /// Create a copy of SmartInsight
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SmartInsightImplCopyWith<_$SmartInsightImpl> get copyWith =>
      __$$SmartInsightImplCopyWithImpl<_$SmartInsightImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SmartInsightImplToJson(
      this,
    );
  }
}

abstract class _SmartInsight extends SmartInsight {
  const factory _SmartInsight(
      {required final InsightType type,
      required final InsightSeverity severity,
      final String title,
      final String description,
      final String recommendation,
      final Map<String, dynamic> data}) = _$SmartInsightImpl;
  const _SmartInsight._() : super._();

  factory _SmartInsight.fromJson(Map<String, dynamic> json) =
      _$SmartInsightImpl.fromJson;

  /// Insight type
  @override
  InsightType get type;

  /// Severity
  @override
  InsightSeverity get severity;

  /// Title
  @override
  String get title;

  /// Description
  @override
  String get description;

  /// Actionable recommendation
  @override
  String get recommendation;

  /// Related data (optional)
  @override
  Map<String, dynamic> get data;

  /// Create a copy of SmartInsight
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SmartInsightImplCopyWith<_$SmartInsightImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsReport _$AnalyticsReportFromJson(Map<String, dynamic> json) {
  return _AnalyticsReport.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsReport {
  /// Report period
  AnalyticsPeriod get period => throw _privateConstructorUsedError;

  /// Summary statistics
  AnalyticsSummary get summary => throw _privateConstructorUsedError;

  /// Category distribution
  List<CategoryDataPoint> get categoryDistribution =>
      throw _privateConstructorUsedError;

  /// Expiry status distribution
  List<ExpiryStatusDataPoint> get expiryStatusDistribution =>
      throw _privateConstructorUsedError;

  /// Monthly trends (last 12 months)
  List<MonthlyTrendDataPoint> get monthlyTrends =>
      throw _privateConstructorUsedError;

  /// Smart insights
  List<SmartInsight> get insights => throw _privateConstructorUsedError;

  /// Generated at timestamp
  DateTime get generatedAt => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsReportCopyWith<AnalyticsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsReportCopyWith<$Res> {
  factory $AnalyticsReportCopyWith(
          AnalyticsReport value, $Res Function(AnalyticsReport) then) =
      _$AnalyticsReportCopyWithImpl<$Res, AnalyticsReport>;
  @useResult
  $Res call(
      {AnalyticsPeriod period,
      AnalyticsSummary summary,
      List<CategoryDataPoint> categoryDistribution,
      List<ExpiryStatusDataPoint> expiryStatusDistribution,
      List<MonthlyTrendDataPoint> monthlyTrends,
      List<SmartInsight> insights,
      DateTime generatedAt});

  $AnalyticsPeriodCopyWith<$Res> get period;
  $AnalyticsSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$AnalyticsReportCopyWithImpl<$Res, $Val extends AnalyticsReport>
    implements $AnalyticsReportCopyWith<$Res> {
  _$AnalyticsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? summary = null,
    Object? categoryDistribution = null,
    Object? expiryStatusDistribution = null,
    Object? monthlyTrends = null,
    Object? insights = null,
    Object? generatedAt = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriod,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as AnalyticsSummary,
      categoryDistribution: null == categoryDistribution
          ? _value.categoryDistribution
          : categoryDistribution // ignore: cast_nullable_to_non_nullable
              as List<CategoryDataPoint>,
      expiryStatusDistribution: null == expiryStatusDistribution
          ? _value.expiryStatusDistribution
          : expiryStatusDistribution // ignore: cast_nullable_to_non_nullable
              as List<ExpiryStatusDataPoint>,
      monthlyTrends: null == monthlyTrends
          ? _value.monthlyTrends
          : monthlyTrends // ignore: cast_nullable_to_non_nullable
              as List<MonthlyTrendDataPoint>,
      insights: null == insights
          ? _value.insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<SmartInsight>,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of AnalyticsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsPeriodCopyWith<$Res> get period {
    return $AnalyticsPeriodCopyWith<$Res>(_value.period, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }

  /// Create a copy of AnalyticsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AnalyticsSummaryCopyWith<$Res> get summary {
    return $AnalyticsSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsReportImplCopyWith<$Res>
    implements $AnalyticsReportCopyWith<$Res> {
  factory _$$AnalyticsReportImplCopyWith(_$AnalyticsReportImpl value,
          $Res Function(_$AnalyticsReportImpl) then) =
      __$$AnalyticsReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AnalyticsPeriod period,
      AnalyticsSummary summary,
      List<CategoryDataPoint> categoryDistribution,
      List<ExpiryStatusDataPoint> expiryStatusDistribution,
      List<MonthlyTrendDataPoint> monthlyTrends,
      List<SmartInsight> insights,
      DateTime generatedAt});

  @override
  $AnalyticsPeriodCopyWith<$Res> get period;
  @override
  $AnalyticsSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$AnalyticsReportImplCopyWithImpl<$Res>
    extends _$AnalyticsReportCopyWithImpl<$Res, _$AnalyticsReportImpl>
    implements _$$AnalyticsReportImplCopyWith<$Res> {
  __$$AnalyticsReportImplCopyWithImpl(
      _$AnalyticsReportImpl _value, $Res Function(_$AnalyticsReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? summary = null,
    Object? categoryDistribution = null,
    Object? expiryStatusDistribution = null,
    Object? monthlyTrends = null,
    Object? insights = null,
    Object? generatedAt = null,
  }) {
    return _then(_$AnalyticsReportImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as AnalyticsPeriod,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as AnalyticsSummary,
      categoryDistribution: null == categoryDistribution
          ? _value._categoryDistribution
          : categoryDistribution // ignore: cast_nullable_to_non_nullable
              as List<CategoryDataPoint>,
      expiryStatusDistribution: null == expiryStatusDistribution
          ? _value._expiryStatusDistribution
          : expiryStatusDistribution // ignore: cast_nullable_to_non_nullable
              as List<ExpiryStatusDataPoint>,
      monthlyTrends: null == monthlyTrends
          ? _value._monthlyTrends
          : monthlyTrends // ignore: cast_nullable_to_non_nullable
              as List<MonthlyTrendDataPoint>,
      insights: null == insights
          ? _value._insights
          : insights // ignore: cast_nullable_to_non_nullable
              as List<SmartInsight>,
      generatedAt: null == generatedAt
          ? _value.generatedAt
          : generatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsReportImpl extends _AnalyticsReport {
  const _$AnalyticsReportImpl(
      {required this.period,
      required this.summary,
      final List<CategoryDataPoint> categoryDistribution = const [],
      final List<ExpiryStatusDataPoint> expiryStatusDistribution = const [],
      final List<MonthlyTrendDataPoint> monthlyTrends = const [],
      final List<SmartInsight> insights = const [],
      required this.generatedAt})
      : _categoryDistribution = categoryDistribution,
        _expiryStatusDistribution = expiryStatusDistribution,
        _monthlyTrends = monthlyTrends,
        _insights = insights,
        super._();

  factory _$AnalyticsReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsReportImplFromJson(json);

  /// Report period
  @override
  final AnalyticsPeriod period;

  /// Summary statistics
  @override
  final AnalyticsSummary summary;

  /// Category distribution
  final List<CategoryDataPoint> _categoryDistribution;

  /// Category distribution
  @override
  @JsonKey()
  List<CategoryDataPoint> get categoryDistribution {
    if (_categoryDistribution is EqualUnmodifiableListView)
      return _categoryDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryDistribution);
  }

  /// Expiry status distribution
  final List<ExpiryStatusDataPoint> _expiryStatusDistribution;

  /// Expiry status distribution
  @override
  @JsonKey()
  List<ExpiryStatusDataPoint> get expiryStatusDistribution {
    if (_expiryStatusDistribution is EqualUnmodifiableListView)
      return _expiryStatusDistribution;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expiryStatusDistribution);
  }

  /// Monthly trends (last 12 months)
  final List<MonthlyTrendDataPoint> _monthlyTrends;

  /// Monthly trends (last 12 months)
  @override
  @JsonKey()
  List<MonthlyTrendDataPoint> get monthlyTrends {
    if (_monthlyTrends is EqualUnmodifiableListView) return _monthlyTrends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyTrends);
  }

  /// Smart insights
  final List<SmartInsight> _insights;

  /// Smart insights
  @override
  @JsonKey()
  List<SmartInsight> get insights {
    if (_insights is EqualUnmodifiableListView) return _insights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_insights);
  }

  /// Generated at timestamp
  @override
  final DateTime generatedAt;

  @override
  String toString() {
    return 'AnalyticsReport(period: $period, summary: $summary, categoryDistribution: $categoryDistribution, expiryStatusDistribution: $expiryStatusDistribution, monthlyTrends: $monthlyTrends, insights: $insights, generatedAt: $generatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsReportImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality()
                .equals(other._categoryDistribution, _categoryDistribution) &&
            const DeepCollectionEquality().equals(
                other._expiryStatusDistribution, _expiryStatusDistribution) &&
            const DeepCollectionEquality()
                .equals(other._monthlyTrends, _monthlyTrends) &&
            const DeepCollectionEquality().equals(other._insights, _insights) &&
            (identical(other.generatedAt, generatedAt) ||
                other.generatedAt == generatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      period,
      summary,
      const DeepCollectionEquality().hash(_categoryDistribution),
      const DeepCollectionEquality().hash(_expiryStatusDistribution),
      const DeepCollectionEquality().hash(_monthlyTrends),
      const DeepCollectionEquality().hash(_insights),
      generatedAt);

  /// Create a copy of AnalyticsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsReportImplCopyWith<_$AnalyticsReportImpl> get copyWith =>
      __$$AnalyticsReportImplCopyWithImpl<_$AnalyticsReportImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsReportImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsReport extends AnalyticsReport {
  const factory _AnalyticsReport(
      {required final AnalyticsPeriod period,
      required final AnalyticsSummary summary,
      final List<CategoryDataPoint> categoryDistribution,
      final List<ExpiryStatusDataPoint> expiryStatusDistribution,
      final List<MonthlyTrendDataPoint> monthlyTrends,
      final List<SmartInsight> insights,
      required final DateTime generatedAt}) = _$AnalyticsReportImpl;
  const _AnalyticsReport._() : super._();

  factory _AnalyticsReport.fromJson(Map<String, dynamic> json) =
      _$AnalyticsReportImpl.fromJson;

  /// Report period
  @override
  AnalyticsPeriod get period;

  /// Summary statistics
  @override
  AnalyticsSummary get summary;

  /// Category distribution
  @override
  List<CategoryDataPoint> get categoryDistribution;

  /// Expiry status distribution
  @override
  List<ExpiryStatusDataPoint> get expiryStatusDistribution;

  /// Monthly trends (last 12 months)
  @override
  List<MonthlyTrendDataPoint> get monthlyTrends;

  /// Smart insights
  @override
  List<SmartInsight> get insights;

  /// Generated at timestamp
  @override
  DateTime get generatedAt;

  /// Create a copy of AnalyticsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsReportImplCopyWith<_$AnalyticsReportImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
