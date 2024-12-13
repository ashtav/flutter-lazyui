part of '../widget.dart';

/// When you don't need to provide any [child], you can use any widget as the [child] parameter. If no [child] is needed, simply provide an empty Container().
/// The [delay] parameter utilizes a [Timer] to delay the animation, and its default value is zero.
/// To create a pulsing effect, you can set the [repeat] parameter to true.

class RippleAnimation extends StatefulWidget {
  ///initialize the ripple animation
  const RippleAnimation({
    this.child,
    this.color = Colors.black,
    this.delay = const Duration(),
    this.repeat = true,
    this.bordered = false,
    this.outlined = false,
    this.strokeWidth,
    this.minRadius = 60,
    this.ripplesCount = 5,
    this.duration = const Duration(milliseconds: 2300),
    super.key,
  });

  ///[Widget] this widget will placed at center of the animation
  final Widget? child;

  ///[Duration] delay of the animation
  final Duration delay;

  /// [double] minimum radius of the animation
  final double minRadius;

  /// [Color] color of the animation
  final Color color;

  /// [int] number of circle that u want to display in the animation
  final int ripplesCount;

  /// [Duration]  of the animation
  final Duration duration;

  /// [bool] provide true if u want repeat ani9mation
  final bool repeat;

  /// [bool] if true, the circles will have a border.
  final bool bordered;

  /// [bool] if true, the circles will have an outline style only.
  final bool outlined;

  /// [double] stroke width of the animation
  final double? strokeWidth;

  @override
  RippleAnimationState createState() => RippleAnimationState();
}

///state of the animation
class RippleAnimationState extends State<RippleAnimation>
    with TickerProviderStateMixin {
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    // repeating or just forwarding the animation once.
    Timer(widget.delay, () {
      widget.repeat ? _controller?.repeat() : _controller?.forward();
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant RippleAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the `duration` has changed
    if (widget.duration != oldWidget.duration) {
      _controller?.duration = widget.duration;
      _controller?.reset(); // Reset the controller
      widget.repeat ? _controller?.repeat() : _controller?.forward();
    }

    // Check if the `repeat` property has changed
    if (widget.repeat != oldWidget.repeat) {
      // Reset the animation behavior based on the new `repeat` value
      if (widget.repeat) {
        _controller?.repeat();
      } else {
        _controller?.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: CirclePainter(_controller,
            color: widget.color,
            minRadius: widget.minRadius,
            wavesCount: widget.ripplesCount + 2,
            outlined: widget.outlined,
            width: widget.strokeWidth,
            bordered: widget.bordered),
        child: widget.child ?? const SizedBox.shrink(),
      );

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}

/// Creating a Circular painter for clipping the rects and creating circle shape
class CirclePainter extends CustomPainter {
  ///initialize the painter
  CirclePainter(
    this._animation, {
    required this.wavesCount,
    required this.color,
    this.bordered = false,
    this.outlined = false,
    this.width,
    this.minRadius,
  }) : super(repaint: _animation);

  ///[Color] of the painter
  final Color color;

  /// [bool] to define if the circle should be bordered.
  final bool bordered;

  /// [bool] to define if the circle should be outlined.
  final bool outlined;

  ///[double] minimum radius of the painter
  final double? minRadius;

  ///[double] stroke width
  final double? width;

  ///[int] number of wave count in the animation
  final int wavesCount;

  ///[Color] of the painter
  final Animation<double>? _animation;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    for (int wave = 0; wave <= wavesCount; wave++) {
      circle(
          canvas, rect, minRadius, wave, _animation!.value, wavesCount, color);
    }
  }

  /// animating the opacity according to min radius and waves count.
  void circle(Canvas canvas, Rect rect, double? minRadius, int wave,
      double value, int? length, Color circleColor) {
    Color color = circleColor;
    double radius;
    if (wave != 0) {
      final double opacity =
          (1 - ((wave - 1) / length!) - value).clamp(0.0, 1.0);
      color = color.withValues(alpha: opacity);

      radius = minRadius! * (1 + (wave * value)) * value;
      final Paint paint = Paint()
        ..color = color
        ..style =
            outlined && bordered ? PaintingStyle.stroke : PaintingStyle.fill;
      canvas.drawCircle(rect.center, radius, paint);

      // Paint for the border
      if (bordered) {
        final Paint borderPaint = Paint()
          ..color = color.withValues(alpha: opacity)
          ..style = PaintingStyle.stroke
          ..strokeWidth = (width ?? 1.0);

        // Draw the circle's border
        canvas.drawCircle(rect.center, radius, borderPaint);
      }
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}
