import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../controllers/inventory_controller.dart';
import '../models/catalog_product.dart';
import '../models/food_item.dart';
import '../services/product_lookup_service.dart';
import 'item_form_screen.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key, required this.controller, required this.item});
  final InventoryController controller;
  final FoodItem item;
  static Future<void> open(BuildContext context, InventoryController controller, FoodItem item) => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ItemDetailScreen(controller: controller, item: item)));
  @override State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  CatalogProduct? _product;
  bool _online = false;
  @override void initState() { super.initState(); _load(); }
  Future<void> _load() async {
    try {
      _online = kIsWeb || (await Connectivity().checkConnectivity()).any((c) => c != ConnectivityResult.none);
      if (_online && widget.item.barcode != null) _product = await ProductLookupService().lookup(widget.item.barcode!);
    } catch (_) { /* Saved household data remains available. */ }
    if (mounted) setState(() {});
  }
  @override Widget build(BuildContext context) {
    final item = widget.item; final p = _product;
    return Scaffold(appBar: AppBar(title: const Text('View Item'), actions: [IconButton(onPressed: () => ItemFormScreen.open(context, widget.controller, item: item), icon: const Icon(Icons.edit_outlined), tooltip: 'Edit item')]), body: ListView(padding: const EdgeInsets.all(20), children: [
      if (_online && p?.imageUrl != null) ClipRRect(borderRadius: BorderRadius.circular(18), child: Image.network(p!.imageUrl!, height: 220, fit: BoxFit.cover, errorBuilder: (_, __, ___) => const SizedBox.shrink())),
      Text(item.name, style: Theme.of(context).textTheme.headlineMedium),
      const SizedBox(height: 18),
      if (p != null && p.usable) ...[Text('Product information', style: Theme.of(context).textTheme.titleMedium), if (p.brand?.isNotEmpty == true) _line('Brand', p.brand!), if (p.packageSize?.isNotEmpty == true) _line('Package size', '${p.packageSize} ${p.packageUnit ?? ''}'.trim()), if (p.category?.isNotEmpty == true) _line('Product category', p.category!), const SizedBox(height: 14)],
      Text('Your item', style: Theme.of(context).textTheme.titleMedium), _line('Expires', MaterialLocalizations.of(context).formatMediumDate(item.expiryDate)), _line('Quantity', '${item.quantity}'), _line('Storage', item.location?.label ?? 'No location'), _line('Category', item.category), if (item.barcode != null) _line('Barcode', item.barcode!),
      if (_online && p == null) const Padding(padding: EdgeInsets.only(top: 12), child: Text('Product lookup is unavailable. Your saved item details are shown.')),
    ]));
  }
  Widget _line(String label, String value) => ListTile(contentPadding: EdgeInsets.zero, title: Text(label), subtitle: Text(value));
}
