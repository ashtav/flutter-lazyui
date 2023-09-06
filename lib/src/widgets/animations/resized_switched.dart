part of widget;

class ResizedSwitched extends StatelessWidget {
  final Widget? child;
  final Duration? duration;
  final bool show;
  final bool useOpacity;
  final Axis axis;
  final AlignmentGeometry alignment;
  const ResizedSwitched(
      {Key? key,
      this.child,
      this.duration,
      required this.show,
      this.useOpacity = true,
      this.axis = Axis.vertical,
      this.alignment = Alignment.centerLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        Widget resizedChild = Align(
          alignment: alignment,
          child: SizeTransition(
            axisAlignment: -1.0,
            axis: axis,
            sizeFactor: animation,
            child: child,
          ),
        );

        return useOpacity
            ? FadeTransition(opacity: animation, child: resizedChild)
            : resizedChild;
      },
      child: show ? child : const SizedBox.shrink(),
    );
  }
}