part of '../widget.dart';

/// Enum representing the possible directions for slide animations.
///
/// The [SlideAxis] enum defines the direction in which a widget can be animated.
/// It is used to control the sliding animation in widgets like [SlideAnimate].
///
/// The available directions are:
/// - [bottomToTop]: Slide the widget from the bottom to the top.
/// - [topToBottom]: Slide the widget from the top to the bottom.
/// - [leftToRight]: Slide the widget from the left to the right.
/// - [rightToLeft]: Slide the widget from the right to the left.
///
/// Example:
/// ```dart
/// SlideAnimate(
///   child: Text('Slide example!'),
///   axis: SlideAxis.leftToRight,
/// );
/// ```
enum SlideAxis {
  /// Slide the widget from the bottom to the top.
  bottomToTop,

  /// Slide the widget from the top to the bottom.
  topToBottom,

  /// Slide the widget from the left to the right.
  leftToRight,

  /// Slide the widget from the right to the left.
  rightToLeft
}

/// A widget that animates its child to slide in and out from a specified direction,
/// with an optional fade effect.
///
/// The [SlideAnimate] widget provides a sliding transition for its child, allowing it
/// to appear and disappear based on the [show] parameter. The slide direction is
/// determined by the [axis] parameter, and the speed of the animation can be controlled
/// by [speed]. If [animate] is set to false, the widget will remain static without any
/// animation.
///
/// ### Parameters:
///
/// * [child]: The widget to be animated.
/// * [show]: Determines if the child should be visible or hidden. If false, the widget
///   will animate out of view.
/// * [delay]: Optional delay before the animation starts, in milliseconds.
/// * [speed]: Controls the speed of the sliding animation. A higher value makes the
///   animation faster.
/// * [animate]: Whether the widget should animate or not. If set to false, the child
///   will be rendered without any animation.
/// * [axis]: The direction of the slide animation. Defaults to [SlideAxis.bottomToTop].
///
/// ### Example:
///
/// ```dart
/// SlideAnimate(
///   child: Text('Slide me!'),
///   show: true,
///   speed: 0.5,
///   axis: SlideAxis.leftToRight,
///   animate: true,
/// );
/// ```
///
/// In the example, the text widget will slide in from the left and will be visible when
/// [show] is true. The animation speed is set by [speed] and the animation is enabled by
/// the [animate] parameter.
class SlideAnimate extends StatefulWidget {
  /// The widget that will be animated.
  final Widget child;

  /// Whether the widget should be shown (animated in) or hidden (animated out).
  final bool show;

  /// An optional delay in milliseconds before the animation starts.
  final int? delay;

  /// The speed of the sliding animation. A higher value results in a faster animation.
  final double speed;

  /// Whether to apply the animation or not. If false, the child will appear without animation.
  final bool animate;

  /// The direction in which the child will slide.
  /// Defaults to [SlideAxis.bottomToTop].
  final SlideAxis axis;

  /// Animation duration
  final Duration? duration;

  /// Creates a [SlideAnimate] widget.
  ///
  /// * [child] is required to be provided.
  /// * [show] defaults to `true`, meaning the widget will be shown.
  /// * [speed] defaults to `0.5`, controlling the speed of the slide.
  /// * [animate] defaults to `true`, meaning the animation is active by default.

  const SlideAnimate(
      {super.key,
      required this.child,
      this.show = true,
      this.delay,
      this.speed = 0.50,
      this.animate = true,
      this.axis = SlideAxis.bottomToTop,
      this.duration});

  @override
  State<SlideAnimate> createState() => _SlideAnimateState();
}

class _SlideAnimateState extends State<SlideAnimate>
    with TickerProviderStateMixin {
  AnimationController? _animController;
  Animation<Offset>? _animOffset;
  Timer? timer;

  /// This method returns the proper offset based on the [SlideAxis] selected.
  Offset _getBeginOffset() {
    switch (widget.axis) {
      case SlideAxis.bottomToTop:
        return Offset(0.0, widget.speed);
      case SlideAxis.topToBottom:
        return Offset(0.0, -widget.speed);
      case SlideAxis.leftToRight:
        return Offset(-widget.speed, 0.0);
      case SlideAxis.rightToLeft:
        return Offset(widget.speed, 0.0);
    }
  }

  void init() {
    _animController = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 300));

    final curve =
        CurvedAnimation(curve: Curves.decelerate, parent: _animController!);

    _animOffset = Tween<Offset>(
      begin: _getBeginOffset(), // Use the calculated offset based on axis
      end: Offset.zero, // End at the center
    ).animate(curve);

    if (widget.delay != null && widget.delay! > 0) {
      timer = Timer(Duration(milliseconds: widget.delay!), () {
        if (widget.show) {
          _animController?.forward(); // Show the widget after delay
        } else {
          _animController?.reverse(); // Hide the widget after delay
        }
      });
    } else {
      if (widget.show) {
        _animController?.forward(); // Show the widget without delay
      } else {
        _animController?.reverse(); // Hide the widget without delay
      }
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void didUpdateWidget(covariant SlideAnimate oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the axis or show status has changed
    if (widget.axis != oldWidget.axis ||
        widget.show != oldWidget.show ||
        widget.duration != oldWidget.duration) {
      // Reset animation with the new axis
      _animOffset = Tween<Offset>(
        begin: _getBeginOffset(), // Recalculate based on new axis
        end: Offset.zero,
      ).animate(
          CurvedAnimation(parent: _animController!, curve: Curves.decelerate));

      // Restart the animation based on the new show status
      if (widget.show) {
        _animController?.forward();
      } else {
        _animController?.reverse();
      }
    }
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
            child: SlideTransition(
              position: _animOffset!,
              child: widget.child,
            ),
          )
        : widget.child;
  }
}
