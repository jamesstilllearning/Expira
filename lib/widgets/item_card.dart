import 'package:flutter/material.dart';

import '../models/food_item.dart';
import '../models/storage_location.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';
import 'app_card.dart';

extension ExpiryStatusStyle on ExpiryStatus {
  Color get color => switch (this) {
        ExpiryStatus.expired => AppColors.expired,
        ExpiryStatus.expiring => AppColors.expiring,
        ExpiryStatus.soon => AppColors.soon,
        ExpiryStatus.safe => AppColors.safe,
      };

  Color colorFor(Brightness brightness) => switch (this) {
        ExpiryStatus.expired => AppColors.expiredFor(brightness),
        ExpiryStatus.expiring => AppColors.expiringFor(brightness),
        ExpiryStatus.soon => AppColors.soonFor(brightness),
        ExpiryStatus.safe => AppColors.safeFor(brightness),
      };

  String get label => switch (this) {
        ExpiryStatus.expired => 'Expired',
        ExpiryStatus.expiring => 'Expiring',
        ExpiryStatus.soon => 'Soon',
        ExpiryStatus.safe => 'Safe',
      };
}

extension StorageLocationIcon on StorageLocation? {
  IconData get icon => switch (this) {
        StorageLocation.fridge => Icons.kitchen_outlined,
        StorageLocation.freezer => Icons.ac_unit,
        StorageLocation.pantry => Icons.shelves,
        StorageLocation.bathroom => Icons.bathtub_outlined,
        StorageLocation.beautyProducts => Icons.spa_outlined,
        StorageLocation.other => Icons.inventory_2_outlined,
        null => Icons.help_outline,
      };
}

String describeDaysLeft(int days) => switch (days) {
      < -1 => 'Expired ${-days} days ago',
      -1 => 'Expired yesterday',
      0 => 'Expires today',
      1 => 'Expires tomorrow',
      _ => '$days days left',
    };

/// Shows a destructive-action confirmation and resolves to the user's choice.
Future<bool> confirmAction(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      icon: const Icon(Icons.warning_amber_rounded,
          color: AppColors.expiring, size: 28),
      title: Text(title, textAlign: TextAlign.center),
      content: Text(message, textAlign: TextAlign.center),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.pop(dialogContext, false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: AppColors.expired,
            minimumSize: const Size(48, 48),
          ),
          onPressed: () => Navigator.pop(dialogContext, true),
          child: Text(confirmLabel),
        ),
      ],
    ),
  );
  return result ?? false;
}

/// An item row with a status rail, meta tags, and a one-tap "used" action.
class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.item,
    required this.status,
    required this.onMarkUsed,
    this.onTap,
  });

  final FoodItem item;
  final ExpiryStatus status;
  final VoidCallback onMarkUsed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final location = item.location;
    final statusColor = status.colorFor(theme.brightness);

    return AppStatusCard(
      statusColor: statusColor,
      railWidth: 6,
      elevation: AppElevation.level1,
      padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.md, AppSpacing.md),
      onTap: onTap,
      trailing: _MarkUsedButton(
        onPressed: onMarkUsed,
        isExpiring: status == ExpiryStatus.expiring || status == ExpiryStatus.expired,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            item.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            describeDaysLeft(item.daysLeft),
            style: theme.textTheme.bodySmall?.copyWith(
              color: statusColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          _TagsRow(
            category: item.category,
            location: location,
            quantity: item.quantity,
          ),
        ],
      ),
    );
  }
}

/// Row of meta tags (category, location, quantity).
class _TagsRow extends StatelessWidget {
  const _TagsRow({
    required this.category,
    this.location,
    this.quantity = 1,
  });

  final String category;
  final StorageLocation? location;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        _AppTag(label: category),
        if (location != null)
          _AppTag(label: location!.label, icon: location!.icon),
        if (quantity > 1)
          _AppTag(label: '×$quantity', icon: Icons.format_list_numbered_outlined),
      ],
    );
  }
}

/// Improved tag with consistent sizing and icon support.
class _AppTag extends StatelessWidget {
  const _AppTag({required this.label, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xs),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: AppIconSize.sm, color: scheme.onSurfaceVariant),
            const SizedBox(width: AppSpacing.xs),
          ],
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

/// Mark-as-used button with clear affordance and state-aware styling.
class _MarkUsedButton extends StatelessWidget {
  const _MarkUsedButton({
    required this.onPressed,
    this.isExpiring = false,
  });

  final VoidCallback onPressed;
  final bool isExpiring;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Semantics(
      button: true,
      label: 'Mark as used',
      child: Material(
        color: isExpiring ? AppColors.brand : scheme.primaryContainer,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
            child: Icon(
              Icons.check_circle,
              size: AppIconSize.md,
              color: isExpiring ? Colors.white : scheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
