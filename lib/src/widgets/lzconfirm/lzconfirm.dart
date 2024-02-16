import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/lzconfirm/src/lzconfirm_widget.dart';

enum ConfirmType { dialog, sheet }

class LzConfirm {
  static void show(BuildContext context,
      {String? title,
      String? message,
      IconData? icon,
      String? confirmText,
      String? cancelText,
      Color? confirmColor,
      bool darkMode = false,
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
            confirmText: confirmText,
            cancelText: cancelText,
            confirmColor: confirmColor,
            darkMode: darkMode,
            onConfirm: onConfirm,
            type: type,
            margin: margin,
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
            confirmText: confirmText,
            cancelText: cancelText,
            confirmColor: confirmColor,
            darkMode: darkMode,
            onConfirm: onConfirm,
            type: type,
            margin: margin,
          ),
          backBlur: backBlur, draggable: true);
    }
  }
}
