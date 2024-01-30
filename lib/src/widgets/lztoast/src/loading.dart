import 'package:flutter/material.dart';

import 'lztoast_widget.dart';
import 'overlay_entry.dart';

class LzToastOverlay extends StatefulWidget {
  final Widget? child;

  const LzToastOverlay({
    Key? key,
    this.child,
  })  : assert(child != null),
        super(key: key);

  @override
  State<LzToastOverlay> createState() => _LzToastOverlayState();
}

class _LzToastOverlayState extends State<LzToastOverlay> {
  late LzToastOverlayEntry overlayEntry;

  @override
  void initState() {
    super.initState();
    overlayEntry = LzToastOverlayEntry(
      overlayBuilder: (BuildContext context) => const LzToastWidget(),
    );
    LzToast.instance.overlayEntry = overlayEntry;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Overlay(
        initialEntries: [
          LzToastOverlayEntry(overlayBuilder: (BuildContext context) => widget.child ?? const SizedBox()),
          overlayEntry,
        ],
      ),
    );
  }
}
