import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// Notifier for managing toast and overlay states and configurations.
class ToastNotifier extends ChangeNotifier {
  /// Flag indicating whether a toast is currently displayed.
  bool toast = false;

  /// Flag indicating whether an overlay is currently displayed.
  bool overlay = false;

  /// Flag indicating whether the toast should be dismissed on tap.
  bool dismissOnTap = false;

  /// Flag indicating whether a backdrop should be displayed behind the toast.
  bool backdrop = false;

  /// Flag indicating whether the current overlay is a progress indicator.
  bool isProgress = false;

  /// Flag indicating whether to display the progress percentage.
  bool showPercentage = false;

  /// The message content of the toast.
  String toastMessage = '';

  /// The message content of the overlay.
  String overlayMessage = '';

  /// The icon to display in the toast.
  IconData? toastIcon;

  /// The background color of the toast.
  Color? toastBackgroundColor;

  /// The text color of the toast.
  Color? toastTextColor;

  /// The duration for which the toast should be displayed.
  Duration? toastDuration;

  /// The maximum length of the toast message before truncation.
  int toastMaxLength = 80;

  /// The placement of the toast on the screen.
  ToastPlacement? toastPlacement;

  /// Timer for controlling toast duration.
  Timer? timer;

  /// Timer for controlling overlay duration.
  Timer? overlayTimer;

  /// The corner radius of the toast or overlay.
  double? radius;

  /// The current progress value for the progress indicator overlay.
  double? progress = 0;

  /// Callback for when the overlay is dismissed.
  void Function()? onCancel;

  /// Shows the toast message
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

  /// Shows the toast message with an optional overlay (background).
  void showOverlay(String? message,
      {bool dismissOnTap = false,
      bool isProgress = false,
      bool showPercentage = false,
      void Function()? onCancel}) {
    overlay = true;
    backdrop = true;
    this.dismissOnTap = dismissOnTap;
    this.isProgress = isProgress;
    this.showPercentage = showPercentage;
    this.onCancel = onCancel;
    overlayMessage = message.toString();
    notifyListeners();
  }

  /// Dismisses the toast message and/or the overlay (optional).
  void dismiss({bool toast = true, bool overlay = true}) {
    this.toast = !toast;
    this.overlay = !overlay;
    backdrop = false;
    overlayTimer?.cancel();
    notifyListeners();
  }

  /// Sets the progress value (likely for a progress bar within the toast).
  void setProgress(double value) {
    progress = value;
    notifyListeners();
  }
}

/// Controller for managing the progress of LzToast overlays.
class LzToastController {
  /// Sets the progress value for the LzToast overlay.
  void setProgress(double value) {}
}
