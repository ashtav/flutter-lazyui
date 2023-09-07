part of widget;

class CaretPainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final int skew;
  final Color? borderColor;
  final double borderWidth;
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
