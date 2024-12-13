part of '../widget.dart';

/// A utility class for applying various transformations to a widget, including
/// rotation, flipping, scaling, and translation. Each transformation can be animated.
class LzTransform {
  /// Applies a rotation transformation to the [child] widget.
  ///
  /// [angle] determines the amount of rotation in radians. Use [duration] and [curve]
  /// to animate the rotation, and [alignment] to specify the origin point of the rotation.
  ///
  /// Example:
  /// ```dart
  /// LzTransform.rotate(
  ///   child: Text("Rotate Me"),
  ///   angle: 3.14 / 2, // 90 degrees in radians
  ///   duration: Duration(seconds: 1),
  /// );
  /// ```
  static rotate({
    Widget? child,
    double angle = 0,
    Duration? duration,
    Curve? curve,
    AlignmentGeometry? alignment = Alignment.center,
  }) =>
      _Rotate(
          angle: angle,
          duration: duration,
          curve: curve,
          alignment: alignment,
          child: child);

  /// Applies a flipping transformation to the [child] widget along the X or Y axis.
  ///
  /// [flipX] and [flipY] control flipping along the respective axes, with values ranging
  /// from -1.0 (full flip) to 1.0 (no flip). [duration] and [curve] can be used to animate
  /// the flipping, and [alignment] sets the origin point for the flip.
  ///
  /// Example:
  /// ```dart
  /// LzTransform.flip(
  ///   child: Text("Flip Me"),
  ///   flipX: 1.0,
  ///   duration: Duration(seconds: 1),
  /// );
  /// ```
  static flip({
    Widget? child,
    double flipX = 0,
    double flipY = 0,
    Duration? duration,
    Curve? curve,
    AlignmentGeometry? alignment = Alignment.center,
  }) =>
      _Flip(
        duration: duration,
        curve: curve,
        flipX: flipX,
        flipY: flipY,
        alignment: alignment,
        child: child,
      );

  /// Applies a scaling transformation to the [child] widget.
  ///
  /// [scale] applies the same scaling factor to both X and Y axes. If not provided,
  /// [scaleX] and [scaleY] are used to scale the widget on each axis individually.
  /// Use [duration] and [curve] for animation, and [alignment] to control the scaling origin.
  ///
  /// Example:
  /// ```dart
  /// LzTransform.scale(
  ///   child: Text("Scale Me"),
  ///   scale: 2.0, // Double the size
  ///   duration: Duration(seconds: 1),
  /// );
  /// ```
  static scale({
    Widget? child,
    double? scale,
    double scaleX = 1.0,
    double scaleY = 1.0,
    Duration? duration,
    Curve? curve,
    AlignmentGeometry? alignment = Alignment.center,
  }) =>
      _Scale(
        duration: duration,
        curve: curve,
        scale: scale,
        scaleX: scaleX,
        scaleY: scaleY,
        alignment: alignment,
        child: child,
      );

  /// Applies a translation transformation to the [child] widget.
  ///
  /// [offset] determines how much the widget is moved along the X and Y axes.
  /// Use [duration] and [curve] to animate the translation.
  ///
  /// Example:
  /// ```dart
  /// LzTransform.translate(
  ///   child: Text("Move Me"),
  ///   offset: Offset(100, 50), // Move 100px right and 50px down
  ///   duration: Duration(seconds: 1),
  /// );
  /// ```
  static translate({
    Widget? child,
    Offset? offset,
    Duration? duration,
    Curve? curve,
  }) =>
      _Translate(
        duration: duration,
        curve: curve,
        offset: offset,
        child: child,
      );
}

/// A widget that applies a rotation transformation to its child.
///
/// [angle] specifies the rotation in radians, and [duration] allows for animation
/// over the specified time. The rotation will start from the current angle and
/// animate to the new [angle] when it changes.
class _Rotate extends StatefulWidget {
  final Widget? child;
  final double angle;
  final Duration? duration;
  final Curve? curve;
  final AlignmentGeometry? alignment;
  const _Rotate(
      {this.child,
      this.angle = 0,
      this.duration,
      this.curve,
      this.alignment = Alignment.center});

  @override
  State<_Rotate> createState() => __RotateState();
}

class __RotateState extends State<_Rotate> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  double _currentAngle = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 250),
      vsync: this,
    );

    _setupAnimation(fromAngle: _currentAngle, toAngle: widget.angle);

    _controller.forward();
  }

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

    if (widget.angle != oldWidget.angle) {
      _currentAngle = _animation.value;

      _controller.reset();
      _setupAnimation(fromAngle: _currentAngle, toAngle: widget.angle);

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

/// A widget that applies a flipping transformation along the X and Y axes to its child.
///
/// [flipX] controls the horizontal flip, and [flipY] controls the vertical flip.
/// Both values range from -1.0 (flipped) to 1.0 (normal). The [duration] and [curve]
/// control the animation of the flip, and [alignment] specifies the flip's origin.
class _Flip extends StatefulWidget {
  final Widget? child;
  final double flipX;
  final double flipY;
  final Duration? duration;
  final Curve? curve;
  final AlignmentGeometry? alignment;

  const _Flip({
    this.child,
    this.flipX = 0.0,
    this.flipY = 0.0,
    this.duration,
    this.curve,
    this.alignment = Alignment.center,
  });

  @override
  State<_Flip> createState() => __FlipState();
}

class __FlipState extends State<_Flip> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _flipXAnimation;
  late Animation<double> _flipYAnimation;

  double _currentFlipX = 0.0;
  double _currentFlipY = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 250),
      vsync: this,
    );

    _setupAnimations(
      fromFlipX: _currentFlipX,
      toFlipX: widget.flipX,
      fromFlipY: _currentFlipY,
      toFlipY: widget.flipY,
    );

    _controller.forward();
  }

  void _setupAnimations({
    required double fromFlipX,
    required double toFlipX,
    required double fromFlipY,
    required double toFlipY,
  }) {
    _flipXAnimation = Tween<double>(begin: fromFlipX, end: toFlipX).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.easeInOut,
      ),
    );

    _flipYAnimation = Tween<double>(begin: fromFlipY, end: toFlipY).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant _Flip oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.flipX != oldWidget.flipX || widget.flipY != oldWidget.flipY) {
      _currentFlipX = _flipXAnimation.value;
      _currentFlipY = _flipYAnimation.value;

      _controller.reset();

      _setupAnimations(
        fromFlipX: _currentFlipX,
        toFlipX: widget.flipX,
        fromFlipY: _currentFlipY,
        toFlipY: widget.flipY,
      );

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
      animation: _controller,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.identity()
            ..rotateX(_flipYAnimation.value * 3.1415926535897932)
            ..rotateY(_flipXAnimation.value * 3.1415926535897932),
          alignment: widget.alignment,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// A widget that applies a scaling transformation to its child.
///
/// [scale] scales both the X and Y axes equally. If [scale] is provided, it
/// overrides [scaleX] and [scaleY]. Use [duration] and [curve] to animate the
/// scaling effect, and [alignment] to set the scaling origin.
class _Scale extends StatefulWidget {
  final Widget? child;
  final double scaleX;
  final double scaleY;
  final double? scale;
  final Duration? duration;
  final Curve? curve;
  final AlignmentGeometry? alignment;

  const _Scale({
    this.child,
    this.scaleX = 1.0,
    this.scaleY = 1.0,
    this.scale,
    this.duration,
    this.curve,
    this.alignment = Alignment.center,
  });

  @override
  State<_Scale> createState() => __ScaleState();
}

class __ScaleState extends State<_Scale> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleXAnimation;
  late Animation<double> _scaleYAnimation;

  double _currentScaleX = 1.0;
  double _currentScaleY = 1.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 250),
      vsync: this,
    );

    _setupAnimations(
      fromScaleX: _currentScaleX,
      toScaleX: widget.scale ?? widget.scaleX, // Use `scale` if provided
      fromScaleY: _currentScaleY,
      toScaleY: widget.scale ?? widget.scaleY, // Use `scale` if provided
    );

    _controller.forward();
  }

  void _setupAnimations({
    required double fromScaleX,
    required double toScaleX,
    required double fromScaleY,
    required double toScaleY,
  }) {
    _scaleXAnimation = Tween<double>(begin: fromScaleX, end: toScaleX).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.easeInOut,
      ),
    );

    _scaleYAnimation = Tween<double>(begin: fromScaleY, end: toScaleY).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant _Scale oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if scale or scaleX/scaleY has changed
    if (widget.scale != oldWidget.scale ||
        widget.scaleX != oldWidget.scaleX ||
        widget.scaleY != oldWidget.scaleY) {
      _currentScaleX = _scaleXAnimation.value;
      _currentScaleY = _scaleYAnimation.value;

      _controller.reset();

      _setupAnimations(
        fromScaleX: _currentScaleX,
        toScaleX:
            widget.scale ?? widget.scaleX, // Update using `scale` if present
        fromScaleY: _currentScaleY,
        toScaleY: widget.scale ?? widget.scaleY,
      );

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
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scaleX: _scaleXAnimation.value,
          scaleY: _scaleYAnimation.value,
          alignment: widget.alignment,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}

/// A widget that applies a translation (movement) transformation to its child.
///
/// [offset] determines how much the widget is moved along the X and Y axes.
/// Use [duration] and [curve] to animate the translation.
class _Translate extends StatefulWidget {
  final Widget? child;
  final Offset? offset;
  final Duration? duration;
  final Curve? curve;

  const _Translate({
    this.child,
    this.offset = Offset.zero,
    this.duration,
    this.curve,
  });

  @override
  State<_Translate> createState() => __TranslateState();
}

class __TranslateState extends State<_Translate> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  Offset _currentOffset = Offset.zero;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: widget.duration ?? const Duration(milliseconds: 250),
      vsync: this,
    );

    _setupAnimation(
        fromOffset: _currentOffset, toOffset: widget.offset ?? Offset.zero);
    _controller.forward();
  }

  void _setupAnimation({required Offset fromOffset, required Offset toOffset}) {
    _animation = Tween<Offset>(begin: fromOffset, end: toOffset).animate(
      CurvedAnimation(
        parent: _controller,
        curve: widget.curve ?? Curves.easeInOut,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant _Translate oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if the offset has changed
    if (widget.offset != oldWidget.offset) {
      _currentOffset = _animation.value;

      _controller.reset();

      _setupAnimation(
          fromOffset: _currentOffset, toOffset: widget.offset ?? Offset.zero);
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
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
