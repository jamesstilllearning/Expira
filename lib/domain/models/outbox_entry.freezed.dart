// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outbox_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OutboxOperation _$OutboxOperationFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'create':
      return Create.fromJson(json);
    case 'update':
      return Update.fromJson(json);
    case 'delete':
      return Delete.fromJson(json);
    case 'markUsed':
      return MarkUsed.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OutboxOperation',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OutboxOperation {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() update,
    required TResult Function() delete,
    required TResult Function() markUsed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? update,
    TResult? Function()? delete,
    TResult? Function()? markUsed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? update,
    TResult Function()? delete,
    TResult Function()? markUsed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(MarkUsed value) markUsed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(MarkUsed value)? markUsed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(MarkUsed value)? markUsed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this OutboxOperation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutboxOperationCopyWith<$Res> {
  factory $OutboxOperationCopyWith(
          OutboxOperation value, $Res Function(OutboxOperation) then) =
      _$OutboxOperationCopyWithImpl<$Res, OutboxOperation>;
}

/// @nodoc
class _$OutboxOperationCopyWithImpl<$Res, $Val extends OutboxOperation>
    implements $OutboxOperationCopyWith<$Res> {
  _$OutboxOperationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutboxOperation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$OutboxOperationCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxOperation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$CreateImpl extends Create {
  const _$CreateImpl({final String? $type})
      : $type = $type ?? 'create',
        super._();

  factory _$CreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OutboxOperation.create()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() update,
    required TResult Function() delete,
    required TResult Function() markUsed,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? update,
    TResult? Function()? delete,
    TResult? Function()? markUsed,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? update,
    TResult Function()? delete,
    TResult Function()? markUsed,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(MarkUsed value) markUsed,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(MarkUsed value)? markUsed,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(MarkUsed value)? markUsed,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateImplToJson(
      this,
    );
  }
}

abstract class Create extends OutboxOperation {
  const factory Create() = _$CreateImpl;
  const Create._() : super._();

  factory Create.fromJson(Map<String, dynamic> json) = _$CreateImpl.fromJson;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$OutboxOperationCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxOperation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$UpdateImpl extends Update {
  const _$UpdateImpl({final String? $type})
      : $type = $type ?? 'update',
        super._();

  factory _$UpdateImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OutboxOperation.update()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$UpdateImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() update,
    required TResult Function() delete,
    required TResult Function() markUsed,
  }) {
    return update();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? update,
    TResult? Function()? delete,
    TResult? Function()? markUsed,
  }) {
    return update?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? update,
    TResult Function()? delete,
    TResult Function()? markUsed,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(MarkUsed value) markUsed,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(MarkUsed value)? markUsed,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(MarkUsed value)? markUsed,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateImplToJson(
      this,
    );
  }
}

abstract class Update extends OutboxOperation {
  const factory Update() = _$UpdateImpl;
  const Update._() : super._();

  factory Update.fromJson(Map<String, dynamic> json) = _$UpdateImpl.fromJson;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$OutboxOperationCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxOperation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$DeleteImpl extends Delete {
  const _$DeleteImpl({final String? $type})
      : $type = $type ?? 'delete',
        super._();

  factory _$DeleteImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OutboxOperation.delete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() update,
    required TResult Function() delete,
    required TResult Function() markUsed,
  }) {
    return delete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? update,
    TResult? Function()? delete,
    TResult? Function()? markUsed,
  }) {
    return delete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? update,
    TResult Function()? delete,
    TResult Function()? markUsed,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(MarkUsed value) markUsed,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(MarkUsed value)? markUsed,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(MarkUsed value)? markUsed,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteImplToJson(
      this,
    );
  }
}

abstract class Delete extends OutboxOperation {
  const factory Delete() = _$DeleteImpl;
  const Delete._() : super._();

  factory Delete.fromJson(Map<String, dynamic> json) = _$DeleteImpl.fromJson;
}

/// @nodoc
abstract class _$$MarkUsedImplCopyWith<$Res> {
  factory _$$MarkUsedImplCopyWith(
          _$MarkUsedImpl value, $Res Function(_$MarkUsedImpl) then) =
      __$$MarkUsedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MarkUsedImplCopyWithImpl<$Res>
    extends _$OutboxOperationCopyWithImpl<$Res, _$MarkUsedImpl>
    implements _$$MarkUsedImplCopyWith<$Res> {
  __$$MarkUsedImplCopyWithImpl(
      _$MarkUsedImpl _value, $Res Function(_$MarkUsedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxOperation
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$MarkUsedImpl extends MarkUsed {
  const _$MarkUsedImpl({final String? $type})
      : $type = $type ?? 'markUsed',
        super._();

  factory _$MarkUsedImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkUsedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OutboxOperation.markUsed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MarkUsedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function() update,
    required TResult Function() delete,
    required TResult Function() markUsed,
  }) {
    return markUsed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function()? update,
    TResult? Function()? delete,
    TResult? Function()? markUsed,
  }) {
    return markUsed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function()? update,
    TResult Function()? delete,
    TResult Function()? markUsed,
    required TResult orElse(),
  }) {
    if (markUsed != null) {
      return markUsed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Create value) create,
    required TResult Function(Update value) update,
    required TResult Function(Delete value) delete,
    required TResult Function(MarkUsed value) markUsed,
  }) {
    return markUsed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Create value)? create,
    TResult? Function(Update value)? update,
    TResult? Function(Delete value)? delete,
    TResult? Function(MarkUsed value)? markUsed,
  }) {
    return markUsed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Create value)? create,
    TResult Function(Update value)? update,
    TResult Function(Delete value)? delete,
    TResult Function(MarkUsed value)? markUsed,
    required TResult orElse(),
  }) {
    if (markUsed != null) {
      return markUsed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkUsedImplToJson(
      this,
    );
  }
}

abstract class MarkUsed extends OutboxOperation {
  const factory MarkUsed() = _$MarkUsedImpl;
  const MarkUsed._() : super._();

  factory MarkUsed.fromJson(Map<String, dynamic> json) =
      _$MarkUsedImpl.fromJson;
}

OutboxEntityType _$OutboxEntityTypeFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'item':
      return Item.fromJson(json);
    case 'consumption':
      return Consumption.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OutboxEntityType',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OutboxEntityType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() item,
    required TResult Function() consumption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? item,
    TResult? Function()? consumption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? item,
    TResult Function()? consumption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Item value) item,
    required TResult Function(Consumption value) consumption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Item value)? item,
    TResult? Function(Consumption value)? consumption,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Item value)? item,
    TResult Function(Consumption value)? consumption,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this OutboxEntityType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutboxEntityTypeCopyWith<$Res> {
  factory $OutboxEntityTypeCopyWith(
          OutboxEntityType value, $Res Function(OutboxEntityType) then) =
      _$OutboxEntityTypeCopyWithImpl<$Res, OutboxEntityType>;
}

/// @nodoc
class _$OutboxEntityTypeCopyWithImpl<$Res, $Val extends OutboxEntityType>
    implements $OutboxEntityTypeCopyWith<$Res> {
  _$OutboxEntityTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutboxEntityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ItemImplCopyWith<$Res> {
  factory _$$ItemImplCopyWith(
          _$ItemImpl value, $Res Function(_$ItemImpl) then) =
      __$$ItemImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemImplCopyWithImpl<$Res>
    extends _$OutboxEntityTypeCopyWithImpl<$Res, _$ItemImpl>
    implements _$$ItemImplCopyWith<$Res> {
  __$$ItemImplCopyWithImpl(_$ItemImpl _value, $Res Function(_$ItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxEntityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ItemImpl extends Item {
  const _$ItemImpl({final String? $type})
      : $type = $type ?? 'item',
        super._();

  factory _$ItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OutboxEntityType.item()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ItemImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() item,
    required TResult Function() consumption,
  }) {
    return item();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? item,
    TResult? Function()? consumption,
  }) {
    return item?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? item,
    TResult Function()? consumption,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Item value) item,
    required TResult Function(Consumption value) consumption,
  }) {
    return item(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Item value)? item,
    TResult? Function(Consumption value)? consumption,
  }) {
    return item?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Item value)? item,
    TResult Function(Consumption value)? consumption,
    required TResult orElse(),
  }) {
    if (item != null) {
      return item(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemImplToJson(
      this,
    );
  }
}

abstract class Item extends OutboxEntityType {
  const factory Item() = _$ItemImpl;
  const Item._() : super._();

  factory Item.fromJson(Map<String, dynamic> json) = _$ItemImpl.fromJson;
}

/// @nodoc
abstract class _$$ConsumptionImplCopyWith<$Res> {
  factory _$$ConsumptionImplCopyWith(
          _$ConsumptionImpl value, $Res Function(_$ConsumptionImpl) then) =
      __$$ConsumptionImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConsumptionImplCopyWithImpl<$Res>
    extends _$OutboxEntityTypeCopyWithImpl<$Res, _$ConsumptionImpl>
    implements _$$ConsumptionImplCopyWith<$Res> {
  __$$ConsumptionImplCopyWithImpl(
      _$ConsumptionImpl _value, $Res Function(_$ConsumptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxEntityType
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ConsumptionImpl extends Consumption {
  const _$ConsumptionImpl({final String? $type})
      : $type = $type ?? 'consumption',
        super._();

  factory _$ConsumptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumptionImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OutboxEntityType.consumption()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConsumptionImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() item,
    required TResult Function() consumption,
  }) {
    return consumption();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? item,
    TResult? Function()? consumption,
  }) {
    return consumption?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? item,
    TResult Function()? consumption,
    required TResult orElse(),
  }) {
    if (consumption != null) {
      return consumption();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Item value) item,
    required TResult Function(Consumption value) consumption,
  }) {
    return consumption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Item value)? item,
    TResult? Function(Consumption value)? consumption,
  }) {
    return consumption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Item value)? item,
    TResult Function(Consumption value)? consumption,
    required TResult orElse(),
  }) {
    if (consumption != null) {
      return consumption(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumptionImplToJson(
      this,
    );
  }
}

abstract class Consumption extends OutboxEntityType {
  const factory Consumption() = _$ConsumptionImpl;
  const Consumption._() : super._();

  factory Consumption.fromJson(Map<String, dynamic> json) =
      _$ConsumptionImpl.fromJson;
}

OutboxStatus _$OutboxStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'pending':
      return Pending.fromJson(json);
    case 'processing':
      return Processing.fromJson(json);
    case 'synced':
      return Synced.fromJson(json);
    case 'failed':
      return Failed.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'OutboxStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$OutboxStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() synced,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? synced,
    TResult? Function()? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? synced,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Processing value) processing,
    required TResult Function(Synced value) synced,
    required TResult Function(Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Processing value)? processing,
    TResult? Function(Synced value)? synced,
    TResult? Function(Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Processing value)? processing,
    TResult Function(Synced value)? synced,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this OutboxStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutboxStatusCopyWith<$Res> {
  factory $OutboxStatusCopyWith(
          OutboxStatus value, $Res Function(OutboxStatus) then) =
      _$OutboxStatusCopyWithImpl<$Res, OutboxStatus>;
}

/// @nodoc
class _$OutboxStatusCopyWithImpl<$Res, $Val extends OutboxStatus>
    implements $OutboxStatusCopyWith<$Res> {
  _$OutboxStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutboxStatus
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
    extends _$OutboxStatusCopyWithImpl<$Res, _$PendingImpl>
    implements _$$PendingImplCopyWith<$Res> {
  __$$PendingImplCopyWithImpl(
      _$PendingImpl _value, $Res Function(_$PendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxStatus
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
    return 'OutboxStatus.pending()';
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
    required TResult Function() processing,
    required TResult Function() synced,
    required TResult Function() failed,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? synced,
    TResult? Function()? failed,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? synced,
    TResult Function()? failed,
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
    required TResult Function(Processing value) processing,
    required TResult Function(Synced value) synced,
    required TResult Function(Failed value) failed,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Processing value)? processing,
    TResult? Function(Synced value)? synced,
    TResult? Function(Failed value)? failed,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Processing value)? processing,
    TResult Function(Synced value)? synced,
    TResult Function(Failed value)? failed,
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

abstract class Pending extends OutboxStatus {
  const factory Pending() = _$PendingImpl;
  const Pending._() : super._();

  factory Pending.fromJson(Map<String, dynamic> json) = _$PendingImpl.fromJson;
}

/// @nodoc
abstract class _$$ProcessingImplCopyWith<$Res> {
  factory _$$ProcessingImplCopyWith(
          _$ProcessingImpl value, $Res Function(_$ProcessingImpl) then) =
      __$$ProcessingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProcessingImplCopyWithImpl<$Res>
    extends _$OutboxStatusCopyWithImpl<$Res, _$ProcessingImpl>
    implements _$$ProcessingImplCopyWith<$Res> {
  __$$ProcessingImplCopyWithImpl(
      _$ProcessingImpl _value, $Res Function(_$ProcessingImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ProcessingImpl extends Processing {
  const _$ProcessingImpl({final String? $type})
      : $type = $type ?? 'processing',
        super._();

  factory _$ProcessingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProcessingImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OutboxStatus.processing()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProcessingImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() synced,
    required TResult Function() failed,
  }) {
    return processing();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? synced,
    TResult? Function()? failed,
  }) {
    return processing?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? synced,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Processing value) processing,
    required TResult Function(Synced value) synced,
    required TResult Function(Failed value) failed,
  }) {
    return processing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Processing value)? processing,
    TResult? Function(Synced value)? synced,
    TResult? Function(Failed value)? failed,
  }) {
    return processing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Processing value)? processing,
    TResult Function(Synced value)? synced,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (processing != null) {
      return processing(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ProcessingImplToJson(
      this,
    );
  }
}

abstract class Processing extends OutboxStatus {
  const factory Processing() = _$ProcessingImpl;
  const Processing._() : super._();

  factory Processing.fromJson(Map<String, dynamic> json) =
      _$ProcessingImpl.fromJson;
}

/// @nodoc
abstract class _$$SyncedImplCopyWith<$Res> {
  factory _$$SyncedImplCopyWith(
          _$SyncedImpl value, $Res Function(_$SyncedImpl) then) =
      __$$SyncedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncedImplCopyWithImpl<$Res>
    extends _$OutboxStatusCopyWithImpl<$Res, _$SyncedImpl>
    implements _$$SyncedImplCopyWith<$Res> {
  __$$SyncedImplCopyWithImpl(
      _$SyncedImpl _value, $Res Function(_$SyncedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$SyncedImpl extends Synced {
  const _$SyncedImpl({final String? $type})
      : $type = $type ?? 'synced',
        super._();

  factory _$SyncedImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OutboxStatus.synced()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() synced,
    required TResult Function() failed,
  }) {
    return synced();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? synced,
    TResult? Function()? failed,
  }) {
    return synced?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? synced,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Processing value) processing,
    required TResult Function(Synced value) synced,
    required TResult Function(Failed value) failed,
  }) {
    return synced(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Processing value)? processing,
    TResult? Function(Synced value)? synced,
    TResult? Function(Failed value)? failed,
  }) {
    return synced?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Processing value)? processing,
    TResult Function(Synced value)? synced,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (synced != null) {
      return synced(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncedImplToJson(
      this,
    );
  }
}

abstract class Synced extends OutboxStatus {
  const factory Synced() = _$SyncedImpl;
  const Synced._() : super._();

  factory Synced.fromJson(Map<String, dynamic> json) = _$SyncedImpl.fromJson;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<$Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl value, $Res Function(_$FailedImpl) then) =
      __$$FailedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailedImplCopyWithImpl<$Res>
    extends _$OutboxStatusCopyWithImpl<$Res, _$FailedImpl>
    implements _$$FailedImplCopyWith<$Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl _value, $Res Function(_$FailedImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$FailedImpl extends Failed {
  const _$FailedImpl({final String? $type})
      : $type = $type ?? 'failed',
        super._();

  factory _$FailedImpl.fromJson(Map<String, dynamic> json) =>
      _$$FailedImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'OutboxStatus.failed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FailedImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function() processing,
    required TResult Function() synced,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function()? processing,
    TResult? Function()? synced,
    TResult? Function()? failed,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function()? processing,
    TResult Function()? synced,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Pending value) pending,
    required TResult Function(Processing value) processing,
    required TResult Function(Synced value) synced,
    required TResult Function(Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Pending value)? pending,
    TResult? Function(Processing value)? processing,
    TResult? Function(Synced value)? synced,
    TResult? Function(Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Pending value)? pending,
    TResult Function(Processing value)? processing,
    TResult Function(Synced value)? synced,
    TResult Function(Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FailedImplToJson(
      this,
    );
  }
}

abstract class Failed extends OutboxStatus {
  const factory Failed() = _$FailedImpl;
  const Failed._() : super._();

  factory Failed.fromJson(Map<String, dynamic> json) = _$FailedImpl.fromJson;
}

OutboxEntry _$OutboxEntryFromJson(Map<String, dynamic> json) {
  return _OutboxEntry.fromJson(json);
}

/// @nodoc
mixin _$OutboxEntry {
  /// Local database ID (auto-increment)
  int get id => throw _privateConstructorUsedError;

  /// Operation type
  OutboxOperation get operation => throw _privateConstructorUsedError;

  /// Entity type
  OutboxEntityType get entityType => throw _privateConstructorUsedError;

  /// Entity ID (item.id or consumption.record_id)
  String get entityId => throw _privateConstructorUsedError;

  /// Full entity payload as JSON at time of mutation
  String get payload => throw _privateConstructorUsedError;

  /// Expected version for optimistic locking
  int get expectedVersion => throw _privateConstructorUsedError;

  /// Creation timestamp (UTC)
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Retry count
  int get retryCount => throw _privateConstructorUsedError;

  /// Last error message (if failed)
  String get lastError => throw _privateConstructorUsedError;

  /// Current sync status
  OutboxStatus get status => throw _privateConstructorUsedError;

  /// Serializes this OutboxEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutboxEntryCopyWith<OutboxEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutboxEntryCopyWith<$Res> {
  factory $OutboxEntryCopyWith(
          OutboxEntry value, $Res Function(OutboxEntry) then) =
      _$OutboxEntryCopyWithImpl<$Res, OutboxEntry>;
  @useResult
  $Res call(
      {int id,
      OutboxOperation operation,
      OutboxEntityType entityType,
      String entityId,
      String payload,
      int expectedVersion,
      DateTime createdAt,
      int retryCount,
      String lastError,
      OutboxStatus status});

  $OutboxOperationCopyWith<$Res> get operation;
  $OutboxEntityTypeCopyWith<$Res> get entityType;
  $OutboxStatusCopyWith<$Res> get status;
}

/// @nodoc
class _$OutboxEntryCopyWithImpl<$Res, $Val extends OutboxEntry>
    implements $OutboxEntryCopyWith<$Res> {
  _$OutboxEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? operation = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? payload = null,
    Object? expectedVersion = null,
    Object? createdAt = null,
    Object? retryCount = null,
    Object? lastError = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as OutboxOperation,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as OutboxEntityType,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      expectedVersion: null == expectedVersion
          ? _value.expectedVersion
          : expectedVersion // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastError: null == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OutboxStatus,
    ) as $Val);
  }

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutboxOperationCopyWith<$Res> get operation {
    return $OutboxOperationCopyWith<$Res>(_value.operation, (value) {
      return _then(_value.copyWith(operation: value) as $Val);
    });
  }

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutboxEntityTypeCopyWith<$Res> get entityType {
    return $OutboxEntityTypeCopyWith<$Res>(_value.entityType, (value) {
      return _then(_value.copyWith(entityType: value) as $Val);
    });
  }

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutboxStatusCopyWith<$Res> get status {
    return $OutboxStatusCopyWith<$Res>(_value.status, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OutboxEntryImplCopyWith<$Res>
    implements $OutboxEntryCopyWith<$Res> {
  factory _$$OutboxEntryImplCopyWith(
          _$OutboxEntryImpl value, $Res Function(_$OutboxEntryImpl) then) =
      __$$OutboxEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      OutboxOperation operation,
      OutboxEntityType entityType,
      String entityId,
      String payload,
      int expectedVersion,
      DateTime createdAt,
      int retryCount,
      String lastError,
      OutboxStatus status});

  @override
  $OutboxOperationCopyWith<$Res> get operation;
  @override
  $OutboxEntityTypeCopyWith<$Res> get entityType;
  @override
  $OutboxStatusCopyWith<$Res> get status;
}

/// @nodoc
class __$$OutboxEntryImplCopyWithImpl<$Res>
    extends _$OutboxEntryCopyWithImpl<$Res, _$OutboxEntryImpl>
    implements _$$OutboxEntryImplCopyWith<$Res> {
  __$$OutboxEntryImplCopyWithImpl(
      _$OutboxEntryImpl _value, $Res Function(_$OutboxEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? operation = null,
    Object? entityType = null,
    Object? entityId = null,
    Object? payload = null,
    Object? expectedVersion = null,
    Object? createdAt = null,
    Object? retryCount = null,
    Object? lastError = null,
    Object? status = null,
  }) {
    return _then(_$OutboxEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      operation: null == operation
          ? _value.operation
          : operation // ignore: cast_nullable_to_non_nullable
              as OutboxOperation,
      entityType: null == entityType
          ? _value.entityType
          : entityType // ignore: cast_nullable_to_non_nullable
              as OutboxEntityType,
      entityId: null == entityId
          ? _value.entityId
          : entityId // ignore: cast_nullable_to_non_nullable
              as String,
      payload: null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
      expectedVersion: null == expectedVersion
          ? _value.expectedVersion
          : expectedVersion // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      retryCount: null == retryCount
          ? _value.retryCount
          : retryCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastError: null == lastError
          ? _value.lastError
          : lastError // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OutboxStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OutboxEntryImpl extends _OutboxEntry {
  const _$OutboxEntryImpl(
      {this.id = 0,
      required this.operation,
      required this.entityType,
      required this.entityId,
      required this.payload,
      this.expectedVersion = 1,
      required this.createdAt,
      this.retryCount = 0,
      this.lastError = '',
      this.status = const OutboxStatus.pending()})
      : super._();

  factory _$OutboxEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutboxEntryImplFromJson(json);

  /// Local database ID (auto-increment)
  @override
  @JsonKey()
  final int id;

  /// Operation type
  @override
  final OutboxOperation operation;

  /// Entity type
  @override
  final OutboxEntityType entityType;

  /// Entity ID (item.id or consumption.record_id)
  @override
  final String entityId;

  /// Full entity payload as JSON at time of mutation
  @override
  final String payload;

  /// Expected version for optimistic locking
  @override
  @JsonKey()
  final int expectedVersion;

  /// Creation timestamp (UTC)
  @override
  final DateTime createdAt;

  /// Retry count
  @override
  @JsonKey()
  final int retryCount;

  /// Last error message (if failed)
  @override
  @JsonKey()
  final String lastError;

  /// Current sync status
  @override
  @JsonKey()
  final OutboxStatus status;

  @override
  String toString() {
    return 'OutboxEntry(id: $id, operation: $operation, entityType: $entityType, entityId: $entityId, payload: $payload, expectedVersion: $expectedVersion, createdAt: $createdAt, retryCount: $retryCount, lastError: $lastError, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutboxEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.operation, operation) ||
                other.operation == operation) &&
            (identical(other.entityType, entityType) ||
                other.entityType == entityType) &&
            (identical(other.entityId, entityId) ||
                other.entityId == entityId) &&
            (identical(other.payload, payload) || other.payload == payload) &&
            (identical(other.expectedVersion, expectedVersion) ||
                other.expectedVersion == expectedVersion) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.retryCount, retryCount) ||
                other.retryCount == retryCount) &&
            (identical(other.lastError, lastError) ||
                other.lastError == lastError) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      operation,
      entityType,
      entityId,
      payload,
      expectedVersion,
      createdAt,
      retryCount,
      lastError,
      status);

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutboxEntryImplCopyWith<_$OutboxEntryImpl> get copyWith =>
      __$$OutboxEntryImplCopyWithImpl<_$OutboxEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutboxEntryImplToJson(
      this,
    );
  }
}

abstract class _OutboxEntry extends OutboxEntry {
  const factory _OutboxEntry(
      {final int id,
      required final OutboxOperation operation,
      required final OutboxEntityType entityType,
      required final String entityId,
      required final String payload,
      final int expectedVersion,
      required final DateTime createdAt,
      final int retryCount,
      final String lastError,
      final OutboxStatus status}) = _$OutboxEntryImpl;
  const _OutboxEntry._() : super._();

  factory _OutboxEntry.fromJson(Map<String, dynamic> json) =
      _$OutboxEntryImpl.fromJson;

  /// Local database ID (auto-increment)
  @override
  int get id;

  /// Operation type
  @override
  OutboxOperation get operation;

  /// Entity type
  @override
  OutboxEntityType get entityType;

  /// Entity ID (item.id or consumption.record_id)
  @override
  String get entityId;

  /// Full entity payload as JSON at time of mutation
  @override
  String get payload;

  /// Expected version for optimistic locking
  @override
  int get expectedVersion;

  /// Creation timestamp (UTC)
  @override
  DateTime get createdAt;

  /// Retry count
  @override
  int get retryCount;

  /// Last error message (if failed)
  @override
  String get lastError;

  /// Current sync status
  @override
  OutboxStatus get status;

  /// Create a copy of OutboxEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutboxEntryImplCopyWith<_$OutboxEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
