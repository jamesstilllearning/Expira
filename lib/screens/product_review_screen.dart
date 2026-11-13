import 'package:flutter/material.dart';

import '../controllers/inventory_controller.dart';
import '../models/catalog_product.dart';
import '../theme/app_theme.dart';
import '../widgets/app_card.dart';
import 'item_form_screen.dart';

/// Screen shown after scanning a barcode to review product info before adding.
class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({
    super.key,
    required this.controller,
    required this.barcode,
    this.product,
    this.onEdit,
    this.onCancel,
  });

  final InventoryController controller;
  final String barcode;
  final CatalogProduct? product;
  final VoidCallback? onEdit;
  final VoidCallback? onCancel;

  /// Opens the product review screen.
  static Future<void> open(
    BuildContext context, {
    required InventoryController controller,
    required String barcode,
    CatalogProduct? product,
    VoidCallback? onEdit,
    VoidCallback? onCancel,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ProductReviewScreen(
          controller: controller,
          barcode: barcode,
          product: product,
          onEdit: onEdit,
          onCancel: onCancel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasProduct = product != null && product!.usable;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Product'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onCancel ?? () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            // Product image or placeholder
            if (hasProduct && product!.imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.card),
                child: Image.network(
                  product!.imageUrl!,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _buildPlaceholder(context),
                ),
              )
            else
              _buildPlaceholder(context),

            const SizedBox(height: AppSpacing.xl),

            // Product info card
            AppCard(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hasProduct) ...[
                    Text(
                      product!.name,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (product!.brand?.isNotEmpty == true) ...[
                      const SizedBox(height: AppSpacing.sm),
                      _InfoRow(label: 'Brand', value: product!.brand!),
                    ],
                    if (product!.category?.isNotEmpty == true) ...[
                      const SizedBox(height: AppSpacing.sm),
                      _InfoRow(label: 'Category', value: product!.category!),
                    ],
                    if (product!.packageSize?.isNotEmpty == true) ...[
                      const SizedBox(height: AppSpacing.sm),
                      _InfoRow(
                        label: 'Package Size',
                        value: '${product!.packageSize}${product!.packageUnit != null ? ' ${product!.packageUnit}' : ''}',
                      ),
                    ],
                    if (product!.description?.isNotEmpty == true) ...[
                      const SizedBox(height: AppSpacing.sm),
                      _InfoRow(label: 'Description', value: product!.description!),
                    ],
                  ] else ...[
                    Text(
                      'No product information found',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      'The barcode was scanned but no product details are available. You can still add the item manually.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Barcode info
            AppCard(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Barcode',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    barcode,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontFamily: 'monospace',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppSpacing.xl),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onCancel ?? () => Navigator.of(context).pop(),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                    ),
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Open the item form with pre-filled data
                      ItemFormScreen.open(
                        context,
                        controller,
                        initialBarcode: barcode,
                        initialProduct: product,
                      );
                    },
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
                    ),
                    child: const Text('Add to Inventory'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.qr_code_2,
              size: 48,
              color: theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'No product image',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}