import 'package:flutter/material.dart';

/// Shows one of [children] at a time, sliding in from the side the user moved
/// toward and nudging the previous page slightly the other way.
///
/// Every child stays mounted (inside [Offstage]), so scroll positions, text
/// input, and other state survive tab switches. Direction comes from the
/// children's order: a higher index enters from the right, a lower one from
/// the left.
class DirectionalTabView extends StatefulWidget {
  const DirectionalTabView({
    super.key,
    required this.index,
    required this.children,
    this.duration = const Duration(milliseconds: 320),
  });

  final int index;
  final List<Widget> children;
  final Duration duration;

  @override
  State<DirectionalTabView> createState() => _DirectionalTabViewState();
}

class _DirectionalTabViewState extends State<DirectionalTabView>
    with SingleTickerProviderStateMixin {
  static const _outgoingShift = 0.25;

  late final AnimationController _controller;
  late final Animation<double> _curve;
  late int _shownIndex;
  int? _leavingIndex;
  int _direction = 1;

  @override
  void initState() {
    super.initState();
    _shownIndex = widget.index;
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..value = 1;
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic);
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        setState(() => _leavingIndex = null);
      }
    });
  }

  @override
  void didUpdateWidget(covariant DirectionalTabView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.index != _shownIndex) _transitionTo(widget.index);
  }

  void _transitionTo(int target) {
    _direction = target > _shownIndex ? 1 : -1;
    _leavingIndex = _shownIndex;
    _shownIndex = target;

    if (MediaQuery.disableAnimationsOf(context)) {
      _controller.value = 1;
      _leavingIndex = null;
    } else {
      // Restarting from zero also handles rapid taps: the newest target wins.
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _curve,
      builder: (context, _) {
        final width = MediaQuery.sizeOf(context).width;
        final t = _curve.value;

        // Draw the incoming page last so it sits above the one it replaces.
        final order = [
          for (var i = 0; i < widget.children.length; i++)
            if (i != _shownIndex) i,
          _shownIndex,
        ];

        return Stack(
          fit: StackFit.expand,
          children: [for (final i in order) _pageFor(i, t, width)],
        );
      },
    );
  }

  Widget _pageFor(int index, double t, double width) {
    final isIncoming = index == _shownIndex;
    final isLeaving = index == _leavingIndex;

    double dx = 0;
    double opacity = 1;
    if (isIncoming && _leavingIndex != null) {
      dx = (1 - t) * _direction * width;
      opacity = t;
    } else if (isLeaving) {
      dx = -t * _direction * width * _outgoingShift;
      opacity = 1 - t;
    }

    return Offstage(
      key: ValueKey(index),
      offstage: !(isIncoming || isLeaving),
      child: Opacity(
        opacity: opacity.clamp(0.0, 1.0),
        child: Transform.translate(
          offset: Offset(dx, 0),
          child: widget.children[index],
        ),
      ),
    );
  }
}
