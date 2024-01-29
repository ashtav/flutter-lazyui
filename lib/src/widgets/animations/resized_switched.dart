part of widget;

/// A widget that animates the resizing and switching of its child widget.
///
/// The `ResizedSwitched` widget is useful for creating smooth transitions
/// when switching between different child widgets. It can animate the size
/// and opacity of its child widget when the `show` property changes.
///
/// Example usage:
/// ```dart
/// ResizedSwitched(
///   duration: Duration(milliseconds: 500), // Animation duration
///   show: isSwitched, // A boolean flag to control showing or hiding the child
///   useOpacity: true, // Apply opacity transition (default is true)
///   axis: Axis.vertical, // Axis of the size transition (vertical or horizontal)
///   alignment: Alignment.centerLeft, // Alignment of the child within the parent
///   child: Text("Hello, World!"), // The child widget to be animated
/// )
/// ```
class ResizedSwitched extends StatelessWidget {
  /// The child widget to be animated.
  final Widget? child;

  /// The total duration of the animation.
  final Duration? duration;

  /// A boolean flag to control whether to show or hide the child.
  final bool show;

  /// Whether to apply opacity transition when showing/hiding the child (default is true).
  final bool useOpacity;

  /// The axis of the size transition (vertical or horizontal).
  final Axis axis;

  /// The alignment of the child within the parent.
  final AlignmentGeometry alignment;

  /// Creates a `ResizedSwitched` widget.
  ///
  /// The [child] is the widget to be animated when switching.
  /// The [duration] specifies the total duration of the animation.
  /// The [show] flag determines whether to show or hide the child.
  /// The [useOpacity] flag controls whether to apply opacity transition (default is true).
  /// The [axis] defines the axis of the size transition (vertical or horizontal).
  /// The [alignment] sets the alignment of the child within the parent.
  const ResizedSwitched({
    Key? key,
    this.child,
    this.duration,
    required this.show,
    this.useOpacity = true,
    this.axis = Axis.vertical,
    this.alignment = Alignment.centerLeft,
  }) : super(key: key);

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
