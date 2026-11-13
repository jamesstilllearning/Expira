/// Household storage locations. Matches the locations in the ExPIRA design.
enum StorageLocation {
  fridge('Fridge'),
  freezer('Freezer'),
  pantry('Pantry'),
  bathroom('Bathroom'),
  beautyProducts('Beauty Products'),
  other('Other');

  const StorageLocation(this.label);

  final String label;

  /// Parses a stored key. Returns null for missing or unknown keys so older
  /// or corrupted entries load as "no location" instead of failing.
  static StorageLocation? fromKey(String? key) {
    for (final location in values) {
      if (location.name == key) return location;
    }
    return null;
  }
}
