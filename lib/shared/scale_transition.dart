import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ScaleWidget extends StatefulWidget {
  const ScaleWidget({super.key, required this.child});

  @override
  _ScaleWidgetState createState() => _ScaleWidgetState();

  final Widget child;
}

class _ScaleWidgetState extends State<ScaleWidget>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3))
          ..repeat();
    animation = new CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: widget.child,
    );
  }
}
