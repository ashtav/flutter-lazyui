import 'package:flutter/material.dart';

import 'lztoast.dart';
import 'overlay_entry.dart';

/// A stateful widget for displaying toast messages overlaid on top of other widgets.
class LzToastOverlay extends StatefulWidget {
  /// The child widget to be displayed.
  final Widget? child;

  /// Creates a LzToastOverlay widget.
  const LzToastOverlay({
    Key? key,
    required this.child,
  }) : super(key: key);

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
          LzToastOverlayEntry(
              overlayBuilder: (BuildContext context) =>
                  widget.child ?? const SizedBox()),
          overlayEntry,
        ],
      ),
    );
  }
}
