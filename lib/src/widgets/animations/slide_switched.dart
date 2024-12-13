part of '../widget.dart';

/// A widget that applies a slide transition to its child when it changes.
///
/// The [SlideSwitched] widget uses an [AnimatedSwitcher] to animate its child
/// when it changes, combining a sliding effect with a fade transition. The slide
/// direction can be customized using the [direction] parameter.
///
/// * [child]: The widget to animate.
/// * [duration]: The duration of the animation (default is 250 milliseconds).
/// * [direction]: The direction of the slide (default is [SlideDirection.up]).
class SlideSwitched extends StatelessWidget {
  /// The widget to be animated when the switch occurs.
  ///
  /// This widget will slide in or out when the transition is triggered.
  final Widget? child;

  /// The duration of the slide and fade animation.
  ///
  /// Defaults to 250 milliseconds if not provided.
  final Duration? duration;

  /// The direction of the slide animation.
  ///
  /// You can specify the direction as either [SlideDirection.up] or [SlideDirection.down].
  final SlideDirection direction;

  /// Creates a [SlideSwitched] widget with customizable slide transition.
  ///
  /// The [child], [duration], and [direction] can be configured. By default,
  /// the [direction] is set to slide up, and [duration] defaults to 250 milliseconds.
  ///
  /// Example:
  /// ```dart
  /// notifier.watch((state) => SlideSwitched(
  ///   duration: 150.ms,
  ///   child: state.toggle ? Text('Hello World!', key: UniqueKey()) : Text('Slide up animation with opacity', key: UniqueKey()),
  /// ));
  const SlideSwitched({
    super.key,
    this.child,
    this.duration,
    this.direction = SlideDirection.up,
  });

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

        return FadeTransition(
          opacity: animation,
          child: slideTransition,
        );
      },
      child: child,
    );
  }
}
