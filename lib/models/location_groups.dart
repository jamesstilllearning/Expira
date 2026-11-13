import 'package:flutter/foundation.dart';

import 'food_item.dart';
import 'storage_location.dart';

@immutable
class LocationGroup {
  const LocationGroup(this.location, this.items);

  /// Null for items with no location assigned.
  final StorageLocation? location;
  final List<FoodItem> items;

  String get title => location?.label ?? 'No location';
}

/// Groups items by storage location. Groups follow [StorageLocation] order with
/// unassigned items last. Items keep the order they arrived in, so callers can
/// sort first and the sort is preserved inside each group.
List<LocationGroup> groupByLocation(Iterable<FoodItem> items) {
  final buckets = <StorageLocation?, List<FoodItem>>{};
  for (final item in items) {
    buckets.putIfAbsent(item.location, () => []).add(item);
  }

  int rank(StorageLocation? location) =>
      location?.index ?? StorageLocation.values.length;

  final keys = buckets.keys.toList()
    ..sort((a, b) => rank(a).compareTo(rank(b)));
  return [
    for (final key in keys) LocationGroup(key, List.unmodifiable(buckets[key]!))
  ];
}
