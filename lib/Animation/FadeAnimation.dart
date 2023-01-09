import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween<double>(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween(
          "translateY",
          duration: Duration(milliseconds: 500),
          Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut);

    return PlayAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, animation) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.translate(
            offset: Offset(0, value.get("translateY")), child: child),
      ),
    );
  }
}
