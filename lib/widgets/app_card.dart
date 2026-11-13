import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Unified card widget with consistent elevation, border radius, and surface color.
/// Use this instead of raw Container/Material for cards throughout the app.
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.elevation = AppElevation.level1,
    this.padding,
    this.margin,
    this.onTap,
    this.borderRadius,
    this.color,
    this.border,
    this.clipBehavior = Clip.antiAlias,
  });

  final Widget child;
  final double elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? color;
  final BoxBorder? border;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final effectiveColor = color ?? scheme.surface;
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(AppRadius.card);

    final card = Material(
      color: effectiveColor,
      elevation: elevation,
      borderRadius: effectiveBorderRadius,
      clipBehavior: clipBehavior,
      shadowColor: scheme.shadow.withValues(alpha: 0.1),
      child: InkWell(
        onTap: onTap,
        borderRadius: effectiveBorderRadius,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );

    if (margin != null) {
      return Padding(padding: margin!, child: card);
    }
    return card;
  }
}

/// A card with a colored status rail on the left edge.
/// Used for item cards and similar list items with status indicators.
class AppStatusCard extends StatelessWidget {
  const AppStatusCard({
    super.key,
    required this.child,
    required this.statusColor,
    this.railWidth = 6,
    this.elevation = AppElevation.level1,
    this.padding,
    this.onTap,
    this.trailing,
  });

  final Widget child;
  final Color statusColor;
  final double railWidth;
  final double elevation;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Material(
      color: scheme.surface,
      elevation: elevation,
      borderRadius: BorderRadius.circular(AppRadius.card),
      clipBehavior: Clip.antiAlias,
      shadowColor: scheme.shadow.withValues(alpha: 0.1),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.card),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(width: railWidth, color: statusColor),
              Expanded(
                child: Padding(
                  padding: padding ?? const EdgeInsets.all(AppSpacing.lg),
                  child: child,
                ),
              ),
              if (trailing != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, AppSpacing.md, AppSpacing.md, AppSpacing.md),
                  child: trailing,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A card for form sections with a title and content.
class AppFormSection extends StatelessWidget {
  const AppFormSection({
    super.key,
    required this.title,
    required this.child,
    this.action,
    this.spacing = AppSpacing.lg,
  });

  final String title;
  final Widget child;
  final Widget? action;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: AppSpacing.md, bottom: AppSpacing.sm),
          child: Row(
            children: [
              Text(
                title.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (action != null) ...[
                const SizedBox(width: AppSpacing.sm),
                action!,
              ],
            ],
          ),
        ),
        AppCard(
          elevation: AppElevation.level0,
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: child,
        ),
        SizedBox(height: spacing),
      ],
    );
  }
}