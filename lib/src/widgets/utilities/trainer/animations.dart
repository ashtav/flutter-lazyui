import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';

import 'clipper_painter.dart';
import 'target.dart';

/// An extension on [State] that provides a safer way to call [setState].
///
/// The [safeSetState] method executes the provided [call] callback
/// inside [setState] only if the widget is still mounted, preventing
/// exceptions that can occur if [setState] is called after the widget
/// has been disposed.
///
/// Example usage:
/// ```dart
/// safeSetState(() {
///   // update state here
/// });
/// ```
extension StateExt on State {
  void safeSetState(VoidCallback call) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(call);
    }
  }
}

/// Widget that animates a focus light effect over a list of [TargetFocus] widgets.
///
/// This widget highlights UI elements in sequence, typically for onboarding or tutorials.
/// It supports custom shadow color, opacity, padding, animation duration, and optional image filter.
class AnimatedFocusLight extends StatefulWidget {
  /// The list of targets to focus on.
  final List<TargetFocus> targets;

  /// Callback when a target receives focus.
  final Function(TargetFocus)? focus;

  /// Callback when focus is removed from a target.
  final Function? removeFocus;

  /// Callback when all targets have been focused and the animation finishes.
  final Function()? finish;

  /// Padding around the focused target.
  final double paddingFocus;

  /// Color of the shadow around the focus light.
  final Color colorShadow;

  /// Opacity of the shadow.
  final double opacityShadow;

  /// Duration of the focus animation.
  final Duration? duration;

  /// Optional image filter to apply to the background.
  final ImageFilter? imageFilter;

  /// The initial index of the target to focus on.
  final int? initFocus;

  const AnimatedFocusLight(
      {super.key,
      required this.targets,
      this.focus,
      this.finish,
      this.removeFocus,
      this.paddingFocus = 10,
      this.colorShadow = Colors.black,
      this.opacityShadow = 0.8,
      this.duration,
      this.imageFilter,
      this.initFocus})
      : assert(targets.length > 0);

  @override
  AnimatedFocusLightState createState() => AnimatedStaticFocusLightState();
}

/// The abstract state class for [AnimatedFocusLight] widget.
///
/// This class should be extended to implement the state logic for
/// the [AnimatedFocusLight] widget, which is likely responsible for
/// handling animations and focus effects within the UI.
///
/// Subclasses should override the necessary lifecycle methods and
/// provide the animation logic specific to the focus light effect.
abstract class AnimatedFocusLightState extends State<AnimatedFocusLight>
    with TickerProviderStateMixin {
  final defaultFocusAnimationDuration = const Duration(milliseconds: 600);
  late AnimationController _controller;
  late CurvedAnimation _curvedAnimation;

  late TargetFocus _targetFocus;
  Offset _positioned = const Offset(0.0, 0.0);
  TargetPosition? _targetPosition;

  double _sizeCircle = 100;
  int _currentFocus = 0;
  double _progressAnimated = 0;
  int nextIndex = 0;

  Future _revertAnimation();
  void _listener(AnimationStatus status);

  @override
  void initState() {
    super.initState();
    _currentFocus = widget.initFocus ?? 0;
    nextIndex = widget.initFocus ?? 0;

    _targetFocus = widget.targets[_currentFocus];
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? defaultFocusAnimationDuration,
    )..addStatusListener(_listener);

    _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.ease);

    Future.delayed(Duration.zero, _runFocus);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void next() => _tapHandler();

  void previous() {
    nextIndex--;
    _revertAnimation();
  }

  Future _tapHandler() async {
    nextIndex++;
    return _revertAnimation();
  }

  void _runFocus() {
    if (_currentFocus < 0) return;
    _targetFocus = widget.targets[_currentFocus];
    _controller.duration = widget.duration ?? defaultFocusAnimationDuration;

    TargetPosition? targetPosition;

    try {
      targetPosition = getTargetCurrent(_targetFocus);
    } on NotFoundTargetException catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }

    if (targetPosition == null) {
      _finish();
      return;
    }

    safeSetState(() {
      _targetPosition = targetPosition!;

      _positioned = Offset(
        targetPosition.offset.dx + (targetPosition.size.width / 2),
        targetPosition.offset.dy + (targetPosition.size.height / 2),
      );

      if (targetPosition.size.height > targetPosition.size.width) {
        _sizeCircle = targetPosition.size.height * 0.6 + _getPaddingFocus;
      } else {
        _sizeCircle = targetPosition.size.width * 0.6 + _getPaddingFocus;
      }
    });

    _controller.forward();
    _controller.duration = widget.duration;
    widget.duration ?? defaultFocusAnimationDuration;
  }

  void _goToFocus(int index) {
    if (index >= 0 && index < widget.targets.length) {
      _currentFocus = index;
      _runFocus();
    } else {
      _finish();
    }
  }

  void _finish() {
    safeSetState(() => _currentFocus = 0);
    widget.finish!();
  }

  Widget _getLightPaint(TargetFocus targetFocus) {
    if (widget.imageFilter != null) {
      return ClipPath(
        clipper: _getClipper(targetFocus.shape),
        child: BackdropFilter(
          filter: widget.imageFilter!,
          child: _getSizedPainter(targetFocus),
        ),
      );
    }

    return _getSizedPainter(targetFocus);
  }

  SizedBox _getSizedPainter(TargetFocus targetFocus) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: CustomPaint(
        painter: _getPainter(targetFocus),
      ),
    );
  }

  CustomClipper<Path> _getClipper(ShapeLightFocus? shape) {
    return shape == ShapeLightFocus.rRect
        ? RectClipper(
            progress: _progressAnimated,
            offset: _getPaddingFocus,
            target: _targetPosition ?? TargetPosition(Size.zero, Offset.zero),
            radius: config.borderRadius,
          )
        : CircleClipper(_progressAnimated, _positioned, _sizeCircle);
  }

  CustomPainter _getPainter(TargetFocus target) {
    if (target.shape == ShapeLightFocus.rRect) {
      return LightPaintRect(
        colorShadow: widget.colorShadow,
        progress: _progressAnimated,
        offset: _getPaddingFocus,
        target: _targetPosition ?? TargetPosition(Size.zero, Offset.zero),
        radius: config.borderRadius,
        opacityShadow: widget.opacityShadow,
      );
    }

    return LightPaint(
      _progressAnimated,
      _positioned,
      _sizeCircle,
      colorShadow: widget.colorShadow,
      opacityShadow: widget.opacityShadow,
    );
  }

  double get _getPaddingFocus => widget.paddingFocus;
}

/// The state class for [AnimatedStaticFocusLight], extending [AnimatedFocusLightState].
///
/// This class manages the animation and state logic for a static focus light effect,
/// typically used to highlight a specific area or widget in the UI with an animated
/// focus or spotlight effect. It inherits animation handling and lifecycle methods
/// from [AnimatedFocusLightState].
class AnimatedStaticFocusLightState extends AnimatedFocusLightState {
  double get left => (_targetPosition?.offset.dx ?? 0) - _getPaddingFocus * 2;
  double get top => (_targetPosition?.offset.dy ?? 0) - _getPaddingFocus * 2;
  double get width => (_targetPosition?.size.width ?? 0) + _getPaddingFocus * 4;
  double get height =>
      (_targetPosition?.size.height ?? 0) + _getPaddingFocus * 4;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        _progressAnimated = _curvedAnimation.value;
        return Stack(
          children: <Widget>[
            _getLightPaint(_targetFocus),
            Positioned(
                left: left,
                top: top,
                child: Container(
                  color: Colors.transparent,
                  width: width,
                  height: height,
                ))
          ],
        );
      },
    );
  }

  @override
  Future _revertAnimation() {
    return _controller.reverse();
  }

  @override
  void _listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      widget.focus?.call(_targetFocus);
    }
    if (status == AnimationStatus.dismissed) {
      _goToFocus(nextIndex);
    }

    if (status == AnimationStatus.reverse) {
      widget.removeFocus?.call();
    }
  }
}
