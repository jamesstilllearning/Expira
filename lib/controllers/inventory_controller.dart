import 'dart:async';

import 'package:flutter/material.dart';

import '../models/consumption_record.dart';
import '../models/food_item.dart';
import '../services/consumption_storage.dart';
import '../services/item_storage.dart';

class InventoryController extends ChangeNotifier {
  InventoryController(this._storage, [ConsumptionStorage? consumptionStorage])
      : _consumptionStorage = consumptionStorage ?? ConsumptionStorage();

  final ItemStorage _storage;
  final ConsumptionStorage _consumptionStorage;
  final StreamController<ConsumptionRecord> _consumedController =
      StreamController<ConsumptionRecord>.broadcast();

  List<FoodItem> _items = const [];
  List<ConsumptionRecord> _consumptionRecords = const [];
  ExpiryThresholds _thresholds = ExpiryThresholds.strict;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;
  List<FoodItem> get items => List.unmodifiable(_items);
  List<ConsumptionRecord> get consumptionRecords =>
      List.unmodifiable(_consumptionRecords);

  /// Emits once per item unit that was successfully marked as used.
  Stream<ConsumptionRecord> get consumptions => _consumedController.stream;

  /// Items ordered by how soon they expire, soonest first.
  List<FoodItem> get prioritized =>
      [..._items]..sort((a, b) => a.daysLeft.compareTo(b.daysLeft));

  /// Expiry status of [item] under the currently active thresholds.
  ExpiryStatus statusOf(FoodItem item) => _thresholds.classify(item.daysLeft);

  void updateThresholds(ExpiryThresholds thresholds) {
    _thresholds = thresholds;
    notifyListeners();
  }

  Future<void> load() async {
    _items = await _storage.load();
    _consumptionRecords = await _consumptionStorage.load();
    _isLoaded = true;
    notifyListeners();
  }

  /// Adds a new item or replaces an existing one with the same id.
  Future<void> save(FoodItem item) =>
      _replaceAll([..._items.where((e) => e.id != item.id), item]);

  Future<void> delete(String id) =>
      _replaceAll(_items.where((e) => e.id != id).toList());

  /// Uses one unit of the item and records the consumption.
  ///
  /// Returns null when no item matches [id]. The [consumptions] event fires
  /// only after both the item and the history have been persisted.
  Future<ConsumptionRecord?> markUsed(String id) async {
    final matches = _items.where((e) => e.id == id);
    if (matches.isEmpty) return null;

    final item = matches.first;
    final record = ConsumptionRecord(
      itemName: item.name,
      category: item.category,
      expiryDate: DateUtils.dateOnly(item.expiryDate),
      usedOn: DateUtils.dateOnly(DateTime.now()),
      wasExpiringAtUse: statusOf(item) == ExpiryStatus.expiring,
    );

    final remainingItem =
        item.quantity > 1 ? item.copyWith(quantity: item.quantity - 1) : null;
    await _storage.database.recordUse(
      itemId: id,
      remainingItem: remainingItem,
      record: record,
    );
    _items = remainingItem == null
        ? _items.where((e) => e.id != id).toList()
        : _items.map((e) => e.id == id ? remainingItem : e).toList();
    _consumptionRecords = [..._consumptionRecords, record];
    notifyListeners();
    _consumedController.add(record);
    return record;
  }

  /// Replaces inventory and history together after a validated backup restore.
  Future<void> replaceAll({
    required List<FoodItem> items,
    required List<ConsumptionRecord> records,
  }) async {
    await _storage.database.replaceAll(items: items, records: records);
    _items = List.of(items);
    _consumptionRecords = List.of(records);
    notifyListeners();
  }

  Future<void> _replaceAll(List<FoodItem> next) {
    return _storage.save(next).then((_) {
      _items = next;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _consumedController.close();
    super.dispose();
  }
}
