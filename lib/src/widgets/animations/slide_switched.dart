part of widget;

/// A widget that animates the sliding effect of its child widget with optional opacity transition.
///
/// The `SlideSwitched` widget is used to create smooth sliding animations for its child widget.
/// It animates the child widget's position either upwards or downwards based on the `direction`
/// property, and optionally applies an opacity transition during the animation.
///
/// Example usage:
/// ```dart
/// SlideSwitched(
///   duration: Duration(milliseconds: 500), // Animation duration (optional)
///   direction: SlideDirection.up, // Slide direction (up or down)
///   withOpacity: true, // Apply opacity transition (default is false)
///   child: Text('Slide up animation with opacity'), // The child widget to be animated
/// )
/// ```
class SlideSwitched extends StatelessWidget {
  /// The child widget to be animated.
  final Widget? child;

  /// The total duration of the animation (optional).
  final Duration? duration;

  /// The direction of the slide animation (up or down).
  final SlideDirection direction;

  /// Whether to apply opacity transition during the animation (default is false).
  final bool withOpacity;

  /// Creates a `SlideSwitched` widget.
  ///
  /// The [child] is the widget to be animated with sliding animation.
  /// The [duration] specifies the total duration of the animation (optional).
  /// The [direction] defines the direction of the slide animation (up or down).
  /// The [withOpacity] flag determines whether to apply opacity transition (default is false).
  const SlideSwitched({
    Key? key,
    this.child,
    this.duration,
    this.direction = SlideDirection.up,
    this.withOpacity = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final Tween<Offset> tween = direction == SlideDirection.up
            ? Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            : Tween<Offset>(
                begin: const Offset(0, -1), end: const Offset(0, 0));

        final slideTransition = SlideTransition(
          position: tween.animate(animation),
          child: child,
        );

        if (withOpacity) {
          return FadeTransition(
            opacity: animation,
            child: slideTransition,
          );
        } else {
          return slideTransition;
        }
      },
      child: child,
    );
  }
}
