import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/app_constants.dart';
import '../core/utils/date_utils.dart' as app_date_utils;
import '../core/utils/string_utils.dart';
import '../domain/models/expiry_status.dart';
import '../domain/models/food_item.dart';
import '../domain/models/impact_stats.dart';
import '../presentation/providers/state_providers.dart';
import '../presentation/providers/usecase_providers.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import '../widgets/app_loading_indicator.dart';
import '../widgets/app_card.dart';
import '../widgets/impact_panel.dart';
import '../widgets/daily_companion.dart';
import '../widgets/empty_state.dart'
    hide EmptyState; // Use our local _EmptyState instead
import '../widgets/sky_backdrop.dart';
import '../widgets/inventory_health_card.dart';
import '../widgets/item_card.dart';
import '../widgets/section_header.dart';
import 'item_form_screen.dart';
import 'item_detail_screen.dart';

/// Home screen using Riverpod for state management and go_router for navigation.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the food items stream from the repository
    final itemsAsync = ref.watch(foodItemsStreamProvider);
    final settingsAsync = ref.watch(appSettingsStreamProvider);

    return Scaffold(
      body: itemsAsync.when(
        loading: () => const AppLoadingIndicator(
          showText: true,
          text: 'Loading your inventory...',
        ),
        error: (error, stack) => _ErrorState(
          message: 'Failed to load inventory',
          onRetry: () => ref.invalidate(foodItemsStreamProvider),
        ),
        data: (result) {
          final items = result.getOrElse(() => <FoodItem>[]);
          // Get settings for thresholds
          final thresholds = settingsAsync.whenOrNull(
                data: (s) => s.getOrElse(() => const AppSettings()).thresholds,
              ) ??
              ExpiryThresholds.strict;

          // Compute prioritized items (sorted by days left)
          final prioritized = [...items]
            ..sort((a, b) => a.daysLeft.compareTo(b.daysLeft));

          // Compute all statistics
          final stats = _computeStats(items, thresholds);
          final recentlyAdded = _getRecentlyAdded(items);
          final expiringSoon = _getExpiringSoon(items, thresholds);
          final categoryStats = _getCategoryStats(items);
          final consumptionRecordsAsync = ref.watch(consumptionRecordsStreamProvider);

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              _SkyHeader(
                dailyMessage: app_date_utils.dailyMessageFor(DateTime.now()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  20,
                  AppSpacing.lg,
                  20,
                  32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Hero Card - Most urgent item
                    _HeroCard(
                      item: prioritized.isEmpty ? null : prioritized.first,
                      onMarkUsed: (id) => _markItemUsed(ref, id),
                      onViewDetail: (item) => _openItemDetail(context, item),
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
                                onMarkUsed: (id) => _markItemUsed(ref, id),
                                onViewDetail: (item) => _openItemDetail(context, item),
                                onViewAll: () => context.go('/inventory'),
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
                                onMarkUsed: (id) => _markItemUsed(ref, id),
                                onViewDetail: (item) => _openItemDetail(context, item),
                                onViewAll: () => context.go('/inventory'),
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
                        onPressed: () => context.go('/inventory'),
                        child: const Text('View all'),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    InventoryHealthCard(
                      onTap: () => context.go('/inventory'),
                      expiring: stats.expiredItems + stats.expiringSoonItems,
                      soon: stats.expiringSoonItems,
                      safe: stats.safeItems,
                    ),
                    const SizedBox(height: AppSpacing.xl),

                    // Impact Panel
                    const SectionHeader(title: 'Your Impact'),
                    const SizedBox(height: AppSpacing.md),
                    consumptionRecordsAsync.when(
                      loading: () => const SizedBox.shrink(),
                      error: (_, __) => const SizedBox.shrink(),
                      data: (records) => ImpactPanel(
                        stats: ImpactStats.fromRecords(records),
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
        onPressed: () => ItemFormScreen.open(context),
        tooltip: 'Add item',
        child: const Icon(Icons.add),
      ),
    );
  }

  // Helper methods
  _DashboardStats _computeStats(
    List<FoodItem> items,
    ExpiryThresholds thresholds,
  ) {
    int safe = 0;
    int expiringSoon = 0;
    int expired = 0;

    for (final item in items) {
      final status = _classifyItem(item, thresholds);
      switch (status) {
        case ExpiryStatus.safe():
          safe++;
          break;
        case ExpiryStatus.soon():
        case ExpiryStatus.expiring():
          expiringSoon++;
          break;
        case ExpiryStatus.expired():
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

  ExpiryStatus _classifyItem(FoodItem item, ExpiryThresholds thresholds) {
    final days = item.daysLeft;
    if (days < 0) return ExpiryStatus.expired();
    if (days <= thresholds.expiringWithinDays) return ExpiryStatus.expiring();
    if (days <= thresholds.soonWithinDays) return ExpiryStatus.soon();
    return ExpiryStatus.safe();
  }

  List<FoodItem> _getRecentlyAdded(List<FoodItem> items) {
    final sorted = List<FoodItem>.from(items)
      ..sort((a, b) => b.id.compareTo(a.id)); // Sort by ID (timestamp-based)
    return sorted.take(5).toList();
  }

  List<FoodItem> _getExpiringSoon(
    List<FoodItem> items,
    ExpiryThresholds thresholds,
  ) {
    final expiring = items.where((item) {
      final status = _classifyItem(item, thresholds);
      return status == ExpiryStatus.expiring() || status == ExpiryStatus.soon();
    }).toList();
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

  Future<void> _markItemUsed(WidgetRef ref, String id) async {
    final result = await ref.read(markFoodItemUsedUseCaseProvider)(id);
    if (!result.isSuccess && ref.context.mounted) {
      ScaffoldMessenger.of(ref.context).showSnackBar(
        SnackBar(content: Text('Failed to mark item as used: ${result.failure?.message}')),
      );
    }
  }

  void _openItemDetail(BuildContext context, FoodItem item) {
    ItemDetailScreen.open(context, item);
  }
}

/// Error state widget
class _ErrorState extends StatelessWidget {
  const _ErrorState({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: theme.colorScheme.error,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              message,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            FilledButton(
              onPressed: onRetry,
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Data class for dashboard statistics
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
class _SkyHeader extends ConsumerWidget {
  const _SkyHeader({
    required this.dailyMessage,
  });

  final String dailyMessage;

  static const _textShadow = [
    Shadow(color: Color(0x66000000), blurRadius: 12)
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  onPressed: () => context.go('/settings'),
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
  const _HeroCard({
    required this.item,
    required this.onMarkUsed,
    required this.onViewDetail,
  });

  final FoodItem? item;
  final Function(String) onMarkUsed;
  final Function(FoodItem) onViewDetail;

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
    return _EmptyState(
      icon: Icons.eco_outlined,
      message:
          'Nothing tracked yet\nAdd your first item and ExPIRA will tell you what to use first.',
      action: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: AppColors.brandDeep,
          minimumSize: const Size(48, 48),
        ),
        onPressed: () => ItemFormScreen.open(context),
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
                    app_date_utils.describeDaysLeft(days),
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
                onPressed: () => onMarkUsed(next.id),
                child: const Text('Mark as used'),
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white54),
              ),
              onPressed: () => onViewDetail(next),
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
    required this.onMarkUsed,
    required this.onViewDetail,
    required this.onViewAll,
  });

  final List<FoodItem> items;
  final Function(String) onMarkUsed;
  final Function(FoodItem) onViewDetail;
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
              onMarkUsed: onMarkUsed,
              onViewDetail: onViewDetail,
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
    required this.onMarkUsed,
    required this.onViewDetail,
    required this.onViewAll,
  });

  final List<FoodItem> items;
  final Function(String) onMarkUsed;
  final Function(FoodItem) onViewDetail;
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
              onMarkUsed: onMarkUsed,
              onViewDetail: onViewDetail,
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
    required this.onMarkUsed,
    required this.onViewDetail,
    this.showDivider = true,
  });

  final FoodItem item;
  final Function(String) onMarkUsed;
  final Function(FoodItem) onViewDetail;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final status = item.status;
    final statusColor = _statusColor(status, theme.brightness);

    return InkWell(
      onTap: () => onViewDetail(item),
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
                    _locationIcon(item.location),
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
                      app_date_utils.describeDaysLeft(item.daysLeft),
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

  Color _statusColor(ExpiryStatus status, Brightness brightness) {
    return switch (status) {
      ExpiryStatus.expired() => AppColors.expiring,
      ExpiryStatus.expiring() => AppColors.expiring,
      ExpiryStatus.soon() => AppColors.soon,
      ExpiryStatus.safe() => AppColors.safe,
    };
  }

  IconData _locationIcon(StorageLocation location) {
    return switch (location) {
      StorageLocation.fridge() => Icons.kitchen_outlined,
      StorageLocation.freezer() => Icons.ac_unit,
      StorageLocation.pantry() => Icons.shelves,
      StorageLocation.bathroom() => Icons.bathtub_outlined,
      StorageLocation.beautyProducts() => Icons.spa_outlined,
      StorageLocation.other() => Icons.inventory_2_outlined,
    };
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

/// Local empty state widget to avoid conflict with widgets/empty_state.dart
class _EmptyState extends StatelessWidget {
  const _EmptyState({
    required this.icon,
    required this.message,
    this.action,
  });

  final IconData icon;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 48, color: theme.colorScheme.onSurfaceVariant),
        const SizedBox(height: AppSpacing.md),
        Text(
          message,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        if (action != null) ...[
          const SizedBox(height: AppSpacing.lg),
          action!,
        ],
      ],
    );
  }
}