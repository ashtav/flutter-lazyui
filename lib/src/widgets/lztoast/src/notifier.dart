import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ToastNotifier extends ChangeNotifier {
  bool toast = false, overlay = false, dismissOnTap = false, backdrop = false;
  bool isProgress = false, showPercentage = false;

  String toastMessage = '', overlayMessage = '';
  IconData? toastIcon;
  Color? toastBackgroundColor, toastTextColor;
  Duration? toastDuration;

  int toastMaxLength = 50;

  ToastPlacement? toastPlacement;
  Timer? timer;
  double? radius, progress = 0;

  void Function()? onCancel;

  void showToast(String? message,
      {IconData? icon,
      Color? backgroundColor,
      Color? textColor,
      Duration? duration,
      int? maxLength,
      ToastPlacement? placement,
      bool dismissOnTap = false,
      double? radius}) {
    timer?.cancel();

    toast = true;
    toastMessage = message.toString();
    toastIcon = icon;
    toastBackgroundColor = backgroundColor;
    toastTextColor = textColor;
    toastDuration = duration;
    toastMaxLength = maxLength ?? toastMaxLength;
    toastPlacement = placement;
    this.radius = radius;

    this.dismissOnTap = dismissOnTap;
    notifyListeners();

    timer = Timer(toastDuration ?? 2.s, () {
      toast = false;
      timer?.cancel();
      notifyListeners();
    });
  }

  void showOverlay(String? message,
      {bool dismissOnTap = false, bool isProgress = false, bool showPercentage = false, void Function()? onCancel}) {
    overlay = true;
    backdrop = true;
    this.dismissOnTap = dismissOnTap;
    this.isProgress = isProgress;
    this.showPercentage = showPercentage;
    this.onCancel = onCancel;
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

  void setProgress(double value) {
    progress = value;
    notifyListeners();
  }
}

class LzToastController {
  void setProgress(double value) {}
}
