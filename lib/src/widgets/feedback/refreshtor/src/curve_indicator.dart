import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/colors.dart';

/// Widget for displaying a curve indicator.
class CurveIndicator extends StatelessWidget {
  /// The controller for the indicator.
  final IndicatorController controller;

  /// The value of the indicator.
  final double value;

  /// The style of the indicator.
  final RefreshtorStyle? style;

  /// Creates a CurveIndicator.
  const CurveIndicator(this.controller, this.value, this.style, {super.key});

  @override
  Widget build(BuildContext context) {
    bool isArmed = controller.isArmed;
    bool isFinal = controller.isFinalizing;
    bool isLoading = controller.isLoading;

    Color backgroundColor = style?.backgroundColor ?? lzBackgroundColor;
    Color textColor = style?.textColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);
    Color releaseTextColor = style?.releaseTextColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);
    Color indicatorColor = style?.indicatorColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);

    String? text = style?.text;
    String? releaseText = style?.releaseText;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CustomPaint(
            painter: _CurvedShapePainter(
                value: isLoading || isFinal ? 0 : value * .4,
                color: backgroundColor),
            child: AnimatedContainer(
              duration: 150.ms,
              width: context.width,
              padding: Ei.only(t: (10 * value) + 3),
              height: isLoading || isFinal
                  ? 0
                  : 55 * value + (value * (style?.height ?? 0)),
              child: Center(
                child: AnimatedOpacity(
                    duration: 300.ms,
                    opacity: value > .4 ? 1 : 0,
                    child: Text(
                        isArmed
                            ? (releaseText ?? 'Release to refresh')
                            : (text ?? 'Pull down to refresh'),
                        style: LazyUi.font
                            .copyWith(
                                fontWeight: isArmed ? Fw.bold : Fw.normal,
                                fontSize: 12 + (1 * value))
                            .fcolor(isArmed ? releaseTextColor : textColor),
                        textAlign: Ta.center)),
              ),
            )),
        AnimatedContainer(
            duration: 100.ms,
            height: 1.2 * value,
            width: context.width * value,
            decoration: BoxDecoration(
                color: indicatorColor,
                borderRadius: Br.radius(50 * (1 - value.clamp(0, 1))))),
      ],
    );
  }
}

class _CurvedShapePainter extends CustomPainter {
  final double value;
  final Color? color;

  _CurvedShapePainter({required this.value, this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color ?? Colors.white
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height + (150 * value), size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
