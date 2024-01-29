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

    return Container(
      constraints: BoxConstraints(
        maxWidth: width,
      ),
      child: _indicator,
    );
  }
}
