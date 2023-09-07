part of widget;

class ScaleSwitched extends StatelessWidget {
  final Widget? child;
  final Duration? duration;
  final Alignment? alignment;
  const ScaleSwitched({super.key, this.child, this.duration, this.alignment});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: duration ?? 250.ms,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            alignment: alignment ?? Alignment.centerLeft,
            child: child,
          );
        },
        child: child);
  }
}
