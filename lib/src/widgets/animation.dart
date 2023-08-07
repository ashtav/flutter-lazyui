part of widgets;

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

class BlinkAnimate extends StatelessWidget {
  final Widget child;
  final bool animate;
  final Duration? duration;
  const BlinkAnimate({super.key, required this.child, this.animate = true, this.duration});

  @override
  Widget build(BuildContext context) {
    if (!animate) {
      return child;
    }

    return Animator(
      tween: Tween<double>(begin: 0, end: 300),
      cycles: 0,
      builder: (context, anim, f) {
        double opacity = double.parse('${anim.value}');
        return AnimatedOpacity(
            duration: duration ?? const Duration(milliseconds: 300),
            opacity: opacity >= 150 ? 1 : 0,
            child: child);
      },
    );
  }
}

class LineProgressIndicator extends StatefulWidget {
  final Duration? duration;
  final VoidCallback? onComplete;
  final bool repeat;
  final double height;
  final Color? backgroundColor, progressColor;

  /// The initial progress of the animation, between 0.0 and 1.0.
  final double initialProgress;

  const LineProgressIndicator(
      {Key? key,
      this.duration,
      this.onComplete,
      this.repeat = false,
      this.height = 4,
      this.initialProgress = 0.0,
      this.backgroundColor,
      this.progressColor})
      : super(key: key);

  @override
  State<LineProgressIndicator> createState() => _LineProgressIndicatorState();
}

class _LineProgressIndicatorState extends State<LineProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  void listenStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (_animationController.value >= 1) {
        widget.onComplete?.call();
      }

      if (widget.repeat) {
        _animationController.animateTo(0.0, duration: 150.ms).then((_) {
          _animationController.forward();
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration ?? 10.s, // default duration is 10 seconds
      value: widget.initialProgress,
    );

    _animationController.addStatusListener(listenStatus);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(LineProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.duration != oldWidget.duration) {
      _animationController.duration = widget.duration;
    }
  }

  void resetAnimation() {
    _animationController.value = widget.initialProgress;
  }

  @override
  Widget build(BuildContext context) {
    // resetAnimation();

    return SizedBox(
      height: widget.height,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return LinearProgressIndicator(
            backgroundColor: widget.backgroundColor ?? Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
                widget.progressColor ?? LzColors.orange),
            value: _animationController.value,
          );
        },
      ),
    );
  }
}

class RotateAnimated extends StatefulWidget {
  final Widget child;
  final double angle;
  final Duration? duration;

  const RotateAnimated(
      {super.key, required this.child, required this.angle, this.duration});

  @override
  State<RotateAnimated> createState() => _RotateAnimatedState();
}

class _RotateAnimatedState extends State<RotateAnimated>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: widget.duration ?? 300.ms,
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0, end: widget.angle)
        .animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child: widget.child,
    );
  }
}
