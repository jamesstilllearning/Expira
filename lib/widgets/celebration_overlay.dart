import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../controllers/settings_controller.dart';
import '../models/consumption_record.dart';
import '../theme/app_colors.dart';
import 'pop_in.dart';

/// Plays a short confetti burst whenever an item is marked as used.
/// Does nothing when Celebration Effects is turned off in Settings.
class CelebrationOverlay extends StatefulWidget {
  const CelebrationOverlay({
    super.key,
    required this.consumptions,
    required this.settings,
    required this.child,
  });

  static const message = 'Nice work! Item used.';

  final Stream<ConsumptionRecord> consumptions;
  final SettingsController settings;
  final Widget child;

  @override
  State<CelebrationOverlay> createState() => _CelebrationOverlayState();
}

class _CelebrationOverlayState extends State<CelebrationOverlay>
    with SingleTickerProviderStateMixin {
  static const _particleCount = 28;
  static const _lightColors = [
    AppColors.brand,
    AppColors.soon,
    AppColors.expiring,
    AppColors.deep,
  ];
  static const _darkColors = [
    AppColors.brandLight,
    AppColors.soon,
    AppColors.expiring,
    AppColors.brandLight,
  ];

  late final AnimationController _animation;
  late final StreamSubscription<ConsumptionRecord> _subscription;
  final _random = math.Random();
  List<_Particle> _particles = const [];

  @override
  void initState() {
    super.initState();
    _animation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _subscription = widget.consumptions.listen(_onConsumed);
  }

  void _onConsumed(ConsumptionRecord _) {
    if (!widget.settings.settings.celebrationEffects) return;
    if (_animation.isAnimating) return;

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = isDark ? _darkColors : _lightColors;

    setState(() {
      _particles = List.generate(
        _particleCount,
        (_) => _Particle.random(_random, colors),
      );
    });
    _animation.forward(from: 0);
  }

  @override
  void dispose() {
    _subscription.cancel();
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: IgnorePointer(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                if (!_animation.isAnimating) return const SizedBox.shrink();
                final t = _animation.value;
                return Stack(
                  children: [
                    CustomPaint(
                      size: Size.infinite,
                      painter: _ConfettiPainter(_particles, t),
                    ),
                    const Align(
                      alignment: Alignment(0, -0.6),
                      child: PopIn(child: _CelebrationMessage()),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _Particle {
  const _Particle(
      {required this.dx,
      required this.dy,
      required this.color,
      required this.radius});

  factory _Particle.random(math.Random random, List<Color> colors) => _Particle(
        dx: random.nextDouble() * 2 - 1,
        dy: -(0.4 + random.nextDouble() * 0.6),
        color: colors[random.nextInt(colors.length)],
        radius: 4 + random.nextDouble() * 4,
      );

  final double dx;
  final double dy;
  final Color color;
  final double radius;
}

class _ConfettiPainter extends CustomPainter {
  _ConfettiPainter(this.particles, this.progress);

  final List<_Particle> particles;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final origin = Offset(size.width / 2, size.height * 0.45);
    final eased = Curves.easeOut.transform(progress);
    final fade = (1 - progress).clamp(0.0, 1.0);

    for (final p in particles) {
      final position = origin +
          Offset(
            p.dx * size.width * 0.45 * eased,
            p.dy * size.height * 0.35 * eased +
                size.height * 0.6 * progress * progress,
          );
      canvas.drawCircle(
        position,
        p.radius * (1 - progress * 0.5),
        Paint()..color = p.color.withValues(alpha: fade),
      );
    }
  }

  @override
  bool shouldRepaint(_ConfettiPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.particles != particles;
}

class _CelebrationMessage extends StatelessWidget {
  const _CelebrationMessage();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.brand,
      borderRadius: BorderRadius.circular(999),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Text(
          CelebrationOverlay.message,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
