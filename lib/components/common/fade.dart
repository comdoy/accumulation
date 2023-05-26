import 'package:flutter/material.dart';

class FadeTransitionView extends StatefulWidget {
  const FadeTransitionView({super.key, required this.child, this.speed = 500});
  final Widget child;

  final int speed;

  @override
  FadeTransitionViewState createState() => FadeTransitionViewState();
}

class FadeTransitionViewState extends State<FadeTransitionView>
    with TickerProviderStateMixin {
  late AnimationController _animationContainer;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationContainer = AnimationController(
      duration: Duration(milliseconds: widget.speed),
      vsync: this,
    );
    _animation =
        CurvedAnimation(parent: _animationContainer, curve: Curves.easeIn);
    _animationContainer.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationContainer.dispose();
    super.dispose();
  }
}
