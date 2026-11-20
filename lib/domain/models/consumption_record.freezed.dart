// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumption_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsumptionRecord _$ConsumptionRecordFromJson(Map<String, dynamic> json) {
  return _ConsumptionRecord.fromJson(json);
}

/// @nodoc
mixin _$ConsumptionRecord {
  /// Unique identifier
  String get id => throw _privateConstructorUsedError;

  /// Reference to the inventory item
  String get itemId => throw _privateConstructorUsedError;

  /// Item name (denormalized for history)
  String get itemName => throw _privateConstructorUsedError;

  /// Category (denormalized)
  String get category => throw _privateConstructorUsedError;

  /// Expiry date at time of consumption
  DateTime get expiryDate => throw _privateConstructorUsedError;

  /// When the item was used (UTC)
  DateTime get usedOn => throw _privateConstructorUsedError;

  /// User ID who marked it as used
  String get usedBy => throw _privateConstructorUsedError;

  /// Household ID
  String get householdId => throw _privateConstructorUsedError;

  /// Whether the item was expiring/expired at time of use
  bool get wasExpiringAtUse => throw _privateConstructorUsedError;

  /// Creation timestamp (UTC)
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Server document ID (Firestore)
  String get serverId => throw _privateConstructorUsedError;

  /// Serializes this ConsumptionRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsumptionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsumptionRecordCopyWith<ConsumptionRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumptionRecordCopyWith<$Res> {
  factory $ConsumptionRecordCopyWith(
          ConsumptionRecord value, $Res Function(ConsumptionRecord) then) =
      _$ConsumptionRecordCopyWithImpl<$Res, ConsumptionRecord>;
  @useResult
  $Res call(
      {String id,
      String itemId,
      String itemName,
      String category,
      DateTime expiryDate,
      DateTime usedOn,
      String usedBy,
      String householdId,
      bool wasExpiringAtUse,
      DateTime? createdAt,
      String serverId});
}

/// @nodoc
class _$ConsumptionRecordCopyWithImpl<$Res, $Val extends ConsumptionRecord>
    implements $ConsumptionRecordCopyWith<$Res> {
  _$ConsumptionRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsumptionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? itemName = null,
    Object? category = null,
    Object? expiryDate = null,
    Object? usedOn = null,
    Object? usedBy = null,
    Object? householdId = null,
    Object? wasExpiringAtUse = null,
    Object? createdAt = freezed,
    Object? serverId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usedOn: null == usedOn
          ? _value.usedOn
          : usedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usedBy: null == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as String,
      householdId: null == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String,
      wasExpiringAtUse: null == wasExpiringAtUse
          ? _value.wasExpiringAtUse
          : wasExpiringAtUse // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsumptionRecordImplCopyWith<$Res>
    implements $ConsumptionRecordCopyWith<$Res> {
  factory _$$ConsumptionRecordImplCopyWith(_$ConsumptionRecordImpl value,
          $Res Function(_$ConsumptionRecordImpl) then) =
      __$$ConsumptionRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String itemId,
      String itemName,
      String category,
      DateTime expiryDate,
      DateTime usedOn,
      String usedBy,
      String householdId,
      bool wasExpiringAtUse,
      DateTime? createdAt,
      String serverId});
}

/// @nodoc
class __$$ConsumptionRecordImplCopyWithImpl<$Res>
    extends _$ConsumptionRecordCopyWithImpl<$Res, _$ConsumptionRecordImpl>
    implements _$$ConsumptionRecordImplCopyWith<$Res> {
  __$$ConsumptionRecordImplCopyWithImpl(_$ConsumptionRecordImpl _value,
      $Res Function(_$ConsumptionRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConsumptionRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemId = null,
    Object? itemName = null,
    Object? category = null,
    Object? expiryDate = null,
    Object? usedOn = null,
    Object? usedBy = null,
    Object? householdId = null,
    Object? wasExpiringAtUse = null,
    Object? createdAt = freezed,
    Object? serverId = null,
  }) {
    return _then(_$ConsumptionRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usedOn: null == usedOn
          ? _value.usedOn
          : usedOn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      usedBy: null == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as String,
      householdId: null == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String,
      wasExpiringAtUse: null == wasExpiringAtUse
          ? _value.wasExpiringAtUse
          : wasExpiringAtUse // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
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
class _$ConsumptionRecordImpl extends _ConsumptionRecord {
  const _$ConsumptionRecordImpl(
      {this.id = '',
      this.itemId = '',
      this.itemName = '',
      this.category = '',
      required this.expiryDate,
      required this.usedOn,
      this.usedBy = '',
      this.householdId = '',
      this.wasExpiringAtUse = false,
      this.createdAt,
      this.serverId = ''})
      : super._();

  factory _$ConsumptionRecordImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumptionRecordImplFromJson(json);

  /// Unique identifier
  @override
  @JsonKey()
  final String id;

  /// Reference to the inventory item
  @override
  @JsonKey()
  final String itemId;

  /// Item name (denormalized for history)
  @override
  @JsonKey()
  final String itemName;

  /// Category (denormalized)
  @override
  @JsonKey()
  final String category;

  /// Expiry date at time of consumption
  @override
  final DateTime expiryDate;

  /// When the item was used (UTC)
  @override
  final DateTime usedOn;

  /// User ID who marked it as used
  @override
  @JsonKey()
  final String usedBy;

  /// Household ID
  @override
  @JsonKey()
  final String householdId;

  /// Whether the item was expiring/expired at time of use
  @override
  @JsonKey()
  final bool wasExpiringAtUse;

  /// Creation timestamp (UTC)
  @override
  final DateTime? createdAt;

  /// Server document ID (Firestore)
  @override
  @JsonKey()
  final String serverId;

  @override
  String toString() {
    return 'ConsumptionRecord(id: $id, itemId: $itemId, itemName: $itemName, category: $category, expiryDate: $expiryDate, usedOn: $usedOn, usedBy: $usedBy, householdId: $householdId, wasExpiringAtUse: $wasExpiringAtUse, createdAt: $createdAt, serverId: $serverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumptionRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.usedOn, usedOn) || other.usedOn == usedOn) &&
            (identical(other.usedBy, usedBy) || other.usedBy == usedBy) &&
            (identical(other.householdId, householdId) ||
                other.householdId == householdId) &&
            (identical(other.wasExpiringAtUse, wasExpiringAtUse) ||
                other.wasExpiringAtUse == wasExpiringAtUse) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      itemId,
      itemName,
      category,
      expiryDate,
      usedOn,
      usedBy,
      householdId,
      wasExpiringAtUse,
      createdAt,
      serverId);

  /// Create a copy of ConsumptionRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumptionRecordImplCopyWith<_$ConsumptionRecordImpl> get copyWith =>
      __$$ConsumptionRecordImplCopyWithImpl<_$ConsumptionRecordImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumptionRecordImplToJson(
      this,
    );
  }
}

abstract class _ConsumptionRecord extends ConsumptionRecord {
  const factory _ConsumptionRecord(
      {final String id,
      final String itemId,
      final String itemName,
      final String category,
      required final DateTime expiryDate,
      required final DateTime usedOn,
      final String usedBy,
      final String householdId,
      final bool wasExpiringAtUse,
      final DateTime? createdAt,
      final String serverId}) = _$ConsumptionRecordImpl;
  const _ConsumptionRecord._() : super._();

  factory _ConsumptionRecord.fromJson(Map<String, dynamic> json) =
      _$ConsumptionRecordImpl.fromJson;

  /// Unique identifier
  @override
  String get id;

  /// Reference to the inventory item
  @override
  String get itemId;

  /// Item name (denormalized for history)
  @override
  String get itemName;

  /// Category (denormalized)
  @override
  String get category;

  /// Expiry date at time of consumption
  @override
  DateTime get expiryDate;

  /// When the item was used (UTC)
  @override
  DateTime get usedOn;

  /// User ID who marked it as used
  @override
  String get usedBy;

  /// Household ID
  @override
  String get householdId;

  /// Whether the item was expiring/expired at time of use
  @override
  bool get wasExpiringAtUse;

  /// Creation timestamp (UTC)
  @override
  DateTime? get createdAt;

  /// Server document ID (Firestore)
  @override
  String get serverId;

  /// Create a copy of ConsumptionRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsumptionRecordImplCopyWith<_$ConsumptionRecordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
