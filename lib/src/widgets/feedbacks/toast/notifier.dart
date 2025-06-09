import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// Defines the types of notifications that can be displayed.
///
/// - [toast]: A brief message displayed at the bottom or top of the screen.
/// - [overlay]: A message or widget that overlays the current content.
/// - [progress]: A notification indicating ongoing progress.
enum Type { toast, overlay, progress }

/// Holds messages for different notification types.
class Messages {
  /// The message to display for toast notifications.
  String toast;

  /// The message to display for overlay notifications.
  String overlay;

  /// The message to display for progress notifications.
  String progress;

  Messages(this.toast, this.overlay, this.progress);
}

/// A [ChangeNotifier] that manages the state and notifications for toast messages.
///
/// Use this class to display, update, or dismiss toast notifications within your application.
/// Listeners can subscribe to changes and update the UI accordingly.
class ToastNotifier extends ChangeNotifier {
  List<Type> types = [];

  Messages message = Messages('', '', '');

  Timer? toastTimer;
  Timer? overlayTimer;
  Timer? progressTimer;

  double? progressValue = 0;

  Alignment align = Alignment.center;
  Color? color;
  IconData? icon;
  int maxLength = 35;
  Function()? onCancel;

  void _visible([Type type = Type.toast, Duration? duration]) {
    Map<Type, void Function()?> cancel = {
      Type.toast: toastTimer?.cancel,
      Type.overlay: overlayTimer?.cancel,
    };

    cancel[type]?.call();

    types.remove(type);
    types.add(type);

    Timer timer() {
      return Timer(duration ?? 2.s, () {
        types.remove(type);
        notifyListeners();
      });
    }

    Map<Type, void Function()?> clear = {
      Type.toast: () => toastTimer = timer(),
      Type.overlay: () => duration == null ? {} : overlayTimer = timer(),
    };

    clear[type]?.call();
  }

  void show(String message,
      {Duration? duration,
      Alignment? align,
      Color? color,
      IconData? icon,
      int? maxLength}) {
    _visible(Type.toast, duration);

    this.message.toast = message;
    this.align = align ?? Alignment.center;
    this.color = color;
    this.icon = icon;
    this.maxLength = maxLength ?? 60;
    notifyListeners();
  }

  void overlay(String message, {Duration? duration, Function()? onCancel}) {
    toastTimer?.cancel();
    types.remove(Type.toast);

    _visible(Type.overlay, duration);

    this.message.overlay = message;
    this.onCancel = onCancel;
    notifyListeners();
  }

  void progress(String message, double Function() progress,
      {Function()? onCancel}) {
    progressValue = 0;
    progressTimer?.cancel();
    toastTimer?.cancel();

    types.remove(Type.toast);
    types.remove(Type.progress);
    types.add(Type.progress);
    notifyListeners();

    bool hasChanged = false;

    progressTimer = Timer.periodic(200.ms, (_) {
      double value = progress();
      progressValue = value;
      notifyListeners();

      if (value >= 100 || (hasChanged && value == 0)) {
        progressValue = 100;
        progressTimer?.cancel();

        progressTimer = Timer(200.ms, () {
          progressValue = 0;
          progressTimer?.cancel();
          types.remove(Type.progress);
          notifyListeners();
        });
      }

      hasChanged = value > 0;
    });

    this.message.progress = message;
    this.onCancel = onCancel;
    notifyListeners();
  }

  void setProgressValue(double value) {
    progressValue = value;
    notifyListeners();
  }

  void cancel() {
    types.remove(Type.overlay);
    types.remove(Type.progress);
    notifyListeners();

    progressTimer?.cancel();
    overlayTimer?.cancel();
  }
}
