part of widget;

/// `Refreshtor` is a Flutter widget that provides a pull-to-refresh functionality for scrollable content. It allows users to refresh the content by pulling down the widget, and you can customize the appearance and behavior of the refresh indicator.
///
/// Example usage:
/// ```dart
/// Refreshtor(
///   onRefresh: () async {
///     // Handle the refresh operation here.
///   },
///   child: ListView.builder(
///     itemCount: itemCount,
///     itemBuilder: (context, index) {
///       return ListTile(title: Text('Item $index'));
///     },
///   ),
///   text: 'Pull to refresh', // Text displayed when not yet armed.
///   releaseText: 'Release to refresh', // Text displayed when armed.
///   indicatorColor: Colors.blue, // Color of the refresh indicator.
///   textColor: Colors.black, // Text color.
///   releaseTextColor: Colors.black, // Text color when armed.
///   backgroundColor: Colors.white, // Background color.
///   type: RefrehtorType.bar, // Type of refresh indicator (bar or circular).
///   offsetToArmed: 80, // Offset required to arm the refresh.
///   height: 60, // Height of the refresh indicator.
/// )
/// ```
class Refreshtor extends StatelessWidget {
  /// Function to execute when a refresh is triggered.
  final Future<void> Function() onRefresh;

  /// Child widget to display the scrollable content.
  final Widget child;

  /// Text displayed when not yet armed for refresh.
  final String? text;

  /// Text displayed when armed for refresh.
  final String? releaseText;

  /// Color of the refresh indicator.
  final Color? indicatorColor;

  /// Text color.
  final Color? textColor;

  /// Text color when armed for refresh.
  final Color? releaseTextColor;

  /// Background color of the widget.
  final Color? backgroundColor;

  /// Type of refresh indicator (bar or circular).
  final RefrehtorType type;

  /// Offset required to arm the refresh.
  final double offsetToArmed;

  /// Height of the refresh indicator.
  final double? height;

  /// Creates a `Refreshtor` widget with customizable properties.
  ///
  /// The [onRefresh] parameter is a function to execute when a refresh is triggered.
  ///
  /// The [child] parameter is the child widget that displays the scrollable content.
  ///
  /// The [text] parameter is the text displayed when not yet armed for refresh.
  ///
  /// The [releaseText] parameter is the text displayed when armed for refresh.
  ///
  /// The [indicatorColor] parameter is the color of the refresh indicator.
  ///
  /// The [textColor] parameter is the text color.
  ///
  /// The [releaseTextColor] parameter is the text color when armed for refresh.
  ///
  /// The [backgroundColor] parameter is the background color of the widget.
  ///
  /// The [type] parameter is the type of refresh indicator (bar or circular).
  ///
  /// The [offsetToArmed] parameter is the offset required to arm the refresh.
  ///
  /// The [height] parameter is the height of the refresh indicator.
  const Refreshtor({
    Key? key,
    required this.onRefresh,
    required this.child,
    this.text,
    this.releaseText,
    this.indicatorColor,
    this.textColor,
    this.releaseTextColor,
    this.backgroundColor,
    this.type = RefrehtorType.bar,
    this.offsetToArmed = 80,
    this.height,
  }) : super(key: key);

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
              painter: _CurvedShapePainter(
                  value: isLoading || isFinal ? 0 : value * .4,
                  color: backgroundColor),
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
                        color: indicatorColor ??
                            (LzColors.isDark(backgroundColor ?? Colors.white)
                                ? Colors.white
                                : LzColors.dark),
                        borderRadius: Br.radius(50 * (1 - value.clamp(0, 1))))),
                if (!isLoading && !isFinal)
                  AnimatedOpacity(
                    duration: 300.ms,
                    opacity: value > .2 ? 1 : 0,
                    child: Textr(
                        isArmed
                            ? (releaseText ?? 'Release to refresh')
                            : (text ?? 'Pull down to refresh'),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13,
                            fontWeight: isArmed ? Fw.bold : Fw.normal,
                            color: isArmed
                                ? (releaseTextColor ??
                                    (LzColors.isDark(
                                            backgroundColor ?? Colors.white)
                                        ? Colors.white
                                        : LzColors.dark))
                                : textColor ??
                                    (LzColors.isDark(
                                            backgroundColor ?? Colors.white)
                                        ? Colors.white
                                        : LzColors.dark)),
                        margin: Ei.only(t: 5 * value)),
                  )
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
                        decoration: BoxDecoration(
                            color: indicatorColor ?? LzColors.dark,
                            borderRadius:
                                Br.radius(50 * (1 - value.clamp(0, 1))))),
                    SlideSwitched(
                      withOpacity: true,
                      child: value < .2
                          ? const None()
                          : Textr(
                              isArmed
                                  ? (releaseText ?? 'Release to refresh')
                                  : (text ?? 'Pull down to refresh'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 13,
                                      fontWeight: isArmed ? Fw.bold : Fw.normal,
                                      color: isArmed
                                          ? (releaseTextColor ?? LzColors.dark)
                                          : textColor ?? LzColors.dark),
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
                                    ).blink(isArmed, 300.ms),
                                  ),
                                ),
                              )),
                    SlideSwitched(
                        withOpacity: true,
                        child: value < .2
                            ? const None()
                            : Textr(
                                isArmed
                                    ? (releaseText ?? 'Release to refresh')
                                    : (text ?? 'Pull down to refresh'),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        fontSize: 13,
                                        fontWeight:
                                            isArmed ? Fw.bold : Fw.normal,
                                        color: isArmed
                                            ? (releaseTextColor ??
                                                LzColors.dark)
                                            : textColor ?? LzColors.dark),
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

                return Container(
                    margin: Ei.only(t: height ?? 0), child: contents[type]!);
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
