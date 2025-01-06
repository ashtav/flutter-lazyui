import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

enum Type { toast, overlay, progress }

class Messages {
  String toast;
  String overlay;
  String progress;

  Messages(this.toast, this.overlay, this.progress);
}

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
      Type.overlay: () => overlayTimer = timer(),
    };

    clear[type]?.call();
  }

  void show(String message, {Duration? duration, Alignment? align, Color? color, IconData? icon}) {
    _visible(Type.toast, duration);

    this.message.toast = message;
    this.align = align ?? Alignment.center;
    this.color = color;
    this.icon = icon;
    notifyListeners();
  }

  void overlay(String message, {Duration? duration}) {
    _visible(Type.overlay, duration);

    this.message.overlay = message;
    notifyListeners();
  }

  void progress(String message, double Function() progress) {
    progressValue = 0;
    progressTimer?.cancel();

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
