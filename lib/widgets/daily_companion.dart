import 'package:flutter/material.dart';

import 'animated_character.dart';

/// The mascot beside a speech bubble carrying the day's message.
class DailyCompanion extends StatelessWidget {
  const DailyCompanion({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const AnimatedCharacter(size: 108),
        const SizedBox(width: 4),
        Expanded(child: _SpeechBubble(message: message)),
      ],
    );
  }
}

class _SpeechBubble extends StatelessWidget {
  const _SpeechBubble({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: CustomPaint(
        painter: _SpeechBubblePainter(surfaceColor: scheme.surface),
        child: Container(
          margin: const EdgeInsets.only(left: 8, bottom: 12),
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          decoration: BoxDecoration(
            color: scheme.surface,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Hello!',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: scheme.primary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SpeechBubblePainter extends CustomPainter {
  _SpeechBubblePainter({required this.surfaceColor});

  final Color surfaceColor;

  @override
  void paint(Canvas canvas, Size size) {
    const radius = 18.0;
    const tailWidth = 20.0;
    const tailHeight = 16.0;
    const tailOffset = 8.0;

    final paint = Paint()..color = surfaceColor;

    final path = Path()
      ..moveTo(tailOffset, radius)
      ..lineTo(tailOffset, tailHeight)
      ..quadraticBezierTo(
        tailOffset + tailWidth / 2,
        0,
        tailOffset + tailWidth,
        tailHeight,
      )
      ..lineTo(tailOffset + tailWidth, radius)
      ..arcToPoint(
        Offset(size.width - radius, radius),
        radius: const Radius.circular(radius),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(size.width, size.height - radius),
        radius: const Radius.circular(radius),
        clockwise: false,
      )
      ..arcToPoint(
        Offset(radius, size.height),
        radius: const Radius.circular(radius),
        clockwise: false,
      )
      ..arcToPoint(
        const Offset(0, radius),
        radius: const Radius.circular(radius),
        clockwise: false,
      )
      ..close();

    canvas.drawShadow(path, Colors.black.withValues(alpha: 0.10), 16, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_SpeechBubblePainter oldDelegate) =>
      oldDelegate.surfaceColor != surfaceColor;
}
