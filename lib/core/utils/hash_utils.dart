import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

/// Hash utilities for deterministic ID generation and data integrity.
class HashUtils {
  HashUtils._();

  /// Generates a deterministic ID from multiple string components.
  /// Uses SHA-256 and returns the first 16 characters of the hex string.
  static String generateDeterministicId(List<String> components) {
    final combined = components.join('|');
    final bytes = utf8.encode(combined);
    final digest = sha256.convert(bytes);
    return digest.toString().substring(0, 16);
  }

  /// Generates a deterministic ID for an inventory item.
  /// Uses barcode + name + expiry date for deduplication.
  static String generateItemId({
    required String? barcode,
    required String name,
    required DateTime expiryDate,
  }) {
    final components = [
      barcode ?? '',
      name.toLowerCase().trim(),
      expiryDate.toIso8601String().split('T').first, // Just the date part
    ];
    return generateDeterministicId(components);
  }

  /// Generates a deterministic ID for a consumption record.
  /// Uses itemId + usedOn date + usedBy user ID.
  static String generateConsumptionId({
    required String itemId,
    required DateTime usedOn,
    required String usedBy,
  }) {
    final components = [
      itemId,
      usedOn.toIso8601String().split('T').first,
      usedBy,
    ];
    return generateDeterministicId(components);
  }

  /// Computes FNV-1a hash (used for reminder IDs).
  static int fnv1aHash(String input) {
    const int fnvOffsetBasis = 0x811c9dc5;
    const int fnvPrime = 0x01000193;
    int hash = fnvOffsetBasis;
    final bytes = utf8.encode(input);
    for (final byte in bytes) {
      hash ^= byte;
      hash = (hash * fnvPrime) & 0xFFFFFFFF;
    }
    return hash;
  }

  /// Computes FNV-1a hash for multiple components.
  static int fnv1aHashComponents(List<String> components) {
    return fnv1aHash(components.join('|'));
  }

  /// Generates a content hash for a map (used for change detection).
  static String contentHash(Map<String, dynamic> data) {
    // Sort keys for consistent ordering
    final sortedKeys = data.keys.toList()..sort();
    final buffer = StringBuffer();
    for (final key in sortedKeys) {
      buffer.write('$key:${data[key]}|');
    }
    final bytes = utf8.encode(buffer.toString());
    final digest = sha256.convert(bytes);
    return digest.toString().substring(0, 16);
  }

  /// Generates a short unique ID (8 characters) for temporary use.
  static String shortId() {
    final bytes = Uint8List(8);
    // Use current time + random for uniqueness
    final timeBytes = ByteData(8)..setInt64(0, DateTime.now().microsecondsSinceEpoch);
    bytes.setAll(0, timeBytes.buffer.asUint8List());
    final digest = sha256.convert(bytes);
    return digest.toString().substring(0, 8);
  }
}