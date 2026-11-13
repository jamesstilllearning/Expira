import 'package:flutter/material.dart';

/// Pops its child into view: scales from 0.85 to a small 1.05 overshoot, then
/// settles at 1.0 while fading in. Plays once when first built. With reduced
/// motion enabled, the child appears at rest.
class PopIn extends StatefulWidget {
  const PopIn(
      {super.key,
      required this.child,
      this.duration = const Duration(milliseconds: 380)});

  final Widget child;
  final Duration duration;

  @override
  State<PopIn> createState() => _PopInState();
}

class _PopInState extends State<PopIn> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _fade;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _scale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(begin: 0.85, end: 1.05)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 55,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.05, end: 1.0)
            .chain(CurveTween(curve: Curves.easeInOut)),
        weight: 45,
      ),
    ]).animate(_controller);
    _fade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, 0.45, curve: Curves.easeOut),
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
    return FadeTransition(
      opacity: _fade,
      child: ScaleTransition(scale: _scale, child: widget.child),
    );
  }
}
