import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'storage_location.freezed.dart';
part 'storage_location.g.dart';

/// Storage location for food items.
@freezed
abstract class StorageLocation with _$StorageLocation {
  const StorageLocation._();

  const factory StorageLocation.fridge() = Fridge;
  const factory StorageLocation.freezer() = Freezer;
  const factory StorageLocation.pantry() = Pantry;
  const factory StorageLocation.bathroom() = Bathroom;
  const factory StorageLocation.beautyProducts() = BeautyProducts;
  const factory StorageLocation.other() = Other;

  factory StorageLocation.fromJson(Map<String, dynamic> json) => _$StorageLocationFromJson(json);

  /// Returns the display label for this location.
  String get label => switch (this) {
        Fridge() => 'Fridge',
        Freezer() => 'Freezer',
        Pantry() => 'Pantry',
        Bathroom() => 'Bathroom',
        BeautyProducts() => 'Beauty Products',
        Other() => 'Other',
        _ => 'Other',
      };

  /// Returns the icon for this location.
  int get iconCodePoint => switch (this) {
        Fridge() => 0xe3c5, // Icons.kitchen_outlined
        Freezer() => 0xe0b3, // Icons.ac_unit
        Pantry() => 0xe995, // Icons.shelves
        Bathroom() => 0xe333, // Icons.bathtub_outlined
        BeautyProducts() => 0xe9d3, // Icons.spa_outlined
        Other() => 0xe3d2, // Icons.inventory_2_outlined
        _ => 0xe3d2,
      };

  /// Returns all available storage locations.
  static List<StorageLocation> get all => [
        const Fridge(),
        const Freezer(),
        const Pantry(),
        const Bathroom(),
        const BeautyProducts(),
        const Other(),
      ];

  /// Parses a storage location from a string key.
  static StorageLocation fromKey(String key) {
    return switch (key.toLowerCase()) {
      'fridge' => const Fridge(),
      'freezer' => const Freezer(),
      'pantry' => const Pantry(),
      'bathroom' => const Bathroom(),
      'beautyproducts' => const BeautyProducts(),
      'beauty_products' => const BeautyProducts(),
      _ => const Other(),
    };
  }

  /// Returns the string key for this location.
  String get key => switch (this) {
        Fridge() => 'fridge',
        Freezer() => 'freezer',
        Pantry() => 'pantry',
        Bathroom() => 'bathroom',
        BeautyProducts() => 'beautyProducts',
        Other() => 'other',
        _ => 'other',
      };
}