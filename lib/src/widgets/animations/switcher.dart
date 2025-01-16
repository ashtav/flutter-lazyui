part of '../widget.dart';

class Switcher extends StatelessWidget {
  final bool show;
  final Widget child;
  final Duration duration;
  final Widget Function(Widget, Animation<double>)? transition;
  final Curve switchInCurve;
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
