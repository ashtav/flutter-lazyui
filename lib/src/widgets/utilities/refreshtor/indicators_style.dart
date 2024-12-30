part of 'refreshtor.dart';

enum RefreshType { bar, arrow, curve }

class _BarIndicator extends StatelessWidget {
  final IndicatorController controller;
  const _BarIndicator(this.controller);

  @override
  Widget build(BuildContext context) {
    bool isArmed = controller.isArmed;
    bool isFinal = controller.isFinalizing;
    bool isSettling = controller.isSettling;

    double value = controller.value;

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
                child: Text(isArmed ? 'Release to refresh' : 'Pull down to refresh',
                    textAlign: Ta.center, style: Gfont.fbold(isArmed).fs13),
              )),
        ),
        Container(height: .3, width: context.width * value, color: Colors.black.themeify.applyOpacity(value.clamp(0, 1))),
      ],
    );
  }
}

// Curve Shape Indicator

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

class _CurveIndicator extends StatelessWidget {
  final IndicatorController controller;
  const _CurveIndicator(this.controller);

  @override
  Widget build(BuildContext context) {
    bool isArmed = controller.isArmed;
    bool isFinal = controller.isFinalizing;
    bool isLoading = controller.isLoading;

    double value = controller.value;

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
                      child: Text(isArmed ? 'Release to refresh' : 'Pull down to refresh',
                          style: Gfont.fs13.fbold(isArmed), textAlign: Ta.center),
                    )),
              ),
            ))
      ],
    );
  }
}

// Arrow Indicator

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
        decoration: BoxDecoration(shape: BoxShape.circle, color: context.isDarkMode ? darkAppbarColor : Colors.white),
        child: BlinkAnimate(isAnimated: isArmed, child: Icon(isArmed ? Ti.arrowUp : Ti.arrowDown)),
      ),
    );
  }
}
