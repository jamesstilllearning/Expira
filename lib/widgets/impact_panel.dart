import 'package:flutter/material.dart';

import '../models/impact_stats.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

class ImpactPanel extends StatelessWidget {
  const ImpactPanel({super.key, required this.stats});

  final ImpactStats stats;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.card),
      ),
      child: stats.totalConsumed == 0
          ? Row(
              children: [
                const Icon(Icons.eco_outlined, color: AppColors.brand),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Mark items as used to track usage and expiry patterns.',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _Metric(
                        icon: Icons.eco_outlined,
                        value: '${stats.savedFromExpiring}',
                        label: 'Estimated saved',
                      ),
                    ),
                    Expanded(
                      child: _Metric(
                        icon: Icons.check_circle_outline,
                        value: '${stats.usedBeforeExpiry}',
                        label: 'Used in time',
                      ),
                    ),
                    Expanded(
                      child: _Metric(
                        icon: Icons.percent,
                        value: '${(stats.usedBeforeExpiryRate * 100).round()}%',
                        label: 'On-time rate',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  'Estimate based on items used during their warning period.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.icon, required this.value, required this.label});

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.brand.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 18, color: AppColors.brand),
        ),
        const SizedBox(height: 10),
        Text(value, style: theme.textTheme.titleLarge),
        const SizedBox(height: 2),
        Text(
          label,
          style: theme.textTheme.labelSmall
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
