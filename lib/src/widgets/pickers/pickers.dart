library pickers;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/config/constant.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';

part 'cupertino_date_picker.dart';
part 'cupertino_time_picker.dart';

class Pickers {
  /* ------------------------------------------------------------
  | DATE PICKER
  ------------------------------------ */

  static Future<DateTime?> datePicker(BuildContext context,
      {DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate,
      String? title,
      String confirmLabel = 'Confirm',
      bool useShortMonths = false,
      DatePickerType type = DatePickerType.all,
      AlignmentGeometry? alignment}) async {
    if (firstDate != null && lastDate != null && firstDate.isAfter(lastDate)) {
      logg('First date must be smaller than last date', name: 'Pickers');
      return null;
    }

    DateTime? result = await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (c) => CupertinoDatePickerWidget(
            initialDate: initialDate,
            firstDate: firstDate,
            lastDate: lastDate,
            useShortMonths: useShortMonths,
            type: type,
            alignment: alignment,
            title: title,
            confirmLabel: confirmLabel));

    return result;
  }

  /* ------------------------------------------------------------
  | TIME PICKER
  ------------------------------------ */

  static Future<DateTime?> timePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String? title,
    String confirmLabel = 'Confirm',
  }) async {
    if (firstDate != null && lastDate != null && firstDate.isAfter(lastDate)) {
      logg('First date must be smaller than last date', name: 'Pickers');
      return null;
    }

    DateTime? result = await showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        builder: (c) =>
            CupertinoTimePickerWidget(initialDate: initialDate, firstDate: firstDate, lastDate: lastDate, title: title, confirmLabel: confirmLabel));

    return result;
  }
}
