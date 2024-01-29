import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/lzpicker/time/time_model.dart';

import 'date/date_picker.dart';
import 'option/picker_option.dart';
import 'time/time_picker.dart';

export 'option/picker_style.dart';
export 'date/date_picker_style.dart';
export 'time/time_picker_style.dart';

class LzPicker {
  static void option(BuildContext context,
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

  static void date(BuildContext context,
      {DateTime? initDate,
      DateTime? minDate,
      DateTime? maxDate,
      DatePickerStyle? style,
      String? format,
      bool withTime = false,
      Function(DateTime value)? onSelect}) async {
    if (minDate != null && maxDate != null && minDate.isAfter(maxDate)) {
      logg('First date must be smaller than last date.', name: 'LzPicker');
      return null;
    }

    format = format ?? 'd/m/y';

    // check valid format
    List<String> validFormat = ['d', 'm', 'mm', 'mmm', 'y'];
    List<String> formatList = format.split('/').toSet().toList();

    // if format is not contain d or m or y then return null
    if (!formatList.every((element) => validFormat.contains(element))) {
      logg('Invalid format, please use d/m/y', name: 'LzPicker');
      return null;
    }

    format = formatList.join('/');

    DateTime? result = await context.bottomSheet(
        LzDatePicker(
            initDate: initDate, minDate: minDate, maxDate: maxDate, style: style, format: format, withTime: withTime),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
  }

  static void time(BuildContext context,
      {Time? initTime, Time? minTime, Time? maxTime, TimePickerStyle? style, Function(Time value)? onSelect}) async {
    Time? result = await context.bottomSheet(
        LzTimePicker(initTime: initTime, minTime: minTime, maxTime: maxTime, style: style),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
  }
}
