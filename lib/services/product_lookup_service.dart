import 'dart:async';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/catalog_product.dart';
import 'inventory_database.dart';

/// Cache-first barcode lookup. Open Facts' universal endpoint routes food,
/// beauty and general products; UPCitemdb is consulted only after a miss.
class ProductLookupService {
  ProductLookupService({InventoryDatabase? database, http.Client? client, Future<bool> Function()? online})
      : _database = database ?? InventoryDatabase.instance,
        _client = client ?? http.Client(),
        _online = online ?? _hasNetwork;

  final InventoryDatabase _database;
  final http.Client _client;
  final Future<bool> Function() _online;
  final Map<String, Future<CatalogProduct?>> _inFlight = {};
  static const _agent = 'ExPIRA/1.0 (product lookup; contact via app support)';

  static String? normalize(String raw) {
    final code = raw.trim().replaceAll(RegExp(r'\s+'), '');
    if (!RegExp(r'^\d{8}$|^\d{12,14}$').hasMatch(code)) return null;
    // UPC-E is expanded by scanner libraries inconsistently; retain digits.
    return code;
  }

  Future<CatalogProduct?> lookup(String raw) async {
    final code = normalize(raw);
    if (code == null) return null;
    final cached = await _database.getProduct(code);
    if (cached != null) {
      if (cached.lookupStatus == 'success' && cached.usable) return cached;
      final attempted = cached.lastAttempt;
      final ttl = cached.lookupStatus == 'not_found' ? const Duration(days: 1) : const Duration(minutes: 2);
      if (attempted != null && DateTime.now().difference(attempted) < ttl) return null;
    }
    if (!await _online()) return cached != null && cached.usable ? cached : null;
    return _inFlight.putIfAbsent(code, () => _fetch(code).whenComplete(() => _inFlight.remove(code)));
  }

  Future<CatalogProduct?> _fetch(String code) async {
    try {
      final uri = Uri.https('world.openfoodfacts.org', '/api/v3/product/$code.json', {'product_type': 'all', 'fields': 'code,product_name,product_name_en,brands,categories,quantity,product_quantity,product_quantity_unit,packaging_text,image_url,description'});
      final response = await _client.get(uri, headers: {'User-Agent': _agent, 'Accept': 'application/json'}).timeout(const Duration(seconds: 5));
      final json = jsonDecode(response.body);
      if (response.statusCode < 500 && response.statusCode != 429 && json is Map) {
        final p = json['product'];
        if (json['status'] == 1 && p is Map) {
          final product = _fromFacts(code, Map<String, dynamic>.from(p), response.request?.url.host ?? 'Open Facts');
          if (product != null) { await _database.saveProduct(product); return product; }
        }
      }
    } catch (_) { /* Transient failures fall through to the bounded fallback. */ }

    try {
      final uri = Uri.https('api.upcitemdb.com', '/prod/trial/lookup', {'upc': code});
      final response = await _client.get(uri, headers: {'Accept': 'application/json'}).timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final items = json is Map ? json['items'] : null;
        if (items is List && items.isNotEmpty && items.first is Map) {
          final p = Map<String, dynamic>.from(items.first as Map);
          final name = (p['title'] as String?)?.trim() ?? '';
          if (name.isNotEmpty) {
            final product = CatalogProduct(barcode: code, name: name, brand: p['brand'] as String?, category: p['category'] as String?, packageSize: p['size'] as String?, imageUrl: _validImage(p['images'] is List && (p['images'] as List).isNotEmpty ? (p['images'] as List).first : null), provider: 'UPCitemdb', providerId: p['ean'] as String?, lastSuccess: DateTime.now().toUtc());
            await _database.saveProduct(product); return product;
          }
        }
        await _saveState(code, 'not_found');
      }
    } catch (_) { /* Keep lookup available for a later manual retry. */ }
    return null;
  }

  CatalogProduct? _fromFacts(String barcode, Map<String, dynamic> p, String host) {
    final name = (p['product_name'] as String?)?.trim().isNotEmpty == true ? (p['product_name'] as String).trim() : (p['product_name_en'] as String?)?.trim() ?? '';
    if (name.isEmpty) return null;
    final quantity = p['quantity'] as String?;
    final image = _validImage(p['image_url']);
    return CatalogProduct(barcode: barcode, name: name, brand: (p['brands'] as String?)?.split(',').first.trim(), category: (p['categories'] as String?)?.split(',').first.trim(), packageSize: quantity ?? p['product_quantity']?.toString(), packageUnit: p['product_quantity_unit'] as String?, description: p['description'] as String?, imageUrl: image, provider: 'Open Facts', providerId: p['code'] as String?, lastSuccess: DateTime.now().toUtc());
  }

  String? _validImage(Object? value) {
    final uri = value is String ? Uri.tryParse(value) : null;
    return uri != null && uri.scheme == 'https' && uri.host.isNotEmpty ? uri.toString() : null;
  }

  Future<void> _saveState(String code, String status) async => _database.saveProduct(CatalogProduct(barcode: code, name: '', provider: 'lookup', lookupStatus: status, lastAttempt: DateTime.now().toUtc()));

  static Future<bool> _hasNetwork() async {
    if (kIsWeb) return true;
    final results = await Connectivity().checkConnectivity();
    return results.any((r) => r != ConnectivityResult.none);
  }
}
