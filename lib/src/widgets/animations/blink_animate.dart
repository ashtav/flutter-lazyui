part of '../widget.dart';

class BlinkAnimate extends StatefulWidget {
  final Duration? duration;
  final Widget child;
  final bool isAnimated;

  const BlinkAnimate({
    super.key,
    this.duration,
    required this.child,
    this.isAnimated = true,
  });

  @override
  State<BlinkAnimate> createState() => _BlinkAnimateState();
}

class _BlinkAnimateState extends State<BlinkAnimate> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 250),
    );
    if (widget.isAnimated) {
      _controller.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant BlinkAnimate oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the animation duration has changed
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration ?? const Duration(milliseconds: 250);
      _controller.reset(); // Reset the animation controller
      if (widget.isAnimated) {
        _controller.repeat(reverse: true); // Restart the animation
      }
    }

    // Handle animation state based on isAnimated
    if (widget.isAnimated != oldWidget.isAnimated) {
      if (widget.isAnimated && !_controller.isAnimating) {
        _controller.repeat(reverse: true); // Start the animation if it's not already running
      } else if (!widget.isAnimated && _controller.isAnimating) {
        _controller.stop(); // Stop the animation if it should be paused
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isAnimated
        ? FadeTransition(
            opacity: _controller,
            child: widget.child,
          )
        : widget.child;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
