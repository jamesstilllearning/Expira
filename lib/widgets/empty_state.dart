import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class EmptyState extends StatelessWidget {
  const EmptyState(
      {super.key, required this.icon, required this.message, this.action});

  final IconData icon;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppColors.brand.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: AppColors.brand),
            ),
            const SizedBox(height: 18),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            if (action != null) ...[const SizedBox(height: 18), action!],
          ],
        ),
      ),
    );
  }
}
