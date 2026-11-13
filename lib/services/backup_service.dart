import 'dart:convert';

import '../models/consumption_record.dart';
import '../models/food_item.dart';
import 'consumption_storage.dart';
import 'item_storage.dart';

/// A validated, versioned snapshot of the user's locally stored data.
class InventoryBackup {
  const InventoryBackup({required this.items, required this.records});

  final List<FoodItem> items;
  final List<ConsumptionRecord> records;
}

class BackupService {
  BackupService(
      {required ItemStorage items, required ConsumptionStorage records})
      : _items = items,
        _records = records;

  static const formatName = 'expira_backup';
  static const formatVersion = 1;

  final ItemStorage _items;
  final ConsumptionStorage _records;

  Future<String> createBackupJson() async {
    final items = await _items.load();
    final records = await _records.load();
    return const JsonEncoder.withIndent('  ').convert({
      'format': formatName,
      'version': formatVersion,
      'exportedAt': DateTime.now().toUtc().toIso8601String(),
      'items': items.map((item) => item.toJson()).toList(),
      'consumptionRecords': records.map((record) => record.toJson()).toList(),
    });
  }

  InventoryBackup decodeBackup(String contents) {
    final Object? decoded;
    try {
      decoded = jsonDecode(contents);
    } on FormatException {
      throw const FormatException('This file is not valid JSON.');
    }
    if (decoded is! Map<String, dynamic> ||
        decoded['format'] != formatName ||
        decoded['version'] != formatVersion) {
      throw const FormatException('This is not a supported ExPIRA backup.');
    }

    final rawItems = decoded['items'];
    final rawRecords = decoded['consumptionRecords'];
    if (rawItems is! List || rawRecords is! List) {
      throw const FormatException(
          'The backup is missing inventory or history.');
    }

    final items = <FoodItem>[];
    final ids = <String>{};
    for (final value in rawItems) {
      if (value is! Map) {
        throw const FormatException('The backup contains an invalid item.');
      }
      try {
        final item = FoodItem.fromJson(Map<String, dynamic>.from(value));
        if (item.id.trim().isEmpty ||
            item.name.trim().isEmpty ||
            item.quantity < 1) {
          throw const FormatException('The backup contains an invalid item.');
        }
        if (!ids.add(item.id)) {
          throw const FormatException(
              'The backup contains duplicate item IDs.');
        }
        items.add(item);
      } on FormatException {
        rethrow;
      } catch (_) {
        throw const FormatException('The backup contains an invalid item.');
      }
    }

    final records = <ConsumptionRecord>[];
    for (final value in rawRecords) {
      if (value is! Map) {
        throw const FormatException(
            'The backup contains invalid usage history.');
      }
      try {
        records
            .add(ConsumptionRecord.fromJson(Map<String, dynamic>.from(value)));
      } catch (_) {
        throw const FormatException(
            'The backup contains invalid usage history.');
      }
    }

    return InventoryBackup(
      items: List.unmodifiable(items),
      records: List.unmodifiable(records),
    );
  }
}
