import 'package:flutter/material.dart';

/// Atmospheric sky behind the top of the homepage. Shows the day sky in light
/// mode and the night sky in dark mode, following the theme's brightness, and
/// fades into the page background at the bottom so it blends into the cards.
class SkyBackdrop extends StatelessWidget {
  const SkyBackdrop({super.key, required this.height, this.child});

  static const dayAsset = 'assets/images/sky_day.jpg';
  static const nightAsset = 'assets/images/sky_night.jpg';

  final double height;

  /// Foreground content. Receives taps; the sky layers underneath do not.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final pageColor = theme.scaffoldBackgroundColor;

    return SizedBox(
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          IgnorePointer(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRect(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 600),
                    child: SizedBox.expand(
                      key: ValueKey(isDark),
                      child: Transform.scale(
                        // The source sky art has a large lens flare behind the
                        // header copy. Crop it consistently at every size.
                        scale: 1.6,
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          isDark ? nightAsset : dayAsset,
                          fit: BoxFit.cover,
                          alignment: Alignment.topLeft,
                          gaplessPlayback: true,
                        ),
                      ),
                    ),
                  ),
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.3, 0.7, 1.0],
                      colors: [
                        pageColor.withValues(alpha: 0),
                        pageColor.withValues(alpha: 0.3),
                        pageColor,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
