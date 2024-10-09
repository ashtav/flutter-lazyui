part of '../widget.dart';

/// A widget that animates its child widget to blink.
class BlinkAnimate extends StatefulWidget {
  /// The child widget to be animated.
  final Widget child;

  /// Whether the animation should be active.
  final bool animate;

  /// The duration of the blink animation.
  final Duration? duration;

  /// Creates a [BlinkAnimate] widget.
  ///
  /// [child]: The child widget to be animated.
  /// [animate]: Whether the animation should be active (default is true).
  /// [duration]: The duration of the blink animation.
  const BlinkAnimate({
    super.key,
    required this.child,
    this.animate = true,
    this.duration,
  });

  @override
  State<BlinkAnimate> createState() => _BlinkAnimateState();
}

class _BlinkAnimateState extends State<BlinkAnimate>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.animate) {
      _controller = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 300),
      )..repeat(reverse: true);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(BlinkAnimate oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.duration != oldWidget.duration) {
      _controller.dispose();
      _controller = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 300),
      )..repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.animate) {
      return widget.child;
    }

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Opacity(
          opacity: _controller.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
