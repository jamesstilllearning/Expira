import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/inventory_controller.dart';
import '../models/food_item.dart';
import '../models/storage_location.dart';
import '../models/catalog_product.dart';
import '../services/product_lookup_service.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/app_card.dart';
import '../widgets/item_card.dart';
import '../widgets/pop_in.dart';
import '../widgets/searchable_selection_sheet.dart';
import 'barcode_scanner_screen.dart';

class ItemFormScreen extends StatefulWidget {
  const ItemFormScreen(
      {super.key, required this.controller, this.item, this.initialBarcode, this.initialProduct});

  static const categories = [
    'Fridge',
    'Freezer',
    'Pantry',
    'Bathroom',
    'Beauty',
    'Medicine',
    'Other'
  ];

  final InventoryController controller;
  final FoodItem? item;
  final String? initialBarcode;
  final CatalogProduct? initialProduct;

  static Future<void> open(
    BuildContext context,
    InventoryController controller, {
    FoodItem? item,
    String? initialBarcode,
    CatalogProduct? initialProduct,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ItemFormScreen(
          controller: controller,
          item: item,
          initialBarcode: initialBarcode,
          initialProduct: initialProduct,
        ),
      ),
    );
  }

  @override
  State<ItemFormScreen> createState() => _ItemFormScreenState();
}

class _ItemFormScreenState extends State<ItemFormScreen> {
  static const _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _brandController;
  late final TextEditingController _notesController;
  late String _category;
  late DateTime _expiryDate;
  late DateTime? _purchaseDate;
  late int _quantity;
  StorageLocation? _location;
  String? _barcode;
  File? _imageFile;
  String? _imageUrl;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final item = widget.item;
    _nameController = TextEditingController(text: item?.name ?? widget.initialProduct?.name ?? '');
    _brandController = TextEditingController(text: item?.brand ?? widget.initialProduct?.brand ?? '');
    _notesController = TextEditingController(text: item?.notes ?? '');
    _category = item?.category ?? ItemFormScreen.categories.first;
    _expiryDate = item?.expiryDate ??
        DateUtils.dateOnly(DateTime.now()).add(const Duration(days: 7));
    _purchaseDate = item?.purchaseDate ??
        (widget.initialProduct?.packageSize != null
            ? DateUtils.dateOnly(DateTime.now())
            : null);
    _quantity = item?.quantity ?? 1;
    _location = item?.location;
    _barcode = item?.barcode ?? widget.initialBarcode;
    _imageUrl = item?.imageUrl ?? widget.initialProduct?.imageUrl;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _setExpiry(DateTime date) =>
      setState(() => _expiryDate = DateUtils.dateOnly(date));

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _expiryDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) _setExpiry(picked);
  }

  Future<void> _pickStorage() async {
    final choice = await showSearchableSelectionSheet<StorageLocation?>(
      context,
      title: 'Storage',
      searchHint: 'Search storage locations',
      emptyMessage: 'No locations found',
      current: _location,
      options: [
        const SelectionOption<StorageLocation?>(
          value: null,
          label: 'No location',
          icon: Icons.not_interested_outlined,
        ),
        for (final location in StorageLocation.values)
          SelectionOption<StorageLocation?>(
            value: location,
            label: location.label,
            icon: location.icon,
          ),
      ],
    );
    if (choice != null && mounted) setState(() => _location = choice.value);
  }

  Future<void> _pickCategory() async {
    final choice = await showSearchableSelectionSheet<String>(
      context,
      title: 'Category',
      searchHint: 'Search categories',
      emptyMessage: 'No categories found',
      current: _category,
      options: [
        for (final category in ItemFormScreen.categories)
          SelectionOption<String>(value: category, label: category),
      ],
    );
    if (choice != null && mounted) setState(() => _category = choice.value);
  }

  Future<void> _pickPurchaseDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _purchaseDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _purchaseDate = DateUtils.dateOnly(picked));
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (image != null && mounted) {
      setState(() {
        _imageFile = File(image.path);
        _imageUrl = null; // Clear URL if local file is selected
      });
    }
  }

  Future<void> _takePhoto() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    if (image != null && mounted) {
      setState(() {
        _imageFile = File(image.path);
        _imageUrl = null; // Clear URL if local file is selected
      });
    }
  }

  Future<void> _clearImage() async {
    setState(() {
      _imageFile = null;
      _imageUrl = null;
    });
  }

  Future<void> _scanBarcode() async {
    final code = await BarcodeScannerScreen.scan(context);
    if (code != null && mounted) {
      final product = await ProductLookupService().lookup(code);
      if (mounted) {
        setState(() {
          _barcode = code;
          if (product != null && _nameController.text.trim().isEmpty) {
            _nameController.text = product.name;
          }
        });
      }
    }
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _saving = true);
    final item = FoodItem(
      id: widget.item?.id ?? DateTime.now().microsecondsSinceEpoch.toString(),
      name: _nameController.text.trim(),
      category: _category,
      expiryDate: DateUtils.dateOnly(_expiryDate),
      quantity: _quantity,
      barcode: _barcode,
      location: _location,
      productId: _barcode == null ? null : ProductLookupService.normalize(_barcode!),
      brand: _brandController.text.trim().isEmpty ? null : _brandController.text.trim(),
      purchaseDate: _purchaseDate,
      imageUrl: _imageFile != null ? _imageFile!.path : _imageUrl,
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
    );

    try {
      await widget.controller.save(item);
      if (mounted) Navigator.of(context).pop();
    } catch (_) {
      if (!mounted) return;
      setState(() => _saving = false);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: PopIn(
            child: Text('Could not save item. Please try again.'),
          ),
        ),
      );
    }
  }

  Future<void> _delete() async {
    final existing = widget.item;
    if (existing == null) return;

    final confirmed = await confirmAction(
      context,
      title: 'Delete item?',
      message: 'Remove "${existing.name}" from your inventory?',
      confirmLabel: 'Delete',
    );
    if (!confirmed || !mounted) return;

    await widget.controller.delete(existing.id);
    if (mounted) Navigator.of(context).pop();
  }

  String _formatDate(DateTime date) =>
      '${_months[date.month - 1]} ${date.day}, ${date.year}';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final editing = widget.item != null;
    final today = DateUtils.dateOnly(DateTime.now());
    final daysLeft = DateUtils.dateOnly(_expiryDate).difference(today).inDays;

    return Scaffold(
      appBar: AppBar(
        title: Text(editing ? 'Edit item' : 'New item'),
        actions: [
          if (editing)
            IconButton(
              tooltip: 'Delete item',
              icon: const Icon(Icons.delete_outline),
              onPressed: _delete,
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
            children: [
              TextFormField(
                controller: _nameController,
                maxLength: 40,
                textCapitalization: TextCapitalization.sentences,
                style: theme.textTheme.titleLarge,
                decoration: const InputDecoration(
                  hintText: 'Item name',
                  prefixIcon: Icon(Icons.edit_outlined),
                  counterText: '',
                ),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Enter an item name'
                    : null,
              ),
              const SizedBox(height: AppSpacing.lg),
              AppFormSection(
                title: 'Expires',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(AppRadius.control),
                      onTap: _pickDate,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(AppSpacing.sm),
                              decoration: BoxDecoration(
                                color: AppColors.brand.withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(AppRadius.control),
                              ),
                              child: const Icon(Icons.event_outlined,
                                  color: AppColors.brand, size: AppIconSize.md),
                            ),
                            const SizedBox(width: AppSpacing.md),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_formatDate(_expiryDate),
                                      style: theme.textTheme.titleMedium),
                                  Text(
                                    describeDaysLeft(daysLeft),
                                    style: theme.textTheme.bodySmall?.copyWith(
                                      color: theme.colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.chevron_right,
                                color: theme.colorScheme.onSurfaceVariant),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: [
                        _QuickDateChip(
                            label: 'Today', onTap: () => _setExpiry(today)),
                        _QuickDateChip(
                          label: 'Tomorrow',
                          onTap: () =>
                              _setExpiry(today.add(const Duration(days: 1))),
                        ),
                        _QuickDateChip(
                          label: 'In 3 days',
                          onTap: () =>
                              _setExpiry(today.add(const Duration(days: 3))),
                        ),
                        _QuickDateChip(
                          label: 'In 1 week',
                          onTap: () =>
                              _setExpiry(today.add(const Duration(days: 7))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              AppFormSection(
                title: 'Storage',
                child: _SelectorField(
                  icon: _location.icon,
                  value: _location?.label ?? 'No location',
                  onTap: _pickStorage,
                ),
              ),
              AppFormSection(
                title: 'Category',
                child: _SelectorField(
                  icon: Icons.category_outlined,
                  value: _category,
                  onTap: _pickCategory,
                ),
              ),
              AppFormSection(
                title: 'Quantity',
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _quantity == 1 ? '1 unit' : '$_quantity units',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    IconButton.filledTonal(
                      tooltip: 'Decrease',
                      onPressed: _quantity > 1
                          ? () => setState(() => _quantity--)
                          : null,
                      icon: const Icon(Icons.remove),
                    ),
                    SizedBox(
                      width: 48,
                      child: Text(
                        '$_quantity',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    IconButton.filled(
                      tooltip: 'Increase',
                      onPressed: _quantity < 99
                          ? () => setState(() => _quantity++)
                          : null,
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              AppFormSection(
                title: 'Barcode',
                child: Row(
                  children: [
                    Icon(Icons.qr_code_2,
                        color: theme.colorScheme.onSurfaceVariant, size: AppIconSize.md),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Text(
                        _barcode ?? 'Not scanned',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: _barcode == null
                              ? theme.colorScheme.onSurfaceVariant
                              : null,
                        ),
                      ),
                    ),
                    if (_barcode != null)
                      IconButton(
                        tooltip: 'Remove barcode',
                        onPressed: () => setState(() => _barcode = null),
                        icon: const Icon(Icons.close, size: AppIconSize.md),
                      ),
                    TextButton.icon(
                      onPressed: _scanBarcode,
                      icon: const Icon(Icons.qr_code_scanner, size: AppIconSize.sm),
                      label: Text(_barcode == null ? 'Scan' : 'Rescan'),
                    ),
                  ],
                ),
              ),
              AppFormSection(
                title: 'Brand',
                child: TextFormField(
                  controller: _brandController,
                  maxLength: 40,
                  textCapitalization: TextCapitalization.words,
                  style: theme.textTheme.titleMedium,
                  decoration: const InputDecoration(
                    hintText: 'Brand (optional)',
                    prefixIcon: Icon(Icons.business_outlined),
                    counterText: '',
                  ),
                ),
              ),
              AppFormSection(
                title: 'Purchase Date',
                child: _SelectorField(
                  icon: Icons.calendar_today_outlined,
                  value: _purchaseDate != null
                      ? '${_months[_purchaseDate!.month - 1]} ${_purchaseDate!.day}, ${_purchaseDate!.year}'
                      : 'Not set (optional)',
                  onTap: _pickPurchaseDate,
                ),
              ),
              AppFormSection(
                title: 'Product Image',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (_imageFile != null || _imageUrl != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(AppRadius.control),
                        child: _imageFile != null
                            ? Image.file(
                                _imageFile!,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                _imageUrl!,
                                height: 180,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const SizedBox.shrink(),
                              ),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        children: [
                          TextButton.icon(
                            onPressed: _clearImage,
                            icon: const Icon(Icons.delete_outline),
                            label: const Text('Remove'),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          TextButton.icon(
                            onPressed: _takePhoto,
                            icon: const Icon(Icons.camera_alt_outlined),
                            label: const Text('Retake'),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          TextButton.icon(
                            onPressed: _pickImage,
                            icon: const Icon(Icons.photo_library_outlined),
                            label: const Text('Choose from gallery'),
                          ),
                        ],
                      ),
                    ] else ...[
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _takePhoto,
                              icon: const Icon(Icons.camera_alt_outlined),
                              label: const Text('Take Photo'),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.md),
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: _pickImage,
                              icon: const Icon(Icons.photo_library_outlined),
                              label: const Text('Choose from Gallery'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
              AppFormSection(
                title: 'Notes',
                child: TextFormField(
                  controller: _notesController,
                  maxLines: 3,
                  maxLength: 500,
                  textCapitalization: TextCapitalization.sentences,
                  style: theme.textTheme.bodyMedium,
                  decoration: const InputDecoration(
                    hintText: 'Add notes about this item...',
                    prefixIcon: Icon(Icons.note_outlined),
                    counterText: '',
                    alignLabelWithHint: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: FilledButton(
              onPressed: _saving ? null : _save,
              child: _saving
                  ? const SizedBox.square(
                      dimension: 22,
                      child: CircularProgressIndicator(
                          strokeWidth: 2.5, color: Colors.white),
                    )
                  : Text(editing ? 'Save changes' : 'Add item'),
            ),
          ),
        ),
      ),
    );
  }
}

class _QuickDateChip extends StatelessWidget {
  const _QuickDateChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ActionChip(
      label: Text(label),
      onPressed: onTap,
      side: BorderSide.none,
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      labelStyle: theme.textTheme.labelLarge,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
    );
  }
}

/// A form field that shows the current value and opens a picker on tap.
class _SelectorField extends StatelessWidget {
  const _SelectorField(
      {required this.icon, required this.value, required this.onTap});

  final IconData icon;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Semantics(
      button: true,
      label: value,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.control),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.sm),
                decoration: BoxDecoration(
                  color: AppColors.brand.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(AppRadius.control),
                ),
                child: Icon(icon, color: AppColors.brand, size: AppIconSize.md),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              Icon(Icons.unfold_more,
                  color: theme.colorScheme.onSurfaceVariant, size: AppIconSize.md),
            ],
          ),
        ),
      ),
    );
  }
}
