import 'package:flutter/material.dart';

import '../controllers/inventory_controller.dart';
import '../models/food_item.dart';
import '../models/impact_stats.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/app_loading_indicator.dart';
import '../widgets/app_card.dart';
import '../widgets/impact_panel.dart';
import '../services/daily_message.dart';
import '../widgets/daily_companion.dart';
import '../widgets/empty_state.dart';
import '../widgets/sky_backdrop.dart';
import '../widgets/inventory_health_card.dart';
import '../widgets/item_card.dart';
import '../widgets/section_header.dart';
import 'item_form_screen.dart';
import 'item_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.controller,
    required this.onOpenInventory,
    required this.onOpenSettings,
    required this.onScanBarcode,
    required this.onOpenCalendar,
    required this.onOpenNotifications,
  });

  final InventoryController controller;
  final VoidCallback onOpenInventory;
  final VoidCallback onOpenSettings;
  final VoidCallback onScanBarcode;
  final VoidCallback onOpenCalendar;
  final VoidCallback onOpenNotifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: controller,
        builder: (context, _) {
          if (!controller.isLoaded) {
            return const AppLoadingIndicator(
              showText: true,
              text: 'Loading your inventory...',
            );
          }

          final items = controller.items;
          final prioritized = controller.prioritized;

          // Compute all statistics
          final stats = _computeStats(items, controller);
          final recentlyAdded = _getRecentlyAdded(items);
          final expiringSoon = _getExpiringSoon(items, controller);
          final categoryStats = _getCategoryStats(items);

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              _SkyHeader(
                onOpenSettings: onOpenSettings,
                dailyMessage: dailyMessageFor(DateTime.now()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, AppSpacing.lg, 20, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Card - Most urgent item
                    _HeroCard(
                      item: prioritized.isEmpty ? null : prioritized.first,
                      controller: controller,
                    ),
                    const SizedBox(height: AppSpacing.xl),

                    // Product Summary - Recently Added & Expiring Soon
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionHeader(title: 'Recently Added'),
                              const SizedBox(height: AppSpacing.md),
                              _RecentlyAddedList(
                                items: recentlyAdded,
                                controller: controller,
                                onViewAll: onOpenInventory,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: AppSpacing.lg),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SectionHeader(title: 'Expiring Soon'),
                              const SizedBox(height: AppSpacing.md),
                              _ExpiringSoonList(
                                items: expiringSoon,
                                controller: controller,
                                onViewAll: onOpenInventory,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xl),

                    // Category Breakdown
                    if (categoryStats.isNotEmpty) ...[
                      const SectionHeader(title: 'Categories'),
                      const SizedBox(height: AppSpacing.md),
                      _CategoryBreakdown(
                        categoryStats: categoryStats,
                        totalItems: stats.totalItems,
                      ),
                      const SizedBox(height: AppSpacing.xl),
                    ],

                    // Inventory Health Card
                    SectionHeader(
                      title: 'Inventory Health',
                      action: TextButton(
                        onPressed: onOpenInventory,
                        child: const Text('View all'),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    InventoryHealthCard(
                      onTap: onOpenInventory,
                      expiring: stats.expiredItems + stats.expiringSoonItems,
                      soon: stats.expiringSoonItems,
                      safe: stats.safeItems,
                    ),
                    const SizedBox(height: AppSpacing.xl),

                    // Impact Panel
                    const SectionHeader(title: 'Your Impact'),
                    const SizedBox(height: AppSpacing.md),
                    ImpactPanel(
                      stats: ImpactStats.fromRecords(
                        controller.consumptionRecords,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ItemFormScreen.open(context, controller),
        tooltip: 'Add item',
        child: const Icon(Icons.add),
      ),
    );
  }

  // Helper methods to compute statistics
  _DashboardStats _computeStats(
    List<FoodItem> items,
    InventoryController controller,
  ) {
    int safe = 0;
    int expiringSoon = 0;
    int expired = 0;

    for (final item in items) {
      final status = controller.statusOf(item);
      switch (status) {
        case ExpiryStatus.safe:
          safe++;
          break;
        case ExpiryStatus.soon:
        case ExpiryStatus.expiring:
          expiringSoon++;
          break;
        case ExpiryStatus.expired:
          expired++;
          break;
      }
    }

    return _DashboardStats(
      totalItems: items.length,
      safeItems: safe,
      expiringSoonItems: expiringSoon,
      expiredItems: expired,
    );
  }

  List<FoodItem> _getRecentlyAdded(List<FoodItem> items) {
    final sorted = List<FoodItem>.from(items)
      ..sort((a, b) => b.id.compareTo(a.id)); // Sort by ID (timestamp-based)
    return sorted.take(5).toList();
  }

  List<FoodItem> _getExpiringSoon(
    List<FoodItem> items,
    InventoryController controller,
  ) {
    final expiring = items
        .where((item) =>
            controller.statusOf(item) == ExpiryStatus.expiring ||
            controller.statusOf(item) == ExpiryStatus.soon)
        .toList();
    expiring.sort((a, b) => a.expiryDate.compareTo(b.expiryDate));
    return expiring.take(5).toList();
  }

  Map<String, int> _getCategoryStats(List<FoodItem> items) {
    final stats = <String, int>{};
    for (final item in items) {
      stats[item.category] = (stats[item.category] ?? 0) + item.quantity;
    }
    // Sort by count descending
    final sortedEntries = stats.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return Map.fromEntries(sortedEntries.take(6));
  }
}

// Data class for dashboard statistics
class _DashboardStats {
  const _DashboardStats({
    required this.totalItems,
    required this.safeItems,
    required this.expiringSoonItems,
    required this.expiredItems,
  });

  final int totalItems;
  final int safeItems;
  final int expiringSoonItems;
  final int expiredItems;
}

/// Sky header with greeting, app title, settings, and daily companion
class _SkyHeader extends StatelessWidget {
  const _SkyHeader({
    required this.onOpenSettings,
    required this.dailyMessage,
  });

  final VoidCallback onOpenSettings;
  final String dailyMessage;

  static const _textShadow = [
    Shadow(color: Color(0x66000000), blurRadius: 12)
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final topInset = MediaQuery.paddingOf(context).top;
    final hour = DateTime.now().hour;
    final greeting = hour < 12
        ? 'Good morning'
        : hour < 18
            ? 'Good afternoon'
            : 'Good evening';

    return SkyBackdrop(
      height: topInset + 210,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, topInset + 12, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        greeting,
                        style: theme.textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          shadows: _textShadow,
                        ),
                      ),
                      Text(
                        'ExPIRA',
                        style: theme.textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          shadows: _textShadow,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Settings',
                  onPressed: onOpenSettings,
                  style: IconButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 0, 0, 0)
                        .withValues(alpha: 0.2),
                    foregroundColor: Colors.white,
                    minimumSize: const Size(48, 48),
                  ),
                  icon: const Icon(Icons.settings_outlined),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DailyCompanion(message: dailyMessage),
          ],
        ),
      ),
    );
  }
}

/// Hero card showing the most urgent item
class _HeroCard extends StatelessWidget {
  const _HeroCard({required this.item, required this.controller});

  final FoodItem? item;
  final InventoryController controller;

  @override
  Widget build(BuildContext context) {
    final next = item;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.brandDeep,
        borderRadius: BorderRadius.circular(28),
      ),
      child: next == null ? _emptyContent(context) : _content(context, next),
    );
  }

  Widget _emptyContent(BuildContext context) {
    return EmptyState(
      icon: Icons.eco_outlined,
      message:
          'Nothing tracked yet\nAdd your first item and ExPIRA will tell you what to use first.',
      action: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.brandDeep,
          minimumSize: const Size(48, 48),
        ),
        onPressed: () => ItemFormScreen.open(context, controller),
        child: const Text('Add first item'),
      ),
    );
  }

  Widget _content(BuildContext context, FoodItem next) {
    final theme = Theme.of(context);
    final days = next.daysLeft;
    final fraction = days < 0 ? 0.0 : (days.clamp(0, 30) / 30).toDouble();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'USE FIRST',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.white70,
                      letterSpacing: 1.4,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    next.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.headlineSmall
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    describeDaysLeft(days),
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            _DaysRing(days: days, fraction: fraction),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.brandDeep,
                ),
                onPressed: () => controller.markUsed(next.id),
                child: const Text('Mark as used'),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white54),
              ),
              onPressed: () =>
                  ItemDetailScreen.open(context, controller, next),
              child: const Text('View Item'),
            ),
          ],
        ),
      ],
    );
  }
}

/// Animated days ring for the hero card
class _DaysRing extends StatefulWidget {
  const _DaysRing({required this.days, required this.fraction});

  final int days;
  final double fraction;

  @override
  State<_DaysRing> createState() => _DaysRingState();
}

class _DaysRingState extends State<_DaysRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    if (widget.days < 0) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant _DaysRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.days < 0 && oldWidget.days >= 0) {
      _pulseController.repeat(reverse: true);
    } else if (widget.days >= 0 && oldWidget.days < 0) {
      _pulseController.stop();
      _pulseController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isExpired = widget.days < 0;

    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, _) {
        final pulseScale = isExpired
            ? 1.0 + 0.08 * _pulseController.value
            : 1.0;
        return Transform.scale(
          scale: pulseScale,
          child: SizedBox(
            width: 84,
            height: 84,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: isExpired ? 1.0 : widget.fraction,
                  strokeWidth: 7,
                  backgroundColor: Colors.white24,
                  color: Colors.white,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isExpired ? '!' : '${widget.days}',
                      style: theme.textTheme.headlineSmall
                          ?.copyWith(color: Colors.white),
                    ),
                    Text(
                      isExpired ? 'overdue' : 'days',
                      style: theme.textTheme.labelSmall
                          ?.copyWith(color: Colors.white70),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Recently added products list
class _RecentlyAddedList extends StatelessWidget {
  const _RecentlyAddedList({
    required this.items,
    required this.controller,
    required this.onViewAll,
  });

  final List<FoodItem> items;
  final InventoryController controller;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (items.isEmpty) {
      return AppCard(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Center(
          child: Text(
            'No items added yet',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _MiniItemTile(
              item: items[i],
              controller: controller,
              showDivider: i < items.length - 1,
            ),
          ],
          TextButton(
            onPressed: onViewAll,
            child: const Text('View all'),
          ),
        ],
      ),
    );
  }
}

/// Expiring soon products list
class _ExpiringSoonList extends StatelessWidget {
  const _ExpiringSoonList({
    required this.items,
    required this.controller,
    required this.onViewAll,
  });

  final List<FoodItem> items;
  final InventoryController controller;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (items.isEmpty) {
      return AppCard(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.check_circle_outline,
                size: 32,
                color: AppColors.safeFor(theme.brightness),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'Nothing expiring soon!',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (int i = 0; i < items.length; i++) ...[
            _MiniItemTile(
              item: items[i],
              controller: controller,
              showDivider: i < items.length - 1,
            ),
          ],
          TextButton(
            onPressed: onViewAll,
            child: const Text('View all'),
          ),
        ],
      ),
    );
  }
}

/// Mini item tile for lists
class _MiniItemTile extends StatelessWidget {
  const _MiniItemTile({
    required this.item,
    required this.controller,
    this.showDivider = true,
  });

  final FoodItem item;
  final InventoryController controller;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = controller.statusOf(item);
    final statusColor = status.colorFor(theme.brightness);

    return InkWell(
      onTap: () => ItemDetailScreen.open(context, controller, item),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(AppRadius.control),
                  ),
                  child: Icon(
                    item.location?.icon ?? Icons.inventory_2_outlined,
                    color: statusColor,
                    size: 20,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${item.quantity} ${item.quantity == 1 ? 'item' : 'items'} • ${item.category}',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.sm,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                      ),
                      child: Text(
                        status.label,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: statusColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      describeDaysLeft(item.daysLeft),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: statusColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (showDivider)
              Divider(
                height: AppSpacing.md,
                color: theme.colorScheme.outlineVariant,
              ),
          ],
        ),
      ),
    );
  }
}

/// Category breakdown visualization
class _CategoryBreakdown extends StatelessWidget {
  const _CategoryBreakdown({
    required this.categoryStats,
    required this.totalItems,
  });

  final Map<String, int> categoryStats;
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final entries = categoryStats.entries.toList();

    return AppCard(
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'By Category',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$totalItems items',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          ...entries.asMap().entries.map((entry) {
            final index = entry.key;
            final categoryEntry = entry.value;
            final percentage =
                (categoryEntry.value / totalItems).clamp(0.0, 1.0);
            final colors = [
              AppColors.brand,
              AppColors.soon,
              AppColors.safe,
              AppColors.expiring,
              AppColors.deep,
              AppColors.accent,
            ];
            final color = colors[index % colors.length];

            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        categoryEntry.key,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${categoryEntry.value} items (${(percentage * 100).round()}%)',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                    child: LinearProgressIndicator(
                      value: percentage,
                      minHeight: 8,
                      backgroundColor:
                          theme.colorScheme.surfaceContainerHighest,
                      valueColor: AlwaysStoppedAnimation(color),
                    ),
                  ),
                ],
              )
          );
      }),
        ],
      ),
    );
  }
}