import 'dart:math' as math;

import 'package:flutter/material.dart';

/// The Expira mascot with a welcoming wobble on first display and a slow idle
/// float. The artwork is a single flat image, so the wave is a whole-body
/// motion pivoting at the feet. The waving arm is not moved on its own.
class AnimatedCharacter extends StatefulWidget {
  const AnimatedCharacter({super.key, this.size = 112});

  static const assetPath = 'assets/images/character/expira_mascot.png';

  final double size;

  @override
  State<AnimatedCharacter> createState() => _AnimatedCharacterState();
}

class _AnimatedCharacterState extends State<AnimatedCharacter>
    with TickerProviderStateMixin {
  late final AnimationController _welcome;
  late final AnimationController _idle;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _welcome = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _idle = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2800));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_started) return;
    _started = true;
    // Respect reduced motion: the character simply stays at rest.
    if (MediaQuery.disableAnimationsOf(context)) return;
    _welcome.forward();
    _idle.repeat(reverse: true);
  }

  @override
  void dispose() {
    _welcome.dispose();
    _idle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_welcome, _idle]),
      builder: (context, child) {
        // A wobble that decays over the welcome, then a slow float.
        final welcome = _welcome.value;
        final wobble = math.sin(welcome * math.pi * 4) * (1 - welcome) * 0.08;
        final float = -4 * math.sin(_idle.value * math.pi);
        return Transform.translate(
          offset: Offset(0, float),
          child: Transform.rotate(
            angle: wobble,
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        );
      },
      child: Image.asset(
        AnimatedCharacter.assetPath,
        width: widget.size,
        height: widget.size,
        fit: BoxFit.contain,
        semanticLabel: 'Expira mascot',
      ),
    );
  }
}
