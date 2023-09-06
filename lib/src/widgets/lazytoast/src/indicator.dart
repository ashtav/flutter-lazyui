part of lazytoast;

class ToastIndicator extends StatefulWidget {
  const ToastIndicator({
    Key? key,
  }) : super(key: key);

  @override
  State<ToastIndicator> createState() => _ToastIndicatorState();
}

class _ToastIndicatorState extends State<ToastIndicator> {
  final double _size = 40;

  /// indicator color of loading
  final Color _indicatorColor = Colors.white;
  late Widget _indicator;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = _size;

    _indicator = SpinKitFadingCircle(
      color: _indicatorColor,
      size: _size,
    );

    // switch (EasyLoadingTheme.indicatorType) {
    //   case EasyToastIndicatorType.fadingCircle:
    //     _indicator = SpinKitFadingCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.circle:
    //     _indicator = SpinKitCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.threeBounce:
    //     _indicator = SpinKitThreeBounce(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     width = _size * 2;
    //     break;
    //   case EasyToastIndicatorType.chasingDots:
    //     _indicator = SpinKitChasingDots(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.wave:
    //     _indicator = SpinKitWave(
    //       color: _indicatorColor,
    //       size: _size,
    //       itemCount: 6,
    //     );
    //     width = _size * 1.25;
    //     break;
    //   case EasyToastIndicatorType.wanderingCubes:
    //     _indicator = SpinKitWanderingCubes(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.rotatingCircle:
    //     _indicator = SpinKitRotatingCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.rotatingPlain:
    //     _indicator = SpinKitRotatingPlain(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.doubleBounce:
    //     _indicator = SpinKitDoubleBounce(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.fadingFour:
    //     _indicator = SpinKitFadingFour(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.fadingCube:
    //     _indicator = SpinKitFadingCube(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.pulse:
    //     _indicator = SpinKitPulse(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.cubeGrid:
    //     _indicator = SpinKitCubeGrid(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.foldingCube:
    //     _indicator = SpinKitFoldingCube(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.pumpingHeart:
    //     _indicator = SpinKitPumpingHeart(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.dualRing:
    //     _indicator = SpinKitDualRing(
    //       color: _indicatorColor,
    //       size: _size,
    //       lineWidth: EasyLoadingTheme.lineWidth,
    //     );
    //     break;
    //   case EasyToastIndicatorType.hourGlass:
    //     _indicator = SpinKitHourGlass(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.pouringHourGlass:
    //     _indicator = SpinKitPouringHourGlass(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.fadingGrid:
    //     _indicator = SpinKitFadingGrid(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.ring:
    //     _indicator = SpinKitRing(
    //       color: _indicatorColor,
    //       size: _size,
    //       lineWidth: EasyLoadingTheme.lineWidth,
    //     );
    //     break;
    //   case EasyToastIndicatorType.ripple:
    //     _indicator = SpinKitRipple(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.spinningCircle:
    //     _indicator = SpinKitSpinningCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyToastIndicatorType.squareCircle:
    //     _indicator = SpinKitSquareCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   default:
    //     _indicator = SpinKitFadingCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    // }

    return Container(
      constraints: BoxConstraints(
        maxWidth: width,
      ),
      child: _indicator,
    );
  }
}
