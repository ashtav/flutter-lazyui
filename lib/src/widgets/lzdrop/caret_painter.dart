import 'package:flutter/material.dart';

/// `CaretPainter` is a CustomPainter that provides a customizable caret (cursor)
/// for text fields or similar widgets. It allows for a high degree of customization
/// including color, stroke width, and skew.

class CaretPainter extends CustomPainter {
  /// The color used for the main stroke of the caret.
  final Color strokeColor;

  /// The painting style to be used for the caret. This can be fill, stroke, etc.
  final PaintingStyle paintingStyle;

  /// The width of the stroke used to paint the caret.
  final double strokeWidth;

  /// The skew factor for the caret, allowing it to be slanted or skewed.
  final int skew;

  /// An optional color for the border of the caret. If null, no border is drawn.
  final Color? borderColor;

  /// The width of the border around the caret. Relevant only if a borderColor is provided.
  final double borderWidth;

  /// An integer representing the side of the caret. This could be used to determine
  /// its orientation or position relative to other elements.
  final int side;

  CaretPainter({
    this.strokeColor = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.fill,
    this.skew = 2,
    this.borderColor,
    this.borderWidth = .5,
    this.side = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);

    if (borderColor != null) {
      Paint borderPaint = Paint()
        ..color = borderColor!
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke;

      // Draw the border based on the 'side' parameter
      if (side == 1 || side > 3) {
        canvas.drawLine(
            Offset(0, size.height), Offset(size.width / skew, 0), borderPaint);
      }
      if (side == 2 || side > 3) {
        canvas.drawLine(Offset(size.width / skew, 0),
            Offset(size.width, size.height), borderPaint);
        canvas.drawLine(
            Offset(0, size.height), Offset(size.width / skew, 0), borderPaint);
      }
      if (side == 3) {
        canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height),
            borderPaint);
        canvas.drawLine(Offset(size.width / skew, 0),
            Offset(size.width, size.height), borderPaint);
        canvas.drawLine(
            Offset(0, size.height), Offset(size.width / skew, 0), borderPaint);
      }
    }
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / skew, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(CaretPainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.borderColor != borderColor ||
        oldDelegate.borderWidth != borderWidth ||
        oldDelegate.side != side;
  }
}
