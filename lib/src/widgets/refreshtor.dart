import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

enum RefrehtorType { curve, bar, arrow }

class Refreshtor extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;
  final String? text, releaseText;
  final Color? indicatorColor, textColor, releaseTextColor, backgroundColor;
  final RefrehtorType type;
  final double offsetToArmed;

  const Refreshtor(
      {Key? key,
      required this.onRefresh,
      required this.child,
      this.text,
      this.releaseText,
      this.indicatorColor,
      this.textColor,
      this.releaseTextColor,
      this.backgroundColor,
      this.type = RefrehtorType.bar,
      this.offsetToArmed = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // curve refresh indicator
    Widget curveRefresh(double value, IndicatorController controller) {
      bool isArmed = controller.isArmed;
      bool isFinal = controller.isFinalizing;
      bool isLoading = controller.isLoading;

      return Stack(
        alignment: Alignment.topCenter,
        children: [
          CustomPaint(
              painter: _CurvedShapePainter(value: isLoading || isFinal ? 0 : value * .4, color: backgroundColor),
              child: AnimatedContainer(
                duration: 300.ms,
                width: context.width,
                height: isLoading || isFinal
                    ? 0
                    : value < .2
                        ? 0
                        : 55 * value,
              )),
          AnimatedOpacity(
            duration: 300.ms,
            opacity: value > 1 ? 1 : value,
            child: Column(
              mainAxisSize: Mas.min,
              mainAxisAlignment: Maa.center,
              children: [
                AnimatedContainer(
                    margin: Ei.only(b: 15 * value),
                    duration: 100.ms,
                    height: 2 * value,
                    width: context.width * value,
                    decoration: BoxDecoration(
                        color: indicatorColor ?? (LzColors.isDark(backgroundColor ?? Colors.white) ? Colors.white : LzColors.dark),
                        borderRadius: Br.radius(50 * (1 - value.clamp(0, 1))))),
                if (!isLoading && !isFinal)
                  Textr(isArmed ? (releaseText ?? 'Release to refresh') : (text ?? 'Pull down to refresh'),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                          fontWeight: isArmed ? Fw.bold : Fw.normal,
                          color: isArmed
                              ? (releaseTextColor ?? (LzColors.isDark(backgroundColor ?? Colors.white) ? Colors.white : LzColors.dark))
                              : textColor ?? (LzColors.isDark(backgroundColor ?? Colors.white) ? Colors.white : LzColors.dark)),
                      margin: Ei.only(t: 5 * value))
              ],
            ),
          ),
        ],
      );
    }

    // bar refresh indicator
    Widget barRefresh(double value, IndicatorController controller) {
      bool isArmed = controller.isArmed;
      bool isFinal = controller.isFinalizing;
      bool isLoading = controller.isLoading;

      return Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!isLoading && !isFinal)
            SizedBox(
              width: context.width,
              child: AnimatedOpacity(
                duration: 300.ms,
                opacity: value > 1 ? 1 : value,
                child: Column(
                  mainAxisSize: Mas.min,
                  mainAxisAlignment: Maa.center,
                  children: [
                    AnimatedContainer(
                        margin: Ei.only(t: 35 * value),
                        duration: 100.ms,
                        curve: Curves.linearToEaseOut,
                        height: 2,
                        width: 50 * value,
                        decoration: BoxDecoration(color: indicatorColor ?? LzColors.dark, borderRadius: Br.radius(50 * (1 - value.clamp(0, 1))))),
                    SlideSwitched(
                      withOpacity: true,
                      child: value < .2
                          ? const None()
                          : Textr(isArmed ? (releaseText ?? 'Release to refresh') : (text ?? 'Pull down to refresh'),
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: 13,
                                  fontWeight: isArmed ? Fw.bold : Fw.normal,
                                  color: isArmed ? (releaseTextColor ?? LzColors.dark) : textColor ?? LzColors.dark),
                              margin: Ei.only(t: 15 * value)),
                    ),
                  ],
                ),
              ),
            ),
        ],
      );
    }

    Widget arrowRefresh(double value, IndicatorController controller) {
      bool isArmed = controller.isArmed;
      bool isFinal = controller.isFinalizing;
      bool isLoading = controller.isLoading;

      return Stack(
        alignment: Alignment.topCenter,
        children: [
          if (!isLoading && !isFinal)
            SizedBox(
              width: context.width,
              child: AnimatedOpacity(
                duration: 300.ms,
                opacity: value > 1 ? 1 : value,
                child: Column(
                  mainAxisSize: Mas.min,
                  mainAxisAlignment: Maa.center,
                  children: [
                    SlideSwitched(
                        direction: SlideDirection.down,
                        withOpacity: true,
                        child: value < .1
                            ? const None()
                            : Container(
                                margin: Ei.only(t: 25 * value),
                                child: ResizedSwitched(
                                  show: true,
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                    key: ValueKey(isArmed),
                                    width: context.width,
                                    child: Iconr(
                                      isArmed ? La.arrowUp : La.arrowDown,
                                      color: indicatorColor ?? LzColors.dark,
                                    ).lzBlink(isArmed, 300.ms),
                                  ),
                                ),
                              )),
                    SlideSwitched(
                        withOpacity: true,
                        child: value < .2
                            ? const None()
                            : Textr(isArmed ? (releaseText ?? 'Release to refresh') : (text ?? 'Pull down to refresh'),
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 13,
                                    fontWeight: isArmed ? Fw.bold : Fw.normal,
                                    color: isArmed ? (releaseTextColor ?? LzColors.dark) : textColor ?? LzColors.dark),
                                margin: Ei.only(t: 15 * value))),
                  ],
                ),
              ),
            ),
        ],
      );
    }

    return CustomRefreshIndicator(
        onRefresh: onRefresh,
        offsetToArmed: offsetToArmed,
        builder: (
          BuildContext context,
          Widget child,
          IndicatorController controller,
        ) {
          return Stack(children: <Widget>[
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget? _) {
                // Color primaryColor = LazyUi.getConfig.primaryColor;
                double value = controller.value;

                Map<RefrehtorType, Widget> contents = {
                  RefrehtorType.curve: curveRefresh(value, controller),
                  RefrehtorType.bar: barRefresh(value, controller),
                  RefrehtorType.arrow: arrowRefresh(value, controller),
                };

                return contents[type]!;
              },
            ),
            child
          ]);
        },
        child: child);
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
    path.quadraticBezierTo(size.width / 2, size.height + (150 * value), size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
