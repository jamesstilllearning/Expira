import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_theme.dart';

/// Homepage summary of inventory urgency. The ring shows the overall mix, the
/// rows list each band, and the whole card opens the inventory. Counts come
/// from the caller; this widget only presents them.
class InventoryHealthCard extends StatelessWidget {
  const InventoryHealthCard({
    super.key,
    required this.expiring,
    required this.soon,
    required this.safe,
    required this.onTap,
  });

  final int expiring;
  final int soon;
  final int safe;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final muted = scheme.onSurfaceVariant;
    final total = expiring + soon + safe;

    final summary = total == 0
        ? 'Add items to see how your inventory is doing.'
        : '$safe of $total items are in good shape.';

    return Semantics(
      button: true,
      excludeSemantics: true,
      label: '$summary $expiring expiring, $soon soon, $safe safe.',
      child: Material(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(AppRadius.card + 4),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(summary,
                    style: theme.textTheme.bodyMedium?.copyWith(color: muted)),
                const SizedBox(height: 18),
                Row(
                  children: [
                    _HealthRing(expiring: expiring, soon: soon, safe: safe),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          _StatusRow(
                            label: 'Expiring',
                            hint: 'Use these first',
                            count: expiring,
                            color: AppColors.expiringFor(theme.brightness),
                          ),
                          _StatusRow(
                            label: 'Soon',
                            hint: 'Plan to use them',
                            count: soon,
                            color: AppColors.soonFor(theme.brightness),
                          ),
                          _StatusRow(
                            label: 'Safe',
                            hint: 'No action needed',
                            count: safe,
                            color: AppColors.safeFor(theme.brightness),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Multi-segment ring with the safe share in the centre. Arcs sweep in on
/// first appearance; the animation runs once and never blocks interaction.
class _HealthRing extends StatefulWidget {
  const _HealthRing({
    required this.expiring,
    required this.soon,
    required this.safe,
  });

  final int expiring;
  final int soon;
  final int safe;

  @override
  State<_HealthRing> createState() => _HealthRingState();
}

class _HealthRingState extends State<_HealthRing>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDuration.slow,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
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
      _controller.forward();
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
    final total = widget.expiring + widget.soon + widget.safe;
    final safePercent = total == 0 ? null : (widget.safe * 100 / total).round();

    final segments = total == 0
        ? const <({double fraction, Color color})>[]
        : [
            (
              fraction: widget.expiring / total,
              color: AppColors.expiringFor(theme.brightness)
            ),
            (
              fraction: widget.soon / total,
              color: AppColors.soonFor(theme.brightness)
            ),
            (
              fraction: widget.safe / total,
              color: AppColors.safeFor(theme.brightness)
            ),
          ];

    return SizedBox(
      width: 112,
      height: 112,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) => CustomPaint(
          painter: _RingPainter(
            segments: segments,
            progress: _animation.value,
            trackColor: theme.colorScheme.surfaceContainerHighest,
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  safePercent == null ? '–' : '$safePercent%',
                  style: theme.textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
                Text(
                  'safe',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter(
      {required this.segments,
      required this.progress,
      required this.trackColor});

  final List<({double fraction, Color color})> segments;
  final double progress;
  final Color trackColor;

  static const _stroke = 10.0;
  static const _gap = 0.07;

  @override
  void paint(Canvas canvas, Size size) {
    final arcRect = (Offset.zero & size).deflate(_stroke / 2);

    canvas.drawArc(
      arcRect,
      0,
      math.pi * 2,
      false,
      Paint()
        ..color = trackColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = _stroke,
    );

    var start = -math.pi / 2;
    for (final segment in segments) {
      final full = segment.fraction * math.pi * 2;
      final sweep = math.max(0.0, full * progress - _gap);
      if (sweep > 0) {
        canvas.drawArc(
          arcRect,
          start,
          sweep,
          false,
          Paint()
            ..color = segment.color
            ..style = PaintingStyle.stroke
            ..strokeWidth = _stroke
            ..strokeCap = StrokeCap.round,
        );
      }
      start += full;
    }
  }

  @override
  bool shouldRepaint(_RingPainter oldDelegate) =>
      oldDelegate.progress != progress ||
      oldDelegate.trackColor != trackColor ||
      oldDelegate.segments.length != segments.length ||
      !_sameFractions(oldDelegate.segments, segments);

  static bool _sameFractions(
    List<({double fraction, Color color})> a,
    List<({double fraction, Color color})> b,
  ) {
    for (var i = 0; i < a.length; i++) {
      if (a[i].fraction != b[i].fraction || a[i].color != b[i].color) {
        return false;
      }
    }
    return true;
  }
}

class _StatusRow extends StatelessWidget {
  const _StatusRow({
    required this.label,
    required this.hint,
    required this.count,
    required this.color,
  });

  final String label;
  final String hint;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final active = count > 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: active ? color : theme.colorScheme.outlineVariant,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  hint,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$count',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w800,
              color: active ? color : theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
