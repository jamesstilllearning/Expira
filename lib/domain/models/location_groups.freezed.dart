// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_groups.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LocationGroup {
  StorageLocation get location => throw _privateConstructorUsedError;
  List<FoodItem> get items => throw _privateConstructorUsedError;

  /// Create a copy of LocationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationGroupCopyWith<LocationGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationGroupCopyWith<$Res> {
  factory $LocationGroupCopyWith(
          LocationGroup value, $Res Function(LocationGroup) then) =
      _$LocationGroupCopyWithImpl<$Res, LocationGroup>;
  @useResult
  $Res call({StorageLocation location, List<FoodItem> items});

  $StorageLocationCopyWith<$Res> get location;
}

/// @nodoc
class _$LocationGroupCopyWithImpl<$Res, $Val extends LocationGroup>
    implements $LocationGroupCopyWith<$Res> {
  _$LocationGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as StorageLocation,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
    ) as $Val);
  }

  /// Create a copy of LocationGroup
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
abstract class _$$LocationGroupImplCopyWith<$Res>
    implements $LocationGroupCopyWith<$Res> {
  factory _$$LocationGroupImplCopyWith(
          _$LocationGroupImpl value, $Res Function(_$LocationGroupImpl) then) =
      __$$LocationGroupImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StorageLocation location, List<FoodItem> items});

  @override
  $StorageLocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$LocationGroupImplCopyWithImpl<$Res>
    extends _$LocationGroupCopyWithImpl<$Res, _$LocationGroupImpl>
    implements _$$LocationGroupImplCopyWith<$Res> {
  __$$LocationGroupImplCopyWithImpl(
      _$LocationGroupImpl _value, $Res Function(_$LocationGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? location = null,
    Object? items = null,
  }) {
    return _then(_$LocationGroupImpl(
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as StorageLocation,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<FoodItem>,
    ));
  }
}

/// @nodoc

class _$LocationGroupImpl extends _LocationGroup {
  const _$LocationGroupImpl(
      {required this.location, required final List<FoodItem> items})
      : _items = items,
        super._();

  @override
  final StorageLocation location;
  final List<FoodItem> _items;
  @override
  List<FoodItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'LocationGroup(location: $location, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationGroupImpl &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, location, const DeepCollectionEquality().hash(_items));

  /// Create a copy of LocationGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationGroupImplCopyWith<_$LocationGroupImpl> get copyWith =>
      __$$LocationGroupImplCopyWithImpl<_$LocationGroupImpl>(this, _$identity);
}

abstract class _LocationGroup extends LocationGroup {
  const factory _LocationGroup(
      {required final StorageLocation location,
      required final List<FoodItem> items}) = _$LocationGroupImpl;
  const _LocationGroup._() : super._();

  @override
  StorageLocation get location;
  @override
  List<FoodItem> get items;

  /// Create a copy of LocationGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationGroupImplCopyWith<_$LocationGroupImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
