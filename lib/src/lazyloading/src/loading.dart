import 'package:flutter/material.dart';

import 'main.dart';
import 'overlay_entry.dart';

class LzLoadingOverlay extends StatefulWidget {
  final Widget? child;

  const LzLoadingOverlay({
    Key? key,
    required this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  State<LzLoadingOverlay> createState() => _LzLoadingOverlayState();
}

class _LzLoadingOverlayState extends State<LzLoadingOverlay> {
  late LazyLoadingOverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
    overlayEntry = LazyLoadingOverlayEntry(
      overlayBuilder: (BuildContext context) => LazyLoading.instance.w ?? Container(),
    );
    LazyLoading.instance.overlayEntry = overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          LazyLoadingOverlayEntry(
            overlayBuilder: (BuildContext context) {
              if (widget.child != null) {
                return widget.child!;
              }

              return Container();
            },
          ),
          overlayEntry,
        ],
      ),
    );
  }
}
