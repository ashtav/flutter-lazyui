part of '../widget.dart';

/// A widget that animates between showing and hiding its child using an [AnimatedSwitcher].
///
/// The [Switcher] widget provides a convenient way to animate the appearance and disappearance
/// of a child widget, with customizable transition, duration, and animation curves.
class Switcher extends StatelessWidget {
  /// Whether to show the child widget.
  final bool show;

  /// The widget to display when [show] is true.
  final Widget child;

  /// The duration of the switch animation.
  final Duration duration;

  /// A custom transition builder for the switch animation.
  final Widget Function(Widget, Animation<double>)? transition;

  /// The curve used when switching in the child.
  final Curve switchInCurve;

  /// The curve used when switching out the child.
  final Curve switchOutCurve;

  const Switcher(
      {super.key,
      this.show = false,
      required this.child,
      this.duration = const Duration(milliseconds: 250),
      this.transition,
      this.switchInCurve = Curves.linear,
      this.switchOutCurve = Curves.linear});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      switchInCurve: switchInCurve,
      switchOutCurve: switchOutCurve,
      transitionBuilder: transition ??
          (Widget child, Animation<double> animation) {
            Widget resizedChild = Align(
              alignment: Alignment.center,
              child: SizeTransition(
                axisAlignment: -1.0,
                sizeFactor: animation,
                child: child,
              ),
            );

            return FadeTransition(opacity: animation, child: resizedChild);
          },
      child: show
          ? SizedBox(key: UniqueKey(), child: child)
          : const SizedBox.shrink(),
    );
  }
}
