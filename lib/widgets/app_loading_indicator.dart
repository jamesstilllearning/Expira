import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'animated_character.dart';

/// Branded loading indicator featuring the Expira mascot with a pulse animation.
/// Respects reduced motion accessibility setting.
class AppLoadingIndicator extends StatefulWidget {
  const AppLoadingIndicator({
    super.key,
    this.size = 64,
    this.showText = false,
    this.text = 'Loading...',
  });

  final double size;
  final bool showText;
  final String text;

  @override
  State<AppLoadingIndicator> createState() => _AppLoadingIndicatorState();
}

class _AppLoadingIndicatorState extends State<AppLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulse;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDuration.normal,
    );
    _pulse = Tween(begin: 0.9, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
    } else {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ScaleTransition(
            scale: _pulse,
            child: Image.asset(
              AnimatedCharacter.assetPath,
              width: widget.size,
              height: widget.size,
              fit: BoxFit.contain,
              semanticLabel: 'Expira loading',
            ),
          ),
          if (widget.showText) ...[
            const SizedBox(height: AppSpacing.lg),
            Text(
              widget.text,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: scheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

/// Small inline loading indicator for buttons and tight spaces.
class AppInlineLoadingIndicator extends StatelessWidget {
  const AppInlineLoadingIndicator({
    super.key,
    this.size = 20,
    this.strokeWidth = 2.5,
    this.color,
  });

  final double size;
  final double strokeWidth;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation(color ?? scheme.onPrimary),
      ),
    );
  }
}

/// Full-screen loading overlay with mascot and optional message.
class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({
    super.key,
    this.message,
    this.showMascot = true,
  });

  final String? message;
  final bool showMascot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return ColoredBox(
      color: scheme.surface,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showMascot)
                const AppLoadingIndicator(size: 80),
              if (message != null) ...[
                const SizedBox(height: AppSpacing.xl),
                Text(
                  message!,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: scheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}