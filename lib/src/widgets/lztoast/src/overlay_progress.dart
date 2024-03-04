import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// A circular slider widget.
class CircularSlider extends StatefulWidget {
  /// The current value of the slider.
  final double value;

  /// The color of the slider.
  final Color? color;

  /// Constructs a [CircularSlider] widget with the given [value] and optional [color].
  const CircularSlider({Key? key, required this.value, this.color})
      : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: 150.ms,
    );
    _controller.value = widget.value / 100;
  }

  @override
  void didUpdateWidget(covariant CircularSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _controller.animateTo(widget.value / 100,
          duration: 150.ms, curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return CustomPaint(
          size: const Size(110, 110),
          key: UniqueKey(),
          painter: CircularSliderPainter(
              value: _controller.value * 100,
              color: widget.color ?? Colors.white),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// A custom painter for rendering a circular slider.
class CircularSliderPainter extends CustomPainter {
  /// The current value of the slider.
  final double value;

  /// The color of the slider.
  final Color color;

  CircularSliderPainter({required this.value, this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY) - 20;
    double sweepAngle = value / 100 * 360;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      pi / 2,
      degreesToRadians(sweepAngle),
      false,
      paint,
    );
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
