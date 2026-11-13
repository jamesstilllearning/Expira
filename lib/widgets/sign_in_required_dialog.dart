import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Shown when Chats is opened while signed out. [onContinue] runs after the
/// user confirms, and the dialog closes either way.
Future<void> showSignInRequiredDialog(
  BuildContext context, {
  required VoidCallback onContinue,
}) {
  return showDialog<void>(
    context: context,
    builder: (dialogContext) {
      final theme = Theme.of(dialogContext);
      final scheme = theme.colorScheme;

      return Dialog(
        backgroundColor: Color.alphaBlend(
            AppColors.brand.withValues(alpha: 0.08), scheme.surface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: scheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.error_outline,
                    size: 28, color: scheme.onSurface),
              ),
              const SizedBox(height: 18),
              Text('Sign in required', style: theme.textTheme.titleLarge),
              const SizedBox(height: 10),
              Text(
                "You need to sign in with Google before you can add or message housemates. You'll be taken to Settings to sign in.",
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: scheme.onSurfaceVariant),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    onContinue();
                  },
                  child: const Text('I understand'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      );
    },
  );
}
