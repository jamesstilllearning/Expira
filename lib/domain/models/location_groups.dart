import 'package:freezed_annotation/freezed_annotation.dart';

import 'food_item.dart';
import 'storage_location.dart';

part 'location_groups.freezed.dart';

/// Domain model for a group of items by storage location.
@freezed
sealed class LocationGroup with _$LocationGroup {
  const LocationGroup._();

  const factory LocationGroup({
    required StorageLocation location,
    required List<FoodItem> items,
  }) = _LocationGroup;

  String get title => location.label;

  /// Groups items by storage location. Groups follow [StorageLocation] order.
  /// Items keep the order they arrived in, so callers can sort first and the
  /// sort is preserved inside each group.
  static List<LocationGroup> groupByLocation(Iterable<FoodItem> items) {
    final buckets = <StorageLocation, List<FoodItem>>{};
    for (final item in items) {
      buckets.putIfAbsent(item.location, () => []).add(item);
    }

    int rank(StorageLocation location) => StorageLocation.all.indexOf(location);

    final keys = buckets.keys.toList()
      ..sort((a, b) => rank(a).compareTo(rank(b)));
    return [
      for (final key in keys) LocationGroup(location: key, items: List.unmodifiable(buckets[key]!))
    ];
  }
}