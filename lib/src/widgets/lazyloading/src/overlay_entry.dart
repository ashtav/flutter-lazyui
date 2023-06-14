import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

T? _ambiguate<T>(T? value) => value;

class LazyLoadingOverlayEntry extends OverlayEntry {
  final WidgetBuilder overlayBuilder;

  LazyLoadingOverlayEntry({
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
