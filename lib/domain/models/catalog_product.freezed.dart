// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CatalogProduct _$CatalogProductFromJson(Map<String, dynamic> json) {
  return _CatalogProduct.fromJson(json);
}

/// @nodoc
mixin _$CatalogProduct {
  /// Barcode (primary key)
  String get barcode => throw _privateConstructorUsedError;

  /// Product name
  String get name => throw _privateConstructorUsedError;

  /// Brand
  String get brand => throw _privateConstructorUsedError;

  /// Category
  String get category => throw _privateConstructorUsedError;

  /// Package size (e.g., "500g", "1L")
  String get packageSize => throw _privateConstructorUsedError;

  /// Package unit (e.g., "g", "ml", "pcs")
  String get packageUnit => throw _privateConstructorUsedError;

  /// Description
  String get description => throw _privateConstructorUsedError;

  /// Image URL
  String get imageUrl => throw _privateConstructorUsedError;

  /// Data provider (openfoodfacts, upcitemdb, etc.)
  String get provider => throw _privateConstructorUsedError;

  /// Provider-specific ID
  String get providerId => throw _privateConstructorUsedError;

  /// Last verified timestamp
  DateTime? get lastVerified => throw _privateConstructorUsedError;

  /// Lookup status
  LookupStatus get lookupStatus => throw _privateConstructorUsedError;

  /// Last lookup attempt timestamp
  DateTime? get lastAttempt => throw _privateConstructorUsedError;

  /// Serializes this CatalogProduct to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatalogProductCopyWith<CatalogProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogProductCopyWith<$Res> {
  factory $CatalogProductCopyWith(
          CatalogProduct value, $Res Function(CatalogProduct) then) =
      _$CatalogProductCopyWithImpl<$Res, CatalogProduct>;
  @useResult
  $Res call(
      {String barcode,
      String name,
      String brand,
      String category,
      String packageSize,
      String packageUnit,
      String description,
      String imageUrl,
      String provider,
      String providerId,
      DateTime? lastVerified,
      LookupStatus lookupStatus,
      DateTime? lastAttempt});

  $LookupStatusCopyWith<$Res> get lookupStatus;
}

/// @nodoc
class _$CatalogProductCopyWithImpl<$Res, $Val extends CatalogProduct>
    implements $CatalogProductCopyWith<$Res> {
  _$CatalogProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? name = null,
    Object? brand = null,
    Object? category = null,
    Object? packageSize = null,
    Object? packageUnit = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? provider = null,
    Object? providerId = null,
    Object? lastVerified = freezed,
    Object? lookupStatus = null,
    Object? lastAttempt = freezed,
  }) {
    return _then(_value.copyWith(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      packageSize: null == packageSize
          ? _value.packageSize
          : packageSize // ignore: cast_nullable_to_non_nullable
              as String,
      packageUnit: null == packageUnit
          ? _value.packageUnit
          : packageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      lastVerified: freezed == lastVerified
          ? _value.lastVerified
          : lastVerified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lookupStatus: null == lookupStatus
          ? _value.lookupStatus
          : lookupStatus // ignore: cast_nullable_to_non_nullable
              as LookupStatus,
      lastAttempt: freezed == lastAttempt
          ? _value.lastAttempt
          : lastAttempt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LookupStatusCopyWith<$Res> get lookupStatus {
    return $LookupStatusCopyWith<$Res>(_value.lookupStatus, (value) {
      return _then(_value.copyWith(lookupStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CatalogProductImplCopyWith<$Res>
    implements $CatalogProductCopyWith<$Res> {
  factory _$$CatalogProductImplCopyWith(_$CatalogProductImpl value,
          $Res Function(_$CatalogProductImpl) then) =
      __$$CatalogProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String barcode,
      String name,
      String brand,
      String category,
      String packageSize,
      String packageUnit,
      String description,
      String imageUrl,
      String provider,
      String providerId,
      DateTime? lastVerified,
      LookupStatus lookupStatus,
      DateTime? lastAttempt});

  @override
  $LookupStatusCopyWith<$Res> get lookupStatus;
}

/// @nodoc
class __$$CatalogProductImplCopyWithImpl<$Res>
    extends _$CatalogProductCopyWithImpl<$Res, _$CatalogProductImpl>
    implements _$$CatalogProductImplCopyWith<$Res> {
  __$$CatalogProductImplCopyWithImpl(
      _$CatalogProductImpl _value, $Res Function(_$CatalogProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? barcode = null,
    Object? name = null,
    Object? brand = null,
    Object? category = null,
    Object? packageSize = null,
    Object? packageUnit = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? provider = null,
    Object? providerId = null,
    Object? lastVerified = freezed,
    Object? lookupStatus = null,
    Object? lastAttempt = freezed,
  }) {
    return _then(_$CatalogProductImpl(
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      packageSize: null == packageSize
          ? _value.packageSize
          : packageSize // ignore: cast_nullable_to_non_nullable
              as String,
      packageUnit: null == packageUnit
          ? _value.packageUnit
          : packageUnit // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      lastVerified: freezed == lastVerified
          ? _value.lastVerified
          : lastVerified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lookupStatus: null == lookupStatus
          ? _value.lookupStatus
          : lookupStatus // ignore: cast_nullable_to_non_nullable
              as LookupStatus,
      lastAttempt: freezed == lastAttempt
          ? _value.lastAttempt
          : lastAttempt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CatalogProductImpl extends _CatalogProduct {
  const _$CatalogProductImpl(
      {this.barcode = '',
      this.name = '',
      this.brand = '',
      this.category = '',
      this.packageSize = '',
      this.packageUnit = '',
      this.description = '',
      this.imageUrl = '',
      this.provider = '',
      this.providerId = '',
      this.lastVerified,
      this.lookupStatus = const LookupStatus.pending(),
      this.lastAttempt})
      : super._();

  factory _$CatalogProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$CatalogProductImplFromJson(json);

  /// Barcode (primary key)
  @override
  @JsonKey()
  final String barcode;

  /// Product name
  @override
  @JsonKey()
  final String name;

  /// Brand
  @override
  @JsonKey()
  final String brand;

  /// Category
  @override
  @JsonKey()
  final String category;

  /// Package size (e.g., "500g", "1L")
  @override
  @JsonKey()
  final String packageSize;

  /// Package unit (e.g., "g", "ml", "pcs")
  @override
  @JsonKey()
  final String packageUnit;

  /// Description
  @override
  @JsonKey()
  final String description;

  /// Image URL
  @override
  @JsonKey()
  final String imageUrl;

  /// Data provider (openfoodfacts, upcitemdb, etc.)
  @override
  @JsonKey()
  final String provider;

  /// Provider-specific ID
  @override
  @JsonKey()
  final String providerId;

  /// Last verified timestamp
  @override
  final DateTime? lastVerified;

  /// Lookup status
  @override
  @JsonKey()
  final LookupStatus lookupStatus;

  /// Last lookup attempt timestamp
  @override
  final DateTime? lastAttempt;

  @override
  String toString() {
    return 'CatalogProduct(barcode: $barcode, name: $name, brand: $brand, category: $category, packageSize: $packageSize, packageUnit: $packageUnit, description: $description, imageUrl: $imageUrl, provider: $provider, providerId: $providerId, lastVerified: $lastVerified, lookupStatus: $lookupStatus, lastAttempt: $lastAttempt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogProductImpl &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.packageSize, packageSize) ||
                other.packageSize == packageSize) &&
            (identical(other.packageUnit, packageUnit) ||
                other.packageUnit == packageUnit) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.lastVerified, lastVerified) ||
                other.lastVerified == lastVerified) &&
            (identical(other.lookupStatus, lookupStatus) ||
                other.lookupStatus == lookupStatus) &&
            (identical(other.lastAttempt, lastAttempt) ||
                other.lastAttempt == lastAttempt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      barcode,
      name,
      brand,
      category,
      packageSize,
      packageUnit,
      description,
      imageUrl,
      provider,
      providerId,
      lastVerified,
      lookupStatus,
      lastAttempt);

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogProductImplCopyWith<_$CatalogProductImpl> get copyWith =>
      __$$CatalogProductImplCopyWithImpl<_$CatalogProductImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CatalogProductImplToJson(
      this,
    );
  }
}

abstract class _CatalogProduct extends CatalogProduct {
  const factory _CatalogProduct(
      {final String barcode,
      final String name,
      final String brand,
      final String category,
      final String packageSize,
      final String packageUnit,
      final String description,
      final String imageUrl,
      final String provider,
      final String providerId,
      final DateTime? lastVerified,
      final LookupStatus lookupStatus,
      final DateTime? lastAttempt}) = _$CatalogProductImpl;
  const _CatalogProduct._() : super._();

  factory _CatalogProduct.fromJson(Map<String, dynamic> json) =
      _$CatalogProductImpl.fromJson;

  /// Barcode (primary key)
  @override
  String get barcode;

  /// Product name
  @override
  String get name;

  /// Brand
  @override
  String get brand;

  /// Category
  @override
  String get category;

  /// Package size (e.g., "500g", "1L")
  @override
  String get packageSize;

  /// Package unit (e.g., "g", "ml", "pcs")
  @override
  String get packageUnit;

  /// Description
  @override
  String get description;

  /// Image URL
  @override
  String get imageUrl;

  /// Data provider (openfoodfacts, upcitemdb, etc.)
  @override
  String get provider;

  /// Provider-specific ID
  @override
  String get providerId;

  /// Last verified timestamp
  @override
  DateTime? get lastVerified;

  /// Lookup status
  @override
  LookupStatus get lookupStatus;

  /// Last lookup attempt timestamp
  @override
  DateTime? get lastAttempt;

  /// Create a copy of CatalogProduct
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatalogProductImplCopyWith<_$CatalogProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LookupStatus _$LookupStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'pending':
      return Pending.fromJson(json);
    case 'found':
      return Found.fromJson(json);
    case 'notFound':
      return NotFound.fromJson(json);
    case 'error':
      return Error.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'LookupStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$LookupStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() found,
    required TResult Function() notFound,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? found,
    TResult? Function()? notFound,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? found,
    TResult Function()? notFound,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Found value) found,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Found value)? found,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Found value)? found,
    TResult Function(NotFound value)? notFound,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this LookupStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LookupStatusCopyWith<$Res> {
  factory $LookupStatusCopyWith(
          LookupStatus value, $Res Function(LookupStatus) then) =
      _$LookupStatusCopyWithImpl<$Res, LookupStatus>;
}

/// @nodoc
class _$LookupStatusCopyWithImpl<$Res, $Val extends LookupStatus>
    implements $LookupStatusCopyWith<$Res> {
  _$LookupStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LookupStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PendingImplCopyWith<$Res> {
  factory _$$PendingImplCopyWith(
          _$PendingImpl value, $Res Function(_$PendingImpl) then) =
      __$$PendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PendingImplCopyWithImpl<$Res>
    extends _$LookupStatusCopyWithImpl<$Res, _$PendingImpl>
    implements _$$PendingImplCopyWith<$Res> {
  __$$PendingImplCopyWithImpl(
      _$PendingImpl _value, $Res Function(_$PendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of LookupStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$PendingImpl extends Pending {
  const _$PendingImpl({final String? $type})
      : $type = $type ?? 'pending',
        super._();

  factory _$PendingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PendingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LookupStatus.pending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PendingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() found,
    required TResult Function() notFound,
    required TResult Function() error,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? found,
    TResult? Function()? notFound,
    TResult? Function()? error,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? found,
    TResult Function()? notFound,
    TResult Function()? error,
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
    required TResult Function(Pending value) pending,
    required TResult Function(Found value) found,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Error value) error,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Found value)? found,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Error value)? error,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Found value)? found,
    TResult Function(NotFound value)? notFound,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PendingImplToJson(
      this,
    );
  }
}

abstract class Pending extends LookupStatus {
  const factory Pending() = _$PendingImpl;
  const Pending._() : super._();

  factory Pending.fromJson(Map<String, dynamic> json) = _$PendingImpl.fromJson;
}

/// @nodoc
abstract class _$$FoundImplCopyWith<$Res> {
  factory _$$FoundImplCopyWith(
          _$FoundImpl value, $Res Function(_$FoundImpl) then) =
      __$$FoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FoundImplCopyWithImpl<$Res>
    extends _$LookupStatusCopyWithImpl<$Res, _$FoundImpl>
    implements _$$FoundImplCopyWith<$Res> {
  __$$FoundImplCopyWithImpl(
      _$FoundImpl _value, $Res Function(_$FoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of LookupStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$FoundImpl extends Found {
  const _$FoundImpl({final String? $type})
      : $type = $type ?? 'found',
        super._();

  factory _$FoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoundImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LookupStatus.found()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FoundImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() found,
    required TResult Function() notFound,
    required TResult Function() error,
  }) {
    return found();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? found,
    TResult? Function()? notFound,
    TResult? Function()? error,
  }) {
    return found?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? found,
    TResult Function()? notFound,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (found != null) {
      return found();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Found value) found,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Error value) error,
  }) {
    return found(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Found value)? found,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Error value)? error,
  }) {
    return found?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Found value)? found,
    TResult Function(NotFound value)? notFound,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (found != null) {
      return found(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FoundImplToJson(
      this,
    );
  }
}

abstract class Found extends LookupStatus {
  const factory Found() = _$FoundImpl;
  const Found._() : super._();

  factory Found.fromJson(Map<String, dynamic> json) = _$FoundImpl.fromJson;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$LookupStatusCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of LookupStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$NotFoundImpl extends NotFound {
  const _$NotFoundImpl({final String? $type})
      : $type = $type ?? 'notFound',
        super._();

  factory _$NotFoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotFoundImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LookupStatus.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotFoundImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() found,
    required TResult Function() notFound,
    required TResult Function() error,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? found,
    TResult? Function()? notFound,
    TResult? Function()? error,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? found,
    TResult Function()? notFound,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Found value) found,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Error value) error,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Found value)? found,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Error value)? error,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Found value)? found,
    TResult Function(NotFound value)? notFound,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NotFoundImplToJson(
      this,
    );
  }
}

abstract class NotFound extends LookupStatus {
  const factory NotFound() = _$NotFoundImpl;
  const NotFound._() : super._();

  factory NotFound.fromJson(Map<String, dynamic> json) =
      _$NotFoundImpl.fromJson;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LookupStatusCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LookupStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ErrorImpl extends Error {
  const _$ErrorImpl({final String? $type})
      : $type = $type ?? 'error',
        super._();

  factory _$ErrorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ErrorImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'LookupStatus.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() found,
    required TResult Function() notFound,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? found,
    TResult? Function()? notFound,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? found,
    TResult Function()? notFound,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Found value) found,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Found value)? found,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Found value)? found,
    TResult Function(NotFound value)? notFound,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorImplToJson(
      this,
    );
  }
}

abstract class Error extends LookupStatus {
  const factory Error() = _$ErrorImpl;
  const Error._() : super._();

  factory Error.fromJson(Map<String, dynamic> json) = _$ErrorImpl.fromJson;
}
