import 'package:flutter/material.dart';

import '../controllers/inventory_controller.dart';
import '../models/food_item.dart';
import '../models/location_groups.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/app_loading_indicator.dart';
import '../widgets/empty_state.dart';
import '../widgets/item_card.dart';
import 'barcode_scanner_screen.dart';
import 'item_form_screen.dart';
import 'product_review_screen.dart';
import '../services/product_lookup_service.dart';

enum _SortMode { expiry, name, category }

class InventoryScreen extends StatefulWidget {
  const InventoryScreen(
      {super.key,
      required this.controller,
      this.onOpenSettings,
      this.onOpenNotifications});

  final InventoryController controller;

  /// Opens Settings from the header. Omit to hide the button.
  final VoidCallback? onOpenSettings;
  final VoidCallback? onOpenNotifications;

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  String _query = '';
  ExpiryStatus? _statusFilter;
  _SortMode _sort = _SortMode.expiry;
  bool _groupByLocation = false;

  List<FoodItem> _visibleItems() {
    final query = _query.trim().toLowerCase();
    final items = widget.controller.items.where((item) {
      final matchesText = query.isEmpty ||
          item.name.toLowerCase().contains(query) ||
          item.category.toLowerCase().contains(query) ||
          (item.location?.label.toLowerCase().contains(query) ?? false);
      final matchesStatus = _statusFilter == null ||
          widget.controller.statusOf(item) == _statusFilter;
      return matchesText && matchesStatus;
    }).toList();

    final Comparator<FoodItem> comparator = switch (_sort) {
      _SortMode.expiry => (a, b) => a.daysLeft.compareTo(b.daysLeft),
      _SortMode.name => (a, b) =>
          a.name.toLowerCase().compareTo(b.name.toLowerCase()),
      _SortMode.category => (a, b) => a.category.compareTo(b.category),
    };
    items.sort(comparator);
    return items;
  }

  Future<void> _scanAndAdd(BuildContext context) async {
    final barcode = await BarcodeScannerScreen.scan(context);
    if (barcode == null || !context.mounted) return;

    final product = await ProductLookupService().lookup(barcode);
    if (!context.mounted) return;
    final matches = widget.controller.items.where((item) => item.barcode == barcode);
    if (matches.isNotEmpty) {
      await ItemFormScreen.open(context, widget.controller,
          item: matches.first);
    } else {
      // Show product review screen first
      await ProductReviewScreen.open(
        context,
        controller: widget.controller,
        barcode: barcode,
        product: product,
        onEdit: () {
          // User wants to edit before saving - open form with pre-filled data
          ItemFormScreen.open(context, widget.controller,
              initialBarcode: barcode, initialProduct: product);
        },
      );
    }
  }

  Widget _itemCard(BuildContext context, FoodItem item) {
    final controller = widget.controller;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Dismissible(
        key: ValueKey(item.id),
        direction: DismissDirection.endToStart,
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 22),
          decoration: BoxDecoration(
            color: AppColors.expiring,
            borderRadius: BorderRadius.circular(AppRadius.card),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Delete',
                  style: theme.textTheme.labelLarge
                      ?.copyWith(color: Colors.white)),
              const SizedBox(width: 8),
              const Icon(Icons.delete_outline, color: Colors.white),
            ],
          ),
        ),
        confirmDismiss: (_) => confirmAction(
          context,
          title: 'Delete item?',
          message: 'Remove "${item.name}" from your inventory?',
          confirmLabel: 'Delete',
        ),
        onDismissed: (_) => controller.delete(item.id),
        child: ItemCard(
          item: item,
          status: controller.statusOf(item),
          onTap: () => ItemFormScreen.open(context, controller, item: item),
          onMarkUsed: () => controller.markUsed(item.id),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<FoodItem> items) {
    if (items.isEmpty) {
      return EmptyState(
        icon: widget.controller.items.isEmpty
            ? Icons.kitchen_outlined
            : Icons.search_off,
        message: widget.controller.items.isEmpty
            ? 'Your inventory is empty.\nAdd an item or scan a barcode to begin.'
            : 'No items match your search or filter.',
      );
    }

    const padding = EdgeInsets.fromLTRB(20, 4, 20, 120);
    if (!_groupByLocation) {
      return ListView.builder(
        padding: padding,
        itemCount: items.length,
        itemBuilder: (context, index) => _itemCard(context, items[index]),
      );
    }

    return ListView(
      padding: padding,
      children: [
        for (final group in groupByLocation(items))
          _LocationSection(
            group: group,
            itemBuilder: (item) => _itemCard(context, item),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => ItemFormScreen.open(context, controller),
        icon: const Icon(Icons.add),
        label: const Text('Add item'),
      ),
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          if (!controller.isLoaded) {
            return const AppLoadingIndicator(showText: true, text: 'Loading inventory...');
          }
          final items = _visibleItems();
          final total = controller.items.length;

          return SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _PageHeader(
                  sort: _sort,
                  onSortChanged: (mode) => setState(() => _sort = mode),
                  onScan: () => _scanAndAdd(context),
                  onOpenSettings: widget.onOpenSettings,
                  onOpenNotifications: widget.onOpenNotifications,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 12),
                  child: TextField(
                    onChanged: (value) => setState(() => _query = value),
                    decoration: const InputDecoration(
                      hintText: 'Search your inventory',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _ViewToggle(
                    groupedByLocation: _groupByLocation,
                    onChanged: (grouped) =>
                        setState(() => _groupByLocation = grouped),
                  ),
                ),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: [
                      _StatusChip(
                        label: 'All',
                        color: AppColors.brand,
                        selected: _statusFilter == null,
                        onTap: () => setState(() => _statusFilter = null),
                      ),
                      for (final status in ExpiryStatus.values)
                        _StatusChip(
                          label: status.label,
                          color: status.colorFor(Theme.of(context).brightness),
                          selected: _statusFilter == status,
                          onTap: () => setState(() => _statusFilter = status),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 10),
                  child: Text(
                    _summary(items.length, total),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
                Expanded(child: _buildList(context, items)),
              ],
            ),
          );
        },
      ),
    );
  }

  String _summary(int shown, int total) {
    final noun = total == 1 ? 'item' : 'items';
    return shown == total ? '$total $noun' : '$shown of $total $noun';
  }
}

/// Brand line, large title, tagline, and the page's actions.
class _PageHeader extends StatelessWidget {
  const _PageHeader({
    required this.sort,
    required this.onSortChanged,
    required this.onScan,
    this.onOpenSettings,
    this.onOpenNotifications,
  });

  final _SortMode sort;
  final ValueChanged<_SortMode> onSortChanged;
  final VoidCallback onScan;
  final VoidCallback? onOpenSettings;
  final VoidCallback? onOpenNotifications;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;

    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 380;
        final buttonSize = compact ? 40.0 : 48.0;
        final actionConstraints =
            BoxConstraints.tightFor(width: buttonSize, height: buttonSize);
        final actionPadding = compact ? EdgeInsets.zero : null;

        Widget actionButton({
          required String tooltip,
          required VoidCallback? onPressed,
          required Widget icon,
        }) => IconButton(
              tooltip: tooltip,
              onPressed: onPressed,
              constraints: actionConstraints,
              padding: actionPadding,
              visualDensity: compact ? VisualDensity.compact : null,
              icon: icon,
            );

        return Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 8, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ExPIRA',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: AppColors.brand,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Inventory',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineMedium
                          ?.copyWith(letterSpacing: -0.8),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Stay on track, stay healthy.',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(color: muted),
                    ),
                  ],
                ),
              ),
              actionButton(
                tooltip: 'Scan barcode',
                onPressed: onScan,
                icon: const Icon(Icons.qr_code_2),
              ),
              if (onOpenNotifications != null)
                actionButton(
                  tooltip: 'Notifications',
                  onPressed: onOpenNotifications,
                  icon: const Icon(Icons.notifications_outlined),
                ),
              if (onOpenSettings != null)
                actionButton(
                  tooltip: 'Settings',
                  onPressed: onOpenSettings,
                  icon: const Icon(Icons.settings_outlined),
                ),
              PopupMenuButton<_SortMode>(
                tooltip: 'Sort',
                constraints: actionConstraints,
                padding: actionPadding ?? const EdgeInsets.all(8),
                icon: const Icon(Icons.swap_vert),
                initialValue: sort,
                onSelected: onSortChanged,
                itemBuilder: (_) => const [
                  PopupMenuItem(
                      value: _SortMode.expiry,
                      child: Text('Sort by expiry date')),
                  PopupMenuItem(
                      value: _SortMode.name, child: Text('Sort by name')),
                  PopupMenuItem(
                      value: _SortMode.category,
                      child: Text('Sort by category')),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Full-width List / Location switch with a single raised track.
class _ViewToggle extends StatelessWidget {
  const _ViewToggle({required this.groupedByLocation, required this.onChanged});

  final bool groupedByLocation;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        children: [
          Expanded(
            child: _ToggleSegment(
              label: 'List',
              icon: Icons.view_agenda_outlined,
              selected: !groupedByLocation,
              onTap: () => onChanged(false),
            ),
          ),
          Expanded(
            child: _ToggleSegment(
              label: 'Location',
              icon: Icons.place_outlined,
              selected: groupedByLocation,
              onTap: () => onChanged(true),
            ),
          ),
        ],
      ),
    );
  }
}

class _ToggleSegment extends StatelessWidget {
  const _ToggleSegment({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final foreground =
        selected ? Colors.white : theme.colorScheme.onSurfaceVariant;
    return Semantics(
      button: true,
      selected: selected,
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.pill),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? AppColors.brand : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.pill),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: foreground),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.labelLarge?.copyWith(color: foreground),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Outlined status pill. Selected state tints with the status colour.
class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.color,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final Color color;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ChoiceChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onTap(),
        showCheckmark: false,
        side: BorderSide(color: selected ? color : scheme.outlineVariant),
        selectedColor: color.withValues(alpha: 0.16),
        backgroundColor: scheme.surface,
        labelStyle: TextStyle(
          fontWeight: FontWeight.w600,
          color: selected ? color : scheme.onSurface,
        ),
      ),
    );
  }
}

/// A location as its own surface: icon, name, and count in the header, with its
/// items listed below. Collapses to just the header.
class _LocationSection extends StatelessWidget {
  const _LocationSection({required this.group, required this.itemBuilder});

  final LocationGroup group;
  final Widget Function(FoodItem item) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = group.items.length;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: BorderRadius.circular(AppRadius.card),
        ),
        clipBehavior: Clip.antiAlias,
        child: Theme(
          data: theme.copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: true,
            shape: const RoundedRectangleBorder(side: BorderSide.none),
            collapsedShape: const RoundedRectangleBorder(side: BorderSide.none),
            tilePadding: const EdgeInsets.fromLTRB(14, 6, 10, 6),
            childrenPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            leading: CircleAvatar(
              backgroundColor: AppColors.brand.withValues(alpha: 0.12),
              child:
                  Icon(group.location.icon, color: AppColors.brand, size: 20),
            ),
            title: Text(group.title, style: theme.textTheme.titleMedium),
            subtitle: Text(
              '$count ${count == 1 ? 'item' : 'items'}',
              style: theme.textTheme.labelMedium
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            children: [for (final item in group.items) itemBuilder(item)],
          ),
        ),
      ),
    );
  }
}
