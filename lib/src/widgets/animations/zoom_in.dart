part of widget;

/// A widget that animates the zoom-in effect of its child widget.
///
/// The `ZoomIn` widget is used to create a smooth zoom-in animation for its child widget.
/// It animates the scaling of the child widget from a smaller size to its original size.
///
/// Example usage:
/// ```dart
/// ZoomIn(
///   delay: 500, // Delay before animation starts in milliseconds (optional)
///   animate: true, // Whether to animate (default is true)
///   child: Image.asset('assets/image.png'), // The child widget to be animated
/// )
/// ```
class ZoomIn extends StatefulWidget {
  /// The child widget to be animated.
  final Widget child;

  /// Delay before the animation starts in milliseconds (optional).
  final int? delay;

  /// Whether to animate (default is true).
  final bool animate;

  /// Creates a `ZoomIn` widget.
  ///
  /// The [child] is the widget to be animated with a zoom-in effect.
  /// The [delay] specifies the delay before the animation starts in milliseconds (optional).
  /// The [animate] flag determines whether to animate the child widget (default is true).
  const ZoomIn({
    Key? key,
    required this.child,
    this.delay,
    this.animate = true,
  }) : super(key: key);

  @override
  State<ZoomIn> createState() => _ZoomInState();
}

class _ZoomInState extends State<ZoomIn> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  Timer? timer;

  void init() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.decelerate);

    if (widget.animate) {
      widget.delay == null
          ? controller?.forward()
          : timer = Timer(Duration(milliseconds: widget.delay!), () {
              controller?.forward();
            });
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    controller?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? ScaleTransition(scale: scaleAnimation!, child: widget.child)
        : widget.child;
  }
}
