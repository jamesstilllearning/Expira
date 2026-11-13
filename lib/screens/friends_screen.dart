import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Friends tab. Shows the signed-out state until account sync exists. Nothing
/// here fetches or stores friend data.
class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key, required this.onOpenSettings});

  final VoidCallback onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final muted = theme.colorScheme.onSurfaceVariant;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 12, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Friends', style: theme.textTheme.headlineMedium),
                      const SizedBox(height: 4),
                      Text(
                        'Connect and chat with housemates.',
                        style:
                            theme.textTheme.bodyMedium?.copyWith(color: muted),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  tooltip: 'Settings',
                  onPressed: onOpenSettings,
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: AppColors.brand.withValues(alpha: 0.14),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.groups_outlined,
                            size: 36, color: AppColors.brand),
                      ),
                      const SizedBox(height: 20),
                      Text('Sign in required',
                          style: theme.textTheme.titleLarge),
                      const SizedBox(height: 8),
                      Text(
                        'Sign in with Google to get your friend code, add housemates, and start chatting.',
                        textAlign: TextAlign.center,
                        style:
                            theme.textTheme.bodyMedium?.copyWith(color: muted),
                      ),
                      const SizedBox(height: 24),
                      FilledButton.icon(
                        onPressed: onOpenSettings,
                        icon: const Icon(Icons.arrow_forward),
                        label: const Text('Go to Settings'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
