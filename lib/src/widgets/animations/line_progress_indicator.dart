part of widget;

/// A customizable linear progress indicator widget with animation support.
///
/// The `LineProgressIndicator` displays a horizontal progress bar that animates
/// from the initial progress value to completion. You can customize its appearance,
/// animation duration, and behavior using the provided parameters.
///
/// Example usage:
/// ```dart
/// LineProgressIndicator(
///   duration: Duration(seconds: 5), // Animation duration
///   initialProgress: 0.2, // Initial progress value (between 0.0 and 1.0)
///   progressColor: Colors.blue, // Color of the progress indicator
///   onComplete: () {
///     // Callback when animation completes (optional)
///     print("Animation completed!");
///   },
///   repeat: true, // Whether to repeat the animation when completed
///   height: 6, // Height of the progress indicator
///   backgroundColor: Colors.grey[300], // Background color
/// )
/// ```
class LineProgressIndicator extends StatefulWidget {
  /// The total duration of the animation.
  final Duration? duration;

  /// A callback function called when the animation completes (optional).
  final VoidCallback? onComplete;

  /// Whether to repeat the animation when it completes.
  final bool repeat;

  /// The height of the progress indicator.
  final double height;

  /// The background color of the progress indicator.
  final Color? backgroundColor;

  /// The color of the progress indicator.
  final Color? progressColor;

  /// The initial progress of the animation, between 0.0 and 1.0.
  final double initialProgress;

  /// Creates a `LineProgressIndicator` widget.
  ///
  /// The [duration] specifies the total duration of the animation.
  /// The [onComplete] callback is triggered when the animation completes (optional).
  /// The [repeat] flag determines whether the animation should repeat when completed.
  /// The [height] defines the height of the progress indicator.
  /// The [backgroundColor] sets the background color of the progress indicator.
  /// The [progressColor] defines the color of the progress indicator.
  /// The [initialProgress] sets the initial progress value (between 0.0 and 1.0).
  const LineProgressIndicator({
    Key? key,
    this.duration,
    this.onComplete,
    this.repeat = false,
    this.height = 4,
    this.initialProgress = 0.0,
    this.backgroundColor,
    this.progressColor,
  }) : super(key: key);

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
