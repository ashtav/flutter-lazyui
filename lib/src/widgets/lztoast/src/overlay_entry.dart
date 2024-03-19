import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Ambiguity resolution helper function.
T? _ambiguate<T>(T? value) => value;

/// Custom overlay entry for displaying toast notifications.
class LzToastOverlayEntry extends OverlayEntry {
  /// A function that builds the overlay widget.
  final WidgetBuilder overlayBuilder;

  LzToastOverlayEntry({
    required this.overlayBuilder,
  }) : super(builder: overlayBuilder);

  @override
  void markNeedsBuild() {
    if (_ambiguate(SchedulerBinding.instance)!.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      _ambiguate(SchedulerBinding.instance)!.addPostFrameCallback((_) {
        super.markNeedsBuild();
      });
    } else {
      super.markNeedsBuild();
    }
  }
}
