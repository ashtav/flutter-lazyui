part of widget;

/// A widget that animates the sliding effect from the left to the right of its child widget.
///
/// The `SlideRight` widget is used to create smooth sliding animations for its child widget.
/// It animates the child widget's position from the left to its original position.
///
/// Example usage:
/// ```dart
/// SlideRight(
///   delay: 500, // Delay before animation starts in milliseconds (optional)
///   speed: 0.5, // Animation speed (default is 0.50)
///   animate: true, // Whether to animate (default is true)
///   child: Text('Slide right animation'), // The child widget to be animated
/// )
/// ```
class SlideRight extends StatefulWidget {
  /// The child widget to be animated.
  final Widget child;

  /// Delay before the animation starts in milliseconds (optional).
  final int? delay;

  /// Animation speed (default is 0.50).
  final double speed;

  /// Whether to animate (default is true).
  final bool animate;

  /// Creates a `SlideRight` widget.
  ///
  /// The [child] is the widget to be animated with a sliding right animation.
  /// The [delay] specifies the delay before the animation starts in milliseconds (optional).
  /// The [speed] defines the animation speed (default is 0.50).
  /// The [animate] flag determines whether to animate the child widget (default is true).
  const SlideRight({
    Key? key,
    required this.child,
    this.delay,
    this.speed = 0.50,
    this.animate = true,
  }) : super(key: key);

  @override
  State<SlideRight> createState() => _SlideRightState();
}

class _SlideRightState extends State<SlideRight> with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  Timer? timer;

  void init() {
    _animController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));

    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController!);
    _animOffset =
        Tween<Offset>(begin: Offset(-widget.speed, 0.0), end: Offset.zero)
            .animate(curve);

    widget.delay == null
        ? _animController?.forward()
        : timer = Timer(Duration(milliseconds: widget.delay!), () {
            _animController?.forward();
          });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    _animController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.animate
        ? FadeTransition(
            opacity: _animController!,
            child: SlideTransition(position: _animOffset!, child: widget.child))
        : widget.child;
  }
}
