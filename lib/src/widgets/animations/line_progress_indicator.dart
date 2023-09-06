part of widget;

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

class _LineProgressIndicatorState extends State<LineProgressIndicator> with SingleTickerProviderStateMixin {
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
            valueColor: AlwaysStoppedAnimation<Color>(widget.progressColor ?? LzColors.orange),
            value: _animationController.value,
          );
        },
      ),
    );
  }
}
