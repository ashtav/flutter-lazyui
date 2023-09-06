library pickers;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/constants/value.dart';

import 'datetime/datetime_selector.dart';
import 'notifier.dart';

part 'cupertino_date_picker.dart';
part 'cupertino_datetime_picker.dart';
part 'cupertino_time_picker.dart';

class LzPicker {
  /* ------------------------------------------------------------
  | DATE PICKER
  ------------------------------------ */

  static Future<DateTime?> datePicker(BuildContext context,
      {DateTime? initialDate,
      DateTime? minDate,
      DateTime? maxDate,
      String? title,
      String confirmLabel = 'Confirm',
      bool useShortMonths = false,
      DatePickerType type = DatePickerType.all,
      AlignmentGeometry? alignment}) async {
    if (minDate != null && maxDate != null && minDate.isAfter(maxDate)) {
      logg('First date must be smaller than last date', name: 'Pickers');
      return null;
    }

    DateTime? result = await context.bottomSheet(
        CupertinoDatePickerWidget(
            initialDate: initialDate,
            minDate: minDate,
            maxDate: maxDate,
            useShortMonths: useShortMonths,
            type: type,
            alignment: alignment,
            title: title,
            confirmLabel: confirmLabel),
        enableDrag: true,
        useSafeArea: false,
        isScrollControlled: true);

    return result;
  }

  /* ------------------------------------------------------------
  | TIME PICKER
  ------------------------------------ */

  static Future<DateTime?> timePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    String? title,
    String confirmLabel = 'Confirm',
  }) async {
    if (minDate != null && maxDate != null && minDate.isAfter(maxDate)) {
      logg('First date must be smaller than last date', name: 'Pickers');
      return null;
    }

    DateTime? result = await context.bottomSheet(
        CupertinoTimePickerWidget(
            initialDate: initialDate,
            minDate: minDate,
            maxDate: maxDate,
            title: title,
            confirmLabel: confirmLabel),
        enableDrag: true,
        useSafeArea: false,
        isScrollControlled: true);

    return result;
  }

  /* ------------------------------------------------------------
  | DATE TIME PICKER
  ------------------------------------ */

  static Future<DateTime?> dateTimePicker(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
    String? title,
    String confirmLabel = 'Confirm',
  }) async {
    if (minDate != null && maxDate != null && minDate.isAfter(maxDate)) {
      logg('First date must be smaller than last date', name: 'Pickers');
      return null;
    }

    DateTime? result = await context.bottomSheet(
        DateTimeSelector(
            initialDate: initialDate,
            minDate: minDate,
            maxDate: maxDate,
            title: title,
            confirmLabel: confirmLabel),
        enableDrag: true,
        useSafeArea: false,
        isScrollControlled: true);

    return result;
  }
}
