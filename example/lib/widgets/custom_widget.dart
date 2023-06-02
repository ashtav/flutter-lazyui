import 'package:flutter/material.dart';

class OnDisposed extends StatefulWidget {
  final Widget child;
  final Function()? onInit, onDispose;
  const OnDisposed({super.key, required this.child, this.onInit, this.onDispose});

  @override
  State<OnDisposed> createState() => _OnDisposedState();
}

class _OnDisposedState extends State<OnDisposed> {
  @override
  void dispose() {
    widget.onDispose?.call();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onInit?.call();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
