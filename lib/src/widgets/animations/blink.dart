part of widget;

/// A [StatelessWidget] that provides a blinking animation effect to its child.
///
/// The `BlinkAnimate` widget animates the opacity of the `child` widget, creating a blinking effect.
/// This can be turned off by setting `animate` to `false`.
/// You can also specify the `duration` of the blink animation, if left null, it defaults to 300 milliseconds.
///
/// Example usage:
/// ```dart
/// BlinkAnimate(
///   child: Text('Hello, world!'),
/// );
/// ```

class BlinkAnimate extends StatelessWidget {
  final Widget child;
  final bool animate;
  final Duration? duration;
  const BlinkAnimate(
      {super.key, required this.child, this.animate = true, this.duration});

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
        return AnimatedOpacity(
            duration: duration ?? const Duration(milliseconds: 300),
            opacity: opacity >= 150 ? 1 : 0,
            child: child);
      },
    );
  }
}
