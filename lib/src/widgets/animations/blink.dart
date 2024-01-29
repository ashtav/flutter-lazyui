part of widget;

/// A [StatelessWidget] that provides a blinking animation effect to its child.
///
/// The `BlinkAnimate` widget animates the opacity of the `child` widget, creating a blinking effect.
/// This can be turned off by setting `animate` to `false`.
/// You can also specify the `duration` of the blink animation, if left null, it defaults to 300 milliseconds.
///
/// Example usage:
/// ```dart
/// BlinkAnimate(
///   child: Text('Hello, world!'),
/// );
/// ```

class BlinkAnimate extends StatefulWidget {
  final Widget child;
  final bool animate;
  final Duration? duration;

  const BlinkAnimate({
    Key? key,
    required this.child,
    this.animate = true,
    this.duration,
  }) : super(key: key);

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
