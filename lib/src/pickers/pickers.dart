// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../utils/log.dart';
import 'cupertino_date_picker.dart';
import 'cupertino_time_picker.dart';

class Pickers {
  /* ------------------------------------------------------------
  | DATE PICKER
  ------------------------------------ */

  static Future<DateTime?> datePicker(BuildContext context,
      {DateTime? initialDate,
      DateTime? firstDate,
      DateTime? lastDate,
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
        builder: (c) => CupertinoTimePickerWidget(initialDate: initialDate, firstDate: firstDate, lastDate: lastDate, confirmLabel: confirmLabel));

    return result;
  }
}
