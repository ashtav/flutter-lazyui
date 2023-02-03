import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

class BlinkAnimate extends StatelessWidget {
  final Widget child;
  final bool animate;
  const BlinkAnimate({super.key, required this.child, this.animate = true});

  @override
  Widget build(BuildContext context) {
    if (!animate) {
      return child;
    }

    return Animator(
      tween: Tween<double>(begin: 0, end: 300),
      cycles: 0,
      builder: (context, anim, f) {
        double opacity = double.parse('${anim.value}');
        return AnimatedOpacity(duration: const Duration(milliseconds: 300), opacity: opacity >= 150 ? 1 : 0, child: child);
      },
    );
  }
}
