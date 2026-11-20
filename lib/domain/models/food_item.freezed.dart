// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodItem _$FoodItemFromJson(Map<String, dynamic> json) {
  return _FoodItem.fromJson(json);
}

/// @nodoc
mixin _$FoodItem {
  /// Unique identifier (deterministic hash for deduplication)
  String get id => throw _privateConstructorUsedError;

  /// Item name
  String get name => throw _privateConstructorUsedError;

  /// Category (e.g., "Dairy", "Produce", "Meat")
  String get category => throw _privateConstructorUsedError;

  /// Expiry date (UTC midnight)
  DateTime get expiryDate => throw _privateConstructorUsedError;

  /// Quantity
  int get quantity => throw _privateConstructorUsedError;

  /// Barcode (EAN/UPC)
  String get barcode => throw _privateConstructorUsedError;

  /// Storage location
  StorageLocation get location => throw _privateConstructorUsedError;

  /// Brand name
  String get brand => throw _privateConstructorUsedError;

  /// Purchase date (UTC midnight)
  DateTime? get purchaseDate => throw _privateConstructorUsedError;

  /// Image URL (local or cloud)
  String get imageUrl => throw _privateConstructorUsedError;

  /// Notes
  String get notes => throw _privateConstructorUsedError;

  /// Household ID (for multi-user sync)
  String get householdId => throw _privateConstructorUsedError;

  /// User ID who added this item
  String get addedBy => throw _privateConstructorUsedError;

  /// Last updated timestamp (UTC)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Optimistic locking version
  int get version => throw _privateConstructorUsedError;

  /// Last sync timestamp (UTC)
  DateTime? get syncedAt => throw _privateConstructorUsedError;

  /// Soft delete timestamp (UTC)
  DateTime? get deletedAt => throw _privateConstructorUsedError;

  /// Product ID from catalog lookup
  String get productId => throw _privateConstructorUsedError;

  /// Server document ID (Firestore)
  String get serverId => throw _privateConstructorUsedError;

  /// Serializes this FoodItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodItemCopyWith<FoodItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodItemCopyWith<$Res> {
  factory $FoodItemCopyWith(FoodItem value, $Res Function(FoodItem) then) =
      _$FoodItemCopyWithImpl<$Res, FoodItem>;
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      DateTime expiryDate,
      int quantity,
      String barcode,
      StorageLocation location,
      String brand,
      DateTime? purchaseDate,
      String imageUrl,
      String notes,
      String householdId,
      String addedBy,
      DateTime? updatedAt,
      int version,
      DateTime? syncedAt,
      DateTime? deletedAt,
      String productId,
      String serverId});

  $StorageLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$FoodItemCopyWithImpl<$Res, $Val extends FoodItem>
    implements $FoodItemCopyWith<$Res> {
  _$FoodItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? expiryDate = null,
    Object? quantity = null,
    Object? barcode = null,
    Object? location = null,
    Object? brand = null,
    Object? purchaseDate = freezed,
    Object? imageUrl = null,
    Object? notes = null,
    Object? householdId = null,
    Object? addedBy = null,
    Object? updatedAt = freezed,
    Object? version = null,
    Object? syncedAt = freezed,
    Object? deletedAt = freezed,
    Object? productId = null,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as StorageLocation,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      householdId: null == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String,
      addedBy: null == addedBy
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      syncedAt: freezed == syncedAt
          ? _value.syncedAt
          : syncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StorageLocationCopyWith<$Res> get location {
    return $StorageLocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodItemImplCopyWith<$Res>
    implements $FoodItemCopyWith<$Res> {
  factory _$$FoodItemImplCopyWith(
          _$FoodItemImpl value, $Res Function(_$FoodItemImpl) then) =
      __$$FoodItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String category,
      DateTime expiryDate,
      int quantity,
      String barcode,
      StorageLocation location,
      String brand,
      DateTime? purchaseDate,
      String imageUrl,
      String notes,
      String householdId,
      String addedBy,
      DateTime? updatedAt,
      int version,
      DateTime? syncedAt,
      DateTime? deletedAt,
      String productId,
      String serverId});

  @override
  $StorageLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$FoodItemImplCopyWithImpl<$Res>
    extends _$FoodItemCopyWithImpl<$Res, _$FoodItemImpl>
    implements _$$FoodItemImplCopyWith<$Res> {
  __$$FoodItemImplCopyWithImpl(
      _$FoodItemImpl _value, $Res Function(_$FoodItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? expiryDate = null,
    Object? quantity = null,
    Object? barcode = null,
    Object? location = null,
    Object? brand = null,
    Object? purchaseDate = freezed,
    Object? imageUrl = null,
    Object? notes = null,
    Object? householdId = null,
    Object? addedBy = null,
    Object? updatedAt = freezed,
    Object? version = null,
    Object? syncedAt = freezed,
    Object? deletedAt = freezed,
    Object? productId = null,
    Object? serverId = null,
  }) {
    return _then(_$FoodItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      expiryDate: null == expiryDate
          ? _value.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as StorageLocation,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseDate: freezed == purchaseDate
          ? _value.purchaseDate
          : purchaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
      householdId: null == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String,
      addedBy: null == addedBy
          ? _value.addedBy
          : addedBy // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      syncedAt: freezed == syncedAt
          ? _value.syncedAt
          : syncedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      serverId: null == serverId
          ? _value.serverId
          : serverId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodItemImpl extends _FoodItem {
  const _$FoodItemImpl(
      {this.id = '',
      this.name = '',
      this.category = '',
      required this.expiryDate,
      this.quantity = 1,
      this.barcode = '',
      this.location = const StorageLocation.pantry(),
      this.brand = '',
      this.purchaseDate,
      this.imageUrl = '',
      this.notes = '',
      this.householdId = '',
      this.addedBy = '',
      this.updatedAt,
      this.version = 1,
      this.syncedAt,
      this.deletedAt,
      this.productId = '',
      this.serverId = ''})
      : super._();

  factory _$FoodItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodItemImplFromJson(json);

  /// Unique identifier (deterministic hash for deduplication)
  @override
  @JsonKey()
  final String id;

  /// Item name
  @override
  @JsonKey()
  final String name;

  /// Category (e.g., "Dairy", "Produce", "Meat")
  @override
  @JsonKey()
  final String category;

  /// Expiry date (UTC midnight)
  @override
  final DateTime expiryDate;

  /// Quantity
  @override
  @JsonKey()
  final int quantity;

  /// Barcode (EAN/UPC)
  @override
  @JsonKey()
  final String barcode;

  /// Storage location
  @override
  @JsonKey()
  final StorageLocation location;

  /// Brand name
  @override
  @JsonKey()
  final String brand;

  /// Purchase date (UTC midnight)
  @override
  final DateTime? purchaseDate;

  /// Image URL (local or cloud)
  @override
  @JsonKey()
  final String imageUrl;

  /// Notes
  @override
  @JsonKey()
  final String notes;

  /// Household ID (for multi-user sync)
  @override
  @JsonKey()
  final String householdId;

  /// User ID who added this item
  @override
  @JsonKey()
  final String addedBy;

  /// Last updated timestamp (UTC)
  @override
  final DateTime? updatedAt;

  /// Optimistic locking version
  @override
  @JsonKey()
  final int version;

  /// Last sync timestamp (UTC)
  @override
  final DateTime? syncedAt;

  /// Soft delete timestamp (UTC)
  @override
  final DateTime? deletedAt;

  /// Product ID from catalog lookup
  @override
  @JsonKey()
  final String productId;

  /// Server document ID (Firestore)
  @override
  @JsonKey()
  final String serverId;

  @override
  String toString() {
    return 'FoodItem(id: $id, name: $name, category: $category, expiryDate: $expiryDate, quantity: $quantity, barcode: $barcode, location: $location, brand: $brand, purchaseDate: $purchaseDate, imageUrl: $imageUrl, notes: $notes, householdId: $householdId, addedBy: $addedBy, updatedAt: $updatedAt, version: $version, syncedAt: $syncedAt, deletedAt: $deletedAt, productId: $productId, serverId: $serverId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.purchaseDate, purchaseDate) ||
                other.purchaseDate == purchaseDate) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.householdId, householdId) ||
                other.householdId == householdId) &&
            (identical(other.addedBy, addedBy) || other.addedBy == addedBy) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.syncedAt, syncedAt) ||
                other.syncedAt == syncedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.serverId, serverId) ||
                other.serverId == serverId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        category,
        expiryDate,
        quantity,
        barcode,
        location,
        brand,
        purchaseDate,
        imageUrl,
        notes,
        householdId,
        addedBy,
        updatedAt,
        version,
        syncedAt,
        deletedAt,
        productId,
        serverId
      ]);

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodItemImplCopyWith<_$FoodItemImpl> get copyWith =>
      __$$FoodItemImplCopyWithImpl<_$FoodItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodItemImplToJson(
      this,
    );
  }
}

abstract class _FoodItem extends FoodItem {
  const factory _FoodItem(
      {final String id,
      final String name,
      final String category,
      required final DateTime expiryDate,
      final int quantity,
      final String barcode,
      final StorageLocation location,
      final String brand,
      final DateTime? purchaseDate,
      final String imageUrl,
      final String notes,
      final String householdId,
      final String addedBy,
      final DateTime? updatedAt,
      final int version,
      final DateTime? syncedAt,
      final DateTime? deletedAt,
      final String productId,
      final String serverId}) = _$FoodItemImpl;
  const _FoodItem._() : super._();

  factory _FoodItem.fromJson(Map<String, dynamic> json) =
      _$FoodItemImpl.fromJson;

  /// Unique identifier (deterministic hash for deduplication)
  @override
  String get id;

  /// Item name
  @override
  String get name;

  /// Category (e.g., "Dairy", "Produce", "Meat")
  @override
  String get category;

  /// Expiry date (UTC midnight)
  @override
  DateTime get expiryDate;

  /// Quantity
  @override
  int get quantity;

  /// Barcode (EAN/UPC)
  @override
  String get barcode;

  /// Storage location
  @override
  StorageLocation get location;

  /// Brand name
  @override
  String get brand;

  /// Purchase date (UTC midnight)
  @override
  DateTime? get purchaseDate;

  /// Image URL (local or cloud)
  @override
  String get imageUrl;

  /// Notes
  @override
  String get notes;

  /// Household ID (for multi-user sync)
  @override
  String get householdId;

  /// User ID who added this item
  @override
  String get addedBy;

  /// Last updated timestamp (UTC)
  @override
  DateTime? get updatedAt;

  /// Optimistic locking version
  @override
  int get version;

  /// Last sync timestamp (UTC)
  @override
  DateTime? get syncedAt;

  /// Soft delete timestamp (UTC)
  @override
  DateTime? get deletedAt;

  /// Product ID from catalog lookup
  @override
  String get productId;

  /// Server document ID (Firestore)
  @override
  String get serverId;

  /// Create a copy of FoodItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodItemImplCopyWith<_$FoodItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
