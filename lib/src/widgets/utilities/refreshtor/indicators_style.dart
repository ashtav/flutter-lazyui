part of 'refreshtor.dart';

/// Defines the types of refresh indicators available.
///
/// - [bar]: Displays a bar-style refresh indicator.
/// - [arrow]: Displays an arrow-style refresh indicator.
/// - [curve]: Displays a curve-style refresh indicator.
enum RefreshType { bar, arrow, curve }

/// A private widget that displays a bar-style indicator for refresh actions.
///
/// This widget uses the provided [IndicatorController] to manage its state and
/// appearance. It is intended for internal use within the refresh indicator
/// system and should not be used directly.
///
/// {@tool snippet}
/// Example usage:
/// ```dart
/// _BarIndicator(controller)
/// ```
/// {@end-tool}
///
/// See also:
///  * [IndicatorController], which manages the indicator's state.
class _BarIndicator extends StatelessWidget {
  final IndicatorController controller;
  final String? message;
  const _BarIndicator(this.controller, this.message);

  @override
  Widget build(BuildContext context) {
    bool isArmed = controller.isArmed;
    bool isFinal = controller.isFinalizing;
    bool isSettling = controller.isSettling;

    double value = controller.value;

    final messages = (message ?? '').split('|');
    String release = messages.last;
    String pull = messages.first;

    return Stack(
      alignment: Ad.topCenter,
      children: [
        AnimatedOpacity(
          duration: isSettling ? 150.ms : 300.ms,
          opacity: isSettling
              ? 0
              : isFinal || value < .3
                  ? 0
                  : value.clamp(0, 1),
          child: Container(
              margin: Ei.only(t: 35 * value),
              padding: Ei.sym(v: 5, h: 15),
              child: BlinkAnimate(
                isAnimated: isArmed,
                child: Text(
                    message == null
                        ? isArmed
                            ? 'Release to refresh'
                            : 'Pull down to refresh'
                        : isArmed
                            ? release
                            : pull,
                    textAlign: Ta.center,
                    style: Gfont.fbold(isArmed).fs13),
              )),
        ),
        Container(
            height: .3,
            width: context.width * value,
            color: Colors.black.themeify.applyOpacity(value.clamp(0, 1))),
      ],
    );
  }
}

/// A custom painter that draws a curved shape, typically used for refresh indicators.
///
/// The [value] parameter controls the progress or extent of the curve,
/// and the optional [color] parameter specifies the color of the shape.
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

/// A custom [StatelessWidget] that displays a curve indicator for a refresh controller.
///
/// This widget is used internally by the refresh indicator system to visually
/// represent the current state of the [IndicatorController].
///
/// The [controller] parameter provides the necessary state and animation
/// information for rendering the curve indicator.
class _CurveIndicator extends StatelessWidget {
  final IndicatorController controller;
  final String? message;
  const _CurveIndicator(this.controller, this.message);

  @override
  Widget build(BuildContext context) {
    bool isArmed = controller.isArmed;
    bool isFinal = controller.isFinalizing;
    bool isLoading = controller.isLoading;

    double value = controller.value;

    final messages = (message ?? '').split('|');
    String release = messages.last;
    String pull = messages.first;

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        CustomPaint(
            painter: _CurvedShapePainter(
                value: isLoading || isFinal ? 0 : value * .4,
                color: context.isDarkMode ? darkAppbarColor : Colors.white),
            child: AnimatedContainer(
              duration: 150.ms,
              width: context.width,
              padding: Ei.only(t: (10 * value) + 3),
              height: isLoading || isFinal ? 0 : 55 * value + (value * 0),
              child: Center(
                child: AnimatedOpacity(
                    duration: 300.ms,
                    opacity: value > .4 ? 1 : 0,
                    child: BlinkAnimate(
                      isAnimated: isArmed,
                      child: Text(
                          message == null
                              ? isArmed
                                  ? 'Release to refresh'
                                  : 'Pull down to refresh'
                              : isArmed
                                  ? release
                                  : pull,
                          style: Gfont.fs13.fbold(isArmed),
                          textAlign: Ta.center),
                    )),
              ),
            ))
      ],
    );
  }
}

/// A widget that displays an arrow indicator, typically used to show the state of a refresh action.
///
/// The [_ArrowIndicator] listens to the provided [IndicatorController] to update its appearance
/// based on the current refresh state.
class _ArrowIndicator extends StatelessWidget {
  final IndicatorController controller;
  const _ArrowIndicator(this.controller);

  @override
  Widget build(BuildContext context) {
    bool isArmed = controller.isArmed;
    bool isFinal = controller.isFinalizing;
    bool isSettling = controller.isSettling;
    double value = controller.value;

    return AnimatedOpacity(
      duration: isSettling ? 150.ms : 300.ms,
      opacity: isSettling
          ? 0
          : isFinal || value < .3
              ? 0
              : value.clamp(0, 1),
      child: Container(
        margin: Ei.only(t: 35 * value),
        padding: Ei.all(10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode ? darkAppbarColor : Colors.white),
        child: BlinkAnimate(
            isAnimated: isArmed,
            child: Icon(isArmed ? Ti.arrowUp : Ti.arrowDown)),
      ),
    );
  }
}
