import 'package:flutter/material.dart';

import '../globals.dart';

class AnimatedSizeFactor extends StatefulWidget {
  const AnimatedSizeFactor(
      {Key key,
      @required this.child,
      @required this.fullSized,
      this.sizeFactor = 1.0,
      this.duration = defaultAnimationDuration,
      this.curve = Curves.easeIn})
      : assert(child != null),
        assert(fullSized != null),
        super(key: key);

  final Widget child;
  final bool fullSized;
  final double sizeFactor;
  final Duration duration;
  final Curve curve;
  @override
  _AnimatedSizeState createState() => _AnimatedSizeState();
}

class _AnimatedSizeState extends State<AnimatedSizeFactor> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _sizeFactor;

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
    _sizeFactor = Tween<double>(
      begin: 0,
      end: widget.sizeFactor,
    ).animate(CurvedAnimation(curve: widget.curve, parent: _animationController));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initTurnsAnimation();
  }

  @override
  void didUpdateWidget(AnimatedSizeFactor oldWidget) {
    super.didUpdateWidget(oldWidget);
    _initTurnsAnimation();
    if (oldWidget.fullSized != widget.fullSized) {
      if (widget.fullSized) {
        _animationController.reverse();
      } else {
        _animationController.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: _sizeFactor,
      child: widget.child,
    );
  }
}
