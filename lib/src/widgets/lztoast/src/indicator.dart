import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ToastIndicator extends StatefulWidget {
  const ToastIndicator({
    Key? key,
  }) : super(key: key);

  @override
  State<ToastIndicator> createState() => _ToastIndicatorState();
}

class _ToastIndicatorState extends State<ToastIndicator> {
  late Widget _indicator;

  final double _size = 40;
  final Color _indicatorColor = Colors.white;

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
