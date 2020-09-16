import 'package:flutter/material.dart';
import 'package:responsive_demo/globals.dart';

class AnimatedRotation extends StatefulWidget {
  const AnimatedRotation(
      {Key key,
      @required this.child,
      @required this.rotated,
      this.turns = 1.0,
      durat,
      this.duration = defaultAnimationDuration,
      this.curve = Curves.easeIn})
      : assert(child != null),
        assert(rotated != null),
        super(key: key);

  final Widget child;
  final bool rotated;
  final double turns;
  final Duration duration;
  final Curve curve;

  @override
  _AnimateRotationState createState() => _AnimateRotationState();
}

class _AnimateRotationState extends State<AnimatedRotation> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _turns;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: widget.duration);
    _initTurnsAnimation();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void _initTurnsAnimation() {
    _turns = Tween<double>(
      begin: 0,
      end: widget.turns,
    ).animate(CurvedAnimation(curve: widget.curve, parent: _animationController));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initTurnsAnimation();
  }

  @override
  void didUpdateWidget(AnimatedRotation oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initTurnsAnimation();
    if (oldWidget.rotated != widget.rotated) {
      if (widget.rotated) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _turns,
      child: widget.child,
    );
  }
}
