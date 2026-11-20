// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'storage_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StorageLocation _$StorageLocationFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'fridge':
      return Fridge.fromJson(json);
    case 'freezer':
      return Freezer.fromJson(json);
    case 'pantry':
      return Pantry.fromJson(json);
    case 'bathroom':
      return Bathroom.fromJson(json);
    case 'beautyProducts':
      return BeautyProducts.fromJson(json);
    case 'other':
      return Other.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'StorageLocation',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$StorageLocation {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fridge,
    required TResult Function() freezer,
    required TResult Function() pantry,
    required TResult Function() bathroom,
    required TResult Function() beautyProducts,
    required TResult Function() other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fridge,
    TResult? Function()? freezer,
    TResult? Function()? pantry,
    TResult? Function()? bathroom,
    TResult? Function()? beautyProducts,
    TResult? Function()? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fridge,
    TResult Function()? freezer,
    TResult Function()? pantry,
    TResult Function()? bathroom,
    TResult Function()? beautyProducts,
    TResult Function()? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fridge value) fridge,
    required TResult Function(Freezer value) freezer,
    required TResult Function(Pantry value) pantry,
    required TResult Function(Bathroom value) bathroom,
    required TResult Function(BeautyProducts value) beautyProducts,
    required TResult Function(Other value) other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Fridge value)? fridge,
    TResult? Function(Freezer value)? freezer,
    TResult? Function(Pantry value)? pantry,
    TResult? Function(Bathroom value)? bathroom,
    TResult? Function(BeautyProducts value)? beautyProducts,
    TResult? Function(Other value)? other,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fridge value)? fridge,
    TResult Function(Freezer value)? freezer,
    TResult Function(Pantry value)? pantry,
    TResult Function(Bathroom value)? bathroom,
    TResult Function(BeautyProducts value)? beautyProducts,
    TResult Function(Other value)? other,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this StorageLocation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StorageLocationCopyWith<$Res> {
  factory $StorageLocationCopyWith(
          StorageLocation value, $Res Function(StorageLocation) then) =
      _$StorageLocationCopyWithImpl<$Res, StorageLocation>;
}

/// @nodoc
class _$StorageLocationCopyWithImpl<$Res, $Val extends StorageLocation>
    implements $StorageLocationCopyWith<$Res> {
  _$StorageLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FridgeImplCopyWith<$Res> {
  factory _$$FridgeImplCopyWith(
          _$FridgeImpl value, $Res Function(_$FridgeImpl) then) =
      __$$FridgeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FridgeImplCopyWithImpl<$Res>
    extends _$StorageLocationCopyWithImpl<$Res, _$FridgeImpl>
    implements _$$FridgeImplCopyWith<$Res> {
  __$$FridgeImplCopyWithImpl(
      _$FridgeImpl _value, $Res Function(_$FridgeImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$FridgeImpl extends Fridge {
  const _$FridgeImpl({final String? $type})
      : $type = $type ?? 'fridge',
        super._();

  factory _$FridgeImpl.fromJson(Map<String, dynamic> json) =>
      _$$FridgeImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StorageLocation.fridge()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FridgeImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fridge,
    required TResult Function() freezer,
    required TResult Function() pantry,
    required TResult Function() bathroom,
    required TResult Function() beautyProducts,
    required TResult Function() other,
  }) {
    return fridge();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fridge,
    TResult? Function()? freezer,
    TResult? Function()? pantry,
    TResult? Function()? bathroom,
    TResult? Function()? beautyProducts,
    TResult? Function()? other,
  }) {
    return fridge?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fridge,
    TResult Function()? freezer,
    TResult Function()? pantry,
    TResult Function()? bathroom,
    TResult Function()? beautyProducts,
    TResult Function()? other,
    required TResult orElse(),
  }) {
    if (fridge != null) {
      return fridge();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fridge value) fridge,
    required TResult Function(Freezer value) freezer,
    required TResult Function(Pantry value) pantry,
    required TResult Function(Bathroom value) bathroom,
    required TResult Function(BeautyProducts value) beautyProducts,
    required TResult Function(Other value) other,
  }) {
    return fridge(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Fridge value)? fridge,
    TResult? Function(Freezer value)? freezer,
    TResult? Function(Pantry value)? pantry,
    TResult? Function(Bathroom value)? bathroom,
    TResult? Function(BeautyProducts value)? beautyProducts,
    TResult? Function(Other value)? other,
  }) {
    return fridge?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fridge value)? fridge,
    TResult Function(Freezer value)? freezer,
    TResult Function(Pantry value)? pantry,
    TResult Function(Bathroom value)? bathroom,
    TResult Function(BeautyProducts value)? beautyProducts,
    TResult Function(Other value)? other,
    required TResult orElse(),
  }) {
    if (fridge != null) {
      return fridge(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FridgeImplToJson(
      this,
    );
  }
}

abstract class Fridge extends StorageLocation {
  const factory Fridge() = _$FridgeImpl;
  const Fridge._() : super._();

  factory Fridge.fromJson(Map<String, dynamic> json) = _$FridgeImpl.fromJson;
}

/// @nodoc
abstract class _$$FreezerImplCopyWith<$Res> {
  factory _$$FreezerImplCopyWith(
          _$FreezerImpl value, $Res Function(_$FreezerImpl) then) =
      __$$FreezerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FreezerImplCopyWithImpl<$Res>
    extends _$StorageLocationCopyWithImpl<$Res, _$FreezerImpl>
    implements _$$FreezerImplCopyWith<$Res> {
  __$$FreezerImplCopyWithImpl(
      _$FreezerImpl _value, $Res Function(_$FreezerImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$FreezerImpl extends Freezer {
  const _$FreezerImpl({final String? $type})
      : $type = $type ?? 'freezer',
        super._();

  factory _$FreezerImpl.fromJson(Map<String, dynamic> json) =>
      _$$FreezerImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StorageLocation.freezer()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FreezerImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fridge,
    required TResult Function() freezer,
    required TResult Function() pantry,
    required TResult Function() bathroom,
    required TResult Function() beautyProducts,
    required TResult Function() other,
  }) {
    return freezer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fridge,
    TResult? Function()? freezer,
    TResult? Function()? pantry,
    TResult? Function()? bathroom,
    TResult? Function()? beautyProducts,
    TResult? Function()? other,
  }) {
    return freezer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fridge,
    TResult Function()? freezer,
    TResult Function()? pantry,
    TResult Function()? bathroom,
    TResult Function()? beautyProducts,
    TResult Function()? other,
    required TResult orElse(),
  }) {
    if (freezer != null) {
      return freezer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fridge value) fridge,
    required TResult Function(Freezer value) freezer,
    required TResult Function(Pantry value) pantry,
    required TResult Function(Bathroom value) bathroom,
    required TResult Function(BeautyProducts value) beautyProducts,
    required TResult Function(Other value) other,
  }) {
    return freezer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Fridge value)? fridge,
    TResult? Function(Freezer value)? freezer,
    TResult? Function(Pantry value)? pantry,
    TResult? Function(Bathroom value)? bathroom,
    TResult? Function(BeautyProducts value)? beautyProducts,
    TResult? Function(Other value)? other,
  }) {
    return freezer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fridge value)? fridge,
    TResult Function(Freezer value)? freezer,
    TResult Function(Pantry value)? pantry,
    TResult Function(Bathroom value)? bathroom,
    TResult Function(BeautyProducts value)? beautyProducts,
    TResult Function(Other value)? other,
    required TResult orElse(),
  }) {
    if (freezer != null) {
      return freezer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FreezerImplToJson(
      this,
    );
  }
}

abstract class Freezer extends StorageLocation {
  const factory Freezer() = _$FreezerImpl;
  const Freezer._() : super._();

  factory Freezer.fromJson(Map<String, dynamic> json) = _$FreezerImpl.fromJson;
}

/// @nodoc
abstract class _$$PantryImplCopyWith<$Res> {
  factory _$$PantryImplCopyWith(
          _$PantryImpl value, $Res Function(_$PantryImpl) then) =
      __$$PantryImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PantryImplCopyWithImpl<$Res>
    extends _$StorageLocationCopyWithImpl<$Res, _$PantryImpl>
    implements _$$PantryImplCopyWith<$Res> {
  __$$PantryImplCopyWithImpl(
      _$PantryImpl _value, $Res Function(_$PantryImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$PantryImpl extends Pantry {
  const _$PantryImpl({final String? $type})
      : $type = $type ?? 'pantry',
        super._();

  factory _$PantryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PantryImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StorageLocation.pantry()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PantryImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fridge,
    required TResult Function() freezer,
    required TResult Function() pantry,
    required TResult Function() bathroom,
    required TResult Function() beautyProducts,
    required TResult Function() other,
  }) {
    return pantry();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fridge,
    TResult? Function()? freezer,
    TResult? Function()? pantry,
    TResult? Function()? bathroom,
    TResult? Function()? beautyProducts,
    TResult? Function()? other,
  }) {
    return pantry?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fridge,
    TResult Function()? freezer,
    TResult Function()? pantry,
    TResult Function()? bathroom,
    TResult Function()? beautyProducts,
    TResult Function()? other,
    required TResult orElse(),
  }) {
    if (pantry != null) {
      return pantry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fridge value) fridge,
    required TResult Function(Freezer value) freezer,
    required TResult Function(Pantry value) pantry,
    required TResult Function(Bathroom value) bathroom,
    required TResult Function(BeautyProducts value) beautyProducts,
    required TResult Function(Other value) other,
  }) {
    return pantry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Fridge value)? fridge,
    TResult? Function(Freezer value)? freezer,
    TResult? Function(Pantry value)? pantry,
    TResult? Function(Bathroom value)? bathroom,
    TResult? Function(BeautyProducts value)? beautyProducts,
    TResult? Function(Other value)? other,
  }) {
    return pantry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fridge value)? fridge,
    TResult Function(Freezer value)? freezer,
    TResult Function(Pantry value)? pantry,
    TResult Function(Bathroom value)? bathroom,
    TResult Function(BeautyProducts value)? beautyProducts,
    TResult Function(Other value)? other,
    required TResult orElse(),
  }) {
    if (pantry != null) {
      return pantry(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$PantryImplToJson(
      this,
    );
  }
}

abstract class Pantry extends StorageLocation {
  const factory Pantry() = _$PantryImpl;
  const Pantry._() : super._();

  factory Pantry.fromJson(Map<String, dynamic> json) = _$PantryImpl.fromJson;
}

/// @nodoc
abstract class _$$BathroomImplCopyWith<$Res> {
  factory _$$BathroomImplCopyWith(
          _$BathroomImpl value, $Res Function(_$BathroomImpl) then) =
      __$$BathroomImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BathroomImplCopyWithImpl<$Res>
    extends _$StorageLocationCopyWithImpl<$Res, _$BathroomImpl>
    implements _$$BathroomImplCopyWith<$Res> {
  __$$BathroomImplCopyWithImpl(
      _$BathroomImpl _value, $Res Function(_$BathroomImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$BathroomImpl extends Bathroom {
  const _$BathroomImpl({final String? $type})
      : $type = $type ?? 'bathroom',
        super._();

  factory _$BathroomImpl.fromJson(Map<String, dynamic> json) =>
      _$$BathroomImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StorageLocation.bathroom()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BathroomImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fridge,
    required TResult Function() freezer,
    required TResult Function() pantry,
    required TResult Function() bathroom,
    required TResult Function() beautyProducts,
    required TResult Function() other,
  }) {
    return bathroom();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fridge,
    TResult? Function()? freezer,
    TResult? Function()? pantry,
    TResult? Function()? bathroom,
    TResult? Function()? beautyProducts,
    TResult? Function()? other,
  }) {
    return bathroom?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fridge,
    TResult Function()? freezer,
    TResult Function()? pantry,
    TResult Function()? bathroom,
    TResult Function()? beautyProducts,
    TResult Function()? other,
    required TResult orElse(),
  }) {
    if (bathroom != null) {
      return bathroom();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fridge value) fridge,
    required TResult Function(Freezer value) freezer,
    required TResult Function(Pantry value) pantry,
    required TResult Function(Bathroom value) bathroom,
    required TResult Function(BeautyProducts value) beautyProducts,
    required TResult Function(Other value) other,
  }) {
    return bathroom(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Fridge value)? fridge,
    TResult? Function(Freezer value)? freezer,
    TResult? Function(Pantry value)? pantry,
    TResult? Function(Bathroom value)? bathroom,
    TResult? Function(BeautyProducts value)? beautyProducts,
    TResult? Function(Other value)? other,
  }) {
    return bathroom?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fridge value)? fridge,
    TResult Function(Freezer value)? freezer,
    TResult Function(Pantry value)? pantry,
    TResult Function(Bathroom value)? bathroom,
    TResult Function(BeautyProducts value)? beautyProducts,
    TResult Function(Other value)? other,
    required TResult orElse(),
  }) {
    if (bathroom != null) {
      return bathroom(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BathroomImplToJson(
      this,
    );
  }
}

abstract class Bathroom extends StorageLocation {
  const factory Bathroom() = _$BathroomImpl;
  const Bathroom._() : super._();

  factory Bathroom.fromJson(Map<String, dynamic> json) =
      _$BathroomImpl.fromJson;
}

/// @nodoc
abstract class _$$BeautyProductsImplCopyWith<$Res> {
  factory _$$BeautyProductsImplCopyWith(_$BeautyProductsImpl value,
          $Res Function(_$BeautyProductsImpl) then) =
      __$$BeautyProductsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BeautyProductsImplCopyWithImpl<$Res>
    extends _$StorageLocationCopyWithImpl<$Res, _$BeautyProductsImpl>
    implements _$$BeautyProductsImplCopyWith<$Res> {
  __$$BeautyProductsImplCopyWithImpl(
      _$BeautyProductsImpl _value, $Res Function(_$BeautyProductsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$BeautyProductsImpl extends BeautyProducts {
  const _$BeautyProductsImpl({final String? $type})
      : $type = $type ?? 'beautyProducts',
        super._();

  factory _$BeautyProductsImpl.fromJson(Map<String, dynamic> json) =>
      _$$BeautyProductsImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StorageLocation.beautyProducts()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BeautyProductsImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fridge,
    required TResult Function() freezer,
    required TResult Function() pantry,
    required TResult Function() bathroom,
    required TResult Function() beautyProducts,
    required TResult Function() other,
  }) {
    return beautyProducts();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fridge,
    TResult? Function()? freezer,
    TResult? Function()? pantry,
    TResult? Function()? bathroom,
    TResult? Function()? beautyProducts,
    TResult? Function()? other,
  }) {
    return beautyProducts?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fridge,
    TResult Function()? freezer,
    TResult Function()? pantry,
    TResult Function()? bathroom,
    TResult Function()? beautyProducts,
    TResult Function()? other,
    required TResult orElse(),
  }) {
    if (beautyProducts != null) {
      return beautyProducts();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fridge value) fridge,
    required TResult Function(Freezer value) freezer,
    required TResult Function(Pantry value) pantry,
    required TResult Function(Bathroom value) bathroom,
    required TResult Function(BeautyProducts value) beautyProducts,
    required TResult Function(Other value) other,
  }) {
    return beautyProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Fridge value)? fridge,
    TResult? Function(Freezer value)? freezer,
    TResult? Function(Pantry value)? pantry,
    TResult? Function(Bathroom value)? bathroom,
    TResult? Function(BeautyProducts value)? beautyProducts,
    TResult? Function(Other value)? other,
  }) {
    return beautyProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fridge value)? fridge,
    TResult Function(Freezer value)? freezer,
    TResult Function(Pantry value)? pantry,
    TResult Function(Bathroom value)? bathroom,
    TResult Function(BeautyProducts value)? beautyProducts,
    TResult Function(Other value)? other,
    required TResult orElse(),
  }) {
    if (beautyProducts != null) {
      return beautyProducts(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BeautyProductsImplToJson(
      this,
    );
  }
}

abstract class BeautyProducts extends StorageLocation {
  const factory BeautyProducts() = _$BeautyProductsImpl;
  const BeautyProducts._() : super._();

  factory BeautyProducts.fromJson(Map<String, dynamic> json) =
      _$BeautyProductsImpl.fromJson;
}

/// @nodoc
abstract class _$$OtherImplCopyWith<$Res> {
  factory _$$OtherImplCopyWith(
          _$OtherImpl value, $Res Function(_$OtherImpl) then) =
      __$$OtherImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OtherImplCopyWithImpl<$Res>
    extends _$StorageLocationCopyWithImpl<$Res, _$OtherImpl>
    implements _$$OtherImplCopyWith<$Res> {
  __$$OtherImplCopyWithImpl(
      _$OtherImpl _value, $Res Function(_$OtherImpl) _then)
      : super(_value, _then);

  /// Create a copy of StorageLocation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$OtherImpl extends Other {
  const _$OtherImpl({final String? $type})
      : $type = $type ?? 'other',
        super._();

  factory _$OtherImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtherImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'StorageLocation.other()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OtherImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fridge,
    required TResult Function() freezer,
    required TResult Function() pantry,
    required TResult Function() bathroom,
    required TResult Function() beautyProducts,
    required TResult Function() other,
  }) {
    return other();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fridge,
    TResult? Function()? freezer,
    TResult? Function()? pantry,
    TResult? Function()? bathroom,
    TResult? Function()? beautyProducts,
    TResult? Function()? other,
  }) {
    return other?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fridge,
    TResult Function()? freezer,
    TResult Function()? pantry,
    TResult Function()? bathroom,
    TResult Function()? beautyProducts,
    TResult Function()? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Fridge value) fridge,
    required TResult Function(Freezer value) freezer,
    required TResult Function(Pantry value) pantry,
    required TResult Function(Bathroom value) bathroom,
    required TResult Function(BeautyProducts value) beautyProducts,
    required TResult Function(Other value) other,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Fridge value)? fridge,
    TResult? Function(Freezer value)? freezer,
    TResult? Function(Pantry value)? pantry,
    TResult? Function(Bathroom value)? bathroom,
    TResult? Function(BeautyProducts value)? beautyProducts,
    TResult? Function(Other value)? other,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Fridge value)? fridge,
    TResult Function(Freezer value)? freezer,
    TResult Function(Pantry value)? pantry,
    TResult Function(Bathroom value)? bathroom,
    TResult Function(BeautyProducts value)? beautyProducts,
    TResult Function(Other value)? other,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$OtherImplToJson(
      this,
    );
  }
}

abstract class Other extends StorageLocation {
  const factory Other() = _$OtherImpl;
  const Other._() : super._();

  factory Other.fromJson(Map<String, dynamic> json) = _$OtherImpl.fromJson;
}
