part of lazyloading;

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator> {
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
    //   case EasyLoadingIndicatorType.fadingCircle:
    //     _indicator = SpinKitFadingCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.circle:
    //     _indicator = SpinKitCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.threeBounce:
    //     _indicator = SpinKitThreeBounce(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     width = _size * 2;
    //     break;
    //   case EasyLoadingIndicatorType.chasingDots:
    //     _indicator = SpinKitChasingDots(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.wave:
    //     _indicator = SpinKitWave(
    //       color: _indicatorColor,
    //       size: _size,
    //       itemCount: 6,
    //     );
    //     width = _size * 1.25;
    //     break;
    //   case EasyLoadingIndicatorType.wanderingCubes:
    //     _indicator = SpinKitWanderingCubes(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.rotatingCircle:
    //     _indicator = SpinKitRotatingCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.rotatingPlain:
    //     _indicator = SpinKitRotatingPlain(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.doubleBounce:
    //     _indicator = SpinKitDoubleBounce(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.fadingFour:
    //     _indicator = SpinKitFadingFour(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.fadingCube:
    //     _indicator = SpinKitFadingCube(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.pulse:
    //     _indicator = SpinKitPulse(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.cubeGrid:
    //     _indicator = SpinKitCubeGrid(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.foldingCube:
    //     _indicator = SpinKitFoldingCube(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.pumpingHeart:
    //     _indicator = SpinKitPumpingHeart(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.dualRing:
    //     _indicator = SpinKitDualRing(
    //       color: _indicatorColor,
    //       size: _size,
    //       lineWidth: EasyLoadingTheme.lineWidth,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.hourGlass:
    //     _indicator = SpinKitHourGlass(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.pouringHourGlass:
    //     _indicator = SpinKitPouringHourGlass(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.fadingGrid:
    //     _indicator = SpinKitFadingGrid(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.ring:
    //     _indicator = SpinKitRing(
    //       color: _indicatorColor,
    //       size: _size,
    //       lineWidth: EasyLoadingTheme.lineWidth,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.ripple:
    //     _indicator = SpinKitRipple(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.spinningCircle:
    //     _indicator = SpinKitSpinningCircle(
    //       color: _indicatorColor,
    //       size: _size,
    //     );
    //     break;
    //   case EasyLoadingIndicatorType.squareCircle:
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
