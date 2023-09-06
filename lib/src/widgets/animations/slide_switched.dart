part of widget;

class SlideSwitched extends StatelessWidget {
  final Widget? child;
  final Duration? duration;
  final SlideDirection direction;
  final bool withOpacity;

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
              : Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0));

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
        child: child);
  }
}
