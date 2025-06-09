import 'dart:math';

import 'package:flutter/material.dart';

import 'target.dart';

/// A custom clipper that creates a circular clipping path.
///
/// This class extends [CustomClipper<Path>] and is typically used with widgets
/// that require a circular clipping region, such as images or containers.
/// Override the [getClip] and [shouldReclip] methods to define the circle's
/// size and position.
class CircleClipper extends CustomClipper<Path> {
  final double progress;
  final Offset positioned;
  final double sizeCircle;

  CircleClipper(
    this.progress,
    this.positioned,
    this.sizeCircle,
  );

  @override
  Path getClip(Size size) {
    if (positioned == Offset.zero) return Path();
    var maxSize = max(size.width, size.height);

    double radius = maxSize * (1 - progress) + sizeCircle;

    return circleHolePath(size, positioned, radius);
  }

  // There is some weirdness here.  On mobile, using arcTo with `sweepAngle: 2 * pi`
  // gives the equivalent of `sweepAngle: 0`.  I couldn't find any documentation
  // of the expected behavior here, so instead I just call arcTo twice (two
  // semi-circles) to outline the full hole.
  static Path circleHolePath(
    Size size,
    Offset positioned,
    double radius,
  ) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, positioned.dy)
      ..arcTo(
        Rect.fromCircle(center: positioned, radius: radius),
        pi,
        pi,
        false,
      )
      ..arcTo(
        Rect.fromCircle(center: positioned, radius: radius),
        0,
        pi,
        false,
      )
      ..lineTo(0, positioned.dy)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CircleClipper oldClipper) {
    return progress != oldClipper.progress;
  }
}

/// A custom clipper that creates a rectangular clipping path.
///
/// This class extends [CustomClipper<Path>] and is typically used with widgets
/// that require a rectangular clipping region. Override the [getClip] and
/// [shouldReclip] methods to define the clipping behavior.
class RectClipper extends CustomClipper<Path> {
  final double progress;
  final TargetPosition target;
  final double offset;
  final double radius;

  RectClipper({
    required this.progress,
    required this.target,
    required this.offset,
    required this.radius,
  });

  @override
  Path getClip(Size size) {
    if (target.offset == Offset.zero) return Path();

    var maxSize = max(size.width, size.height) +
        max(target.size.width, target.size.height) +
        target.getBiggerSpaceBorder(size);

    double x = -maxSize / 2 * (1 - progress) + target.offset.dx - offset / 2;
    double y = -maxSize / 2 * (1 - progress) + target.offset.dy - offset / 2;
    double w = maxSize * (1 - progress) + target.size.width + offset;
    double h = maxSize * (1 - progress) + target.size.height + offset;

    return radius > 0
        ? rRectHolePath(size, x, y, w, h, radius)
        : rectHolePath(size, x, y, w, h);
  }

  @override
  bool shouldReclip(covariant RectClipper oldClipper) {
    return progress != oldClipper.progress;
  }

  static Path rectHolePath(
    Size canvasSize,
    double x,
    double y,
    double w,
    double h,
  ) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, y)
      ..lineTo(x + w, y)
      ..lineTo(x + w, y + h)
      ..lineTo(x, y + h)
      ..lineTo(x, y)
      ..lineTo(0, y)
      ..lineTo(0, canvasSize.height)
      ..lineTo(canvasSize.width, canvasSize.height)
      ..lineTo(canvasSize.width, 0)
      ..close();
  }

  static Path rRectHolePath(
    Size canvasSize,
    double x,
    double y,
    double w,
    double h,
    double radius,
  ) {
    double diameter = radius * 2;

    return Path()
      ..moveTo(0, 0)
      ..lineTo(0, y + radius)
      ..arcTo(
        Rect.fromLTWH(x, y, diameter, diameter),
        pi,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x + w - diameter, y, diameter, diameter),
        3 * pi / 2,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x + w - diameter, y + h - diameter, diameter, diameter),
        0,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x, y + h - diameter, diameter, diameter),
        pi / 2,
        pi / 2,
        false,
      )
      ..lineTo(x, y + radius)
      ..lineTo(0, y + radius)
      ..lineTo(0, canvasSize.height)
      ..lineTo(canvasSize.width, canvasSize.height)
      ..lineTo(canvasSize.width, 0)
      ..close();
  }
}

/// A custom painter that draws a rectangular (optionally rounded) transparent "hole"
/// in a shadow overlay, typically used for highlighting a rectangular area (such as
/// a widget) in onboarding or tutorial flows. The hole animates its size and position
/// based on the [progress] value, and can have a border and configurable shadow color,
/// opacity, offset, and corner radius.
class LightPaintRect extends CustomPainter {
  /// The animation progress (0.0 to 1.0) controlling the size of the hole.
  final double progress;

  /// The target position and size to highlight.
  final TargetPosition target;

  /// The color of the shadow overlay.
  final Color colorShadow;

  /// The opacity of the shadow overlay (0.0 to 1.0).
  final double opacityShadow;

  /// The extra offset (padding) around the highlighted rectangle.
  final double offset;

  /// The corner radius for the highlighted rectangle.
  final double radius;

  /// The border style for the highlighted rectangle.
  final BorderSide? borderSide;

  LightPaintRect({
    required this.progress,
    required this.target,
    this.colorShadow = Colors.black,
    this.opacityShadow = 0.8,
    this.offset = 10,
    this.radius = 10,
    this.borderSide,
  }) : assert(opacityShadow >= 0 && opacityShadow <= 1);

  static Path _drawJustHole(
    Size canvasSize,
    double x,
    double y,
    double w,
    double h,
  ) {
    return Path()
      ..moveTo(x + w, y)
      ..lineTo(x + w, y + h)
      ..lineTo(x, y + h)
      ..lineTo(x, y)
      ..close();
  }

  static Path _drawJustRHole(
    Size canvasSize,
    double x,
    double y,
    double w,
    double h,
    double radius,
  ) {
    double diameter = radius * 2;

    return Path()
      ..moveTo(x, y + radius)
      ..arcTo(
        Rect.fromLTWH(x, y, diameter, diameter),
        pi,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x + w - diameter, y, diameter, diameter),
        3 * pi / 2,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x + w - diameter, y + h - diameter, diameter, diameter),
        0,
        pi / 2,
        false,
      )
      ..arcTo(
        Rect.fromLTWH(x, y + h - diameter, diameter, diameter),
        pi / 2,
        pi / 2,
        false,
      )
      ..lineTo(x, y + radius)
      ..close();
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (target.offset == Offset.zero) return;

    var maxSize = max(size.width, size.height) +
        max(target.size.width, target.size.height) +
        target.getBiggerSpaceBorder(size);

    double x = -maxSize / 2 * (1 - progress) + target.offset.dx - offset / 2;

    double y = -maxSize / 2 * (1 - progress) + target.offset.dy - offset / 2;

    double w = maxSize * (1 - progress) + target.size.width + offset;

    double h = maxSize * (1 - progress) + target.size.height + offset;

    canvas.drawPath(
      radius > 0
          ? RectClipper.rRectHolePath(size, x, y, w, h, radius)
          : RectClipper.rectHolePath(size, x, y, w, h),
      Paint()
        ..style = PaintingStyle.fill
        ..color = colorShadow.withValues(alpha: opacityShadow)
        ..strokeWidth = 4,
    );
    if (borderSide != null && borderSide?.style != BorderStyle.none) {
      canvas.drawPath(
        radius > 0
            ? _drawJustRHole(size, x, y, w, h, radius)
            : _drawJustHole(size, x, y, w, h),
        Paint()
          ..style = PaintingStyle.stroke
          ..color = borderSide!.color
          ..strokeWidth = borderSide!.width,
      );
    }
  }

  @override
  bool shouldRepaint(LightPaintRect oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

/// A custom painter that draws a circular transparent "hole" in a shadow overlay,
/// typically used for highlighting a circular area (such as a widget) in onboarding
/// or tutorial flows. The hole animates its size and position based on the [progress]
/// value, and can have a border and configurable shadow color and opacity.
class LightPaint extends CustomPainter {
  /// The animation progress (0.0 to 1.0) controlling the size of the hole.
  final double progress;

  /// The center position of the circular hole.
  final Offset positioned;

  /// The final radius of the circular hole.
  final double sizeCircle;

  /// The color of the shadow overlay.
  final Color colorShadow;

  /// The opacity of the shadow overlay (0.0 to 1.0).
  final double opacityShadow;

  /// The border style for the circular hole.
  final BorderSide? borderSide;

  LightPaint(
    this.progress,
    this.positioned,
    this.sizeCircle, {
    this.colorShadow = Colors.black,
    this.opacityShadow = 0.8,
    this.borderSide,
  }) : assert(opacityShadow >= 0 && opacityShadow <= 1);

  @override
  void paint(Canvas canvas, Size size) {
    if (positioned == Offset.zero) return;
    var maxSize = max(size.width, size.height);

    double radius = maxSize * (1 - progress) + sizeCircle;

    final circleHole = CircleClipper.circleHolePath(size, positioned, radius);

    final justCircleHole = Path()
      ..moveTo(positioned.dx - radius, positioned.dy)
      ..arcTo(
        Rect.fromCircle(center: positioned, radius: radius),
        pi,
        pi,
        false,
      )
      ..arcTo(
        Rect.fromCircle(center: positioned, radius: radius),
        0,
        pi,
        false,
      )
      ..close();

    canvas.drawPath(
      circleHole,
      Paint()
        ..style = PaintingStyle.fill
        ..color = colorShadow.withValues(alpha: opacityShadow),
    );
    if (borderSide != null && borderSide?.style != BorderStyle.none) {
      canvas.drawPath(
        justCircleHole,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = borderSide!.color
          ..strokeWidth = borderSide!.width,
      );
    }
  }

  @override
  bool shouldRepaint(LightPaint oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
