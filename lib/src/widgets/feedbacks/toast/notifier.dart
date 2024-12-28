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
  bool visible = false;
  Type type = Type.toast;

  Messages message = Messages('', '', '');
  Timer? timer;

  void _visible([Type type_ = Type.toast, Duration? duration]) {
    timer?.cancel();
    visible = true;
    type = type_;

    timer = Timer(duration ?? 3.s, () {
      visible = false;
      notifyListeners();
    });
  }

  void show(String message) {
    _visible(Type.toast);

    this.message.toast = message;
    notifyListeners();
  }

  void overlay(String message, {Duration? duration}) {
    _visible(Type.overlay, duration);

    this.message.overlay = message;
    notifyListeners();
  }
}
