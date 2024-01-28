import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'date/enum.dart';
import 'date/picker_date.dart';
import 'option/picker_option.dart';
export 'option/picker_style.dart';

class LzPicker {
  static option(BuildContext context,
      {List<Option> options = const [], Option? initialValue, Function(Option)? onSelect, PickerStyle? style}) {
    if (options.isEmpty) {
      return logg('The options list is empty, please provide a list of options.', name: 'LzPicker');
    }

    context.bottomSheet(
        LzPickerOption(
          initialValue: initialValue,
          options: options,
          onSelect: onSelect,
          style: style,
        ),
        backgroundColor: Colors.transparent,
        safeArea: !(style?.fullScreen ?? false));
  }

  static Future<DateTime?> date(BuildContext context,
      {DateTime? initialDate,
      DateTime? minDate,
      DateTime? maxDate,
      String? title,
      String confirmLabel = 'Confirm',
      bool useShortMonths = false,
      DatePickerType type = DatePickerType.all,
      AlignmentGeometry? alignment,
      Function(DateTime value)? onSelect}) async {
    if (minDate != null && maxDate != null && minDate.isAfter(maxDate)) {
      logg('First date must be smaller than last date', name: 'Pickers');
      return null;
    }

    DateTime? result = await context.bottomSheet(
        LzDatePicker(
            initialDate: initialDate,
            minDate: minDate,
            maxDate: maxDate,
            useShortMonths: useShortMonths,
            type: type,
            alignment: alignment,
            title: title,
            confirmLabel: confirmLabel),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
    return result;
  }
}
