import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/lzconfirm/src/lzconfirm_widget.dart';

export 'src/enum.dart';

/// Utility class for displaying confirmation dialogs or sheets.
class LzConfirm {
  static void show(BuildContext context,
      {String? title,
      String? message,
      IconData? icon,
      String? confirmText,
      String? cancelText,
      Color? confirmColor,
      bool? darkMode,
      bool backBlur = true,
      Function()? onConfirm,
      ConfirmType type = ConfirmType.dialog,
      double? margin}) {
    // dialog
    if (type == ConfirmType.dialog) {
      context.dialog(
          LzConfirmWidget(
            title: title,
            message: message,
            icon: icon ?? Ti.questionMark,
            confirmText: confirmText ?? _confirmText,
            cancelText: cancelText ?? _cancelText,
            confirmColor: confirmColor,
            darkMode: darkMode ?? _darkMode ?? false,
            onConfirm: onConfirm,
            type: type,
            margin: margin ?? _margin,
          ),
          backBlur: backBlur);
    }

    // bottom sheet
    else {
      context.bottomSheet(
          LzConfirmWidget(
            title: title,
            message: message,
            icon: icon ?? Ti.questionMark,
            confirmText: _confirmText ?? confirmText,
            cancelText: _cancelText ?? cancelText,
            confirmColor: confirmColor,
            darkMode: darkMode ?? _darkMode ?? false,
            onConfirm: onConfirm,
            type: type,
            margin: margin ?? _margin,
          ),
          backBlur: backBlur,
          draggable: true);
    }
  }

  /// Configures global settings for confirmation dialogs or sheets.
  static void config(
      {String? confirmText,
      String? cancelText,
      double? margin,
      bool? darkMode}) {
    _confirmText = confirmText;
    _cancelText = cancelText;
    _margin = margin;
    _darkMode = darkMode;
  }
}

String? _confirmText, _cancelText;
double? _margin;
bool? _darkMode;
