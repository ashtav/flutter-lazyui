import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ToastNotifier extends ChangeNotifier {
  bool toast = false, overlay = false, dismissOnTap = false, backdrop = false;
  String toastMessage = '', overlayMessage = '';
  IconData? toastIcon;
  Color? toastBackgroundColor, toastTextColor;
  Duration? toastDuration;
  int toastMaxLength = 50;
  ToastPlacement? toastPlacement;
  Timer? timer;

  void showToast(String? message,
      {IconData? icon,
      Color? backgroundColor,
      Color? textColor,
      Duration? duration,
      int? maxLength,
      ToastPlacement? placement,
      bool dismissOnTap = false}) {
    timer?.cancel();

    toast = true;
    toastMessage = message.toString();
    toastIcon = icon;
    toastBackgroundColor = backgroundColor;
    toastTextColor = textColor;
    toastDuration = duration;
    toastMaxLength = maxLength ?? toastMaxLength;
    toastPlacement = placement;

    this.dismissOnTap = dismissOnTap;
    notifyListeners();

    timer = Timer(toastDuration ?? 5.s, () {
      toast = false;
      timer?.cancel();
      notifyListeners();
    });
  }

  void showOverlay(String? message, {bool dismissOnTap = false}) {
    overlay = true;
    backdrop = true;
    overlayMessage = message.toString();
    notifyListeners();
  }

  void dismiss() {
    toast = false;
    overlay = false;
    backdrop = false;
    timer?.cancel();
    notifyListeners();
  }
}
