part of '../widget.dart';

class _Rotate extends StatefulWidget {
  final Widget? child;
  final double angle;
  final Duration? duration;
  final Curve? curve;
  final AlignmentGeometry? alignment;
  const _Rotate({super.key, this.child, this.angle = 0, this.duration, this.curve, this.alignment = Alignment.center});

  @override
  State<_Rotate> createState() => __RotateState();
}

class __RotateState extends State<_Rotate> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentAngle = 0.0; // Variable to store the current rotation

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 250),
      vsync: this,
    );

    // Initialize the animation with the provided angle
    _setupAnimation(fromAngle: _currentAngle, toAngle: widget.angle);

    // Start the animation
    _controller.forward();
  }

  /// Set up the animation based on the current and target angles
  void _setupAnimation({required double fromAngle, required double toAngle}) {
    _animation = Tween<double>(begin: fromAngle, end: toAngle).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant _Rotate oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the angle has changed
    if (widget.angle != oldWidget.angle) {
      // Capture the current angle (where the animation is currently)
      _currentAngle = _animation.value;

      // Reset the controller and update the animation from the current position
      _controller.reset();
      _setupAnimation(fromAngle: _currentAngle, toAngle: widget.angle);

      // Restart the animation from the current angle
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: _animation.value,
          alignment: widget.alignment,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

class CustomTransform {
  static rotate(
          {Widget? child,
          double angle = 0,
          Duration? duration,
          Curve? curve,
          AlignmentGeometry? alignment = Alignment.center}) =>
      _Rotate(angle: angle, duration: duration, curve: curve, alignment: alignment, child: child);
}
