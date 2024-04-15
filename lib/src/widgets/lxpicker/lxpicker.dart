import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'date_range/date_picker.dart';
import 'option/picker_option.dart';
import 'time/time_picker.dart';

export 'date/date_picker.dart';
export 'date/date_picker_style.dart';
export 'option/picker_style.dart';
export 'time/time_model.dart';
export 'time/time_picker_style.dart';

/// Displays a picker with options.
class LxPicker {
  /// Displays a picker with options.
  ///
  /// Parameters:
  ///   - `context`: The build context.
  ///   - `options`: A list of options to display in the picker.
  ///   - `initialValue`: The initial value selected in the picker.
  ///   - `onSelect`: A function called when an option is selected in the picker.
  ///   - `style`: The style configuration for the picker.
  static void option(BuildContext context,
      {List<LxOption> options = const [],
      LxOption? initialValue,
      Function(LxOption)? onSelect,
      LxPickerStyle? style}) {
    if (options.isEmpty) {
      return logg(
          'The options list is empty, please provide a list of options.',
          name: 'LxPicker');
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

  /// Displays a date picker.
  ///
  /// Parameters:
  ///   - `context`: The build context.
  ///   - `initDate`: The initial date selected in the picker.
  ///   - `minDate`: The minimum selectable date in the picker.
  ///   - `maxDate`: The maximum selectable date in the picker.
  ///   - `style`: The style configuration for the date picker.
  ///   - `format`: The format of the selected date.
  ///   - `withTime`: A boolean indicating whether to include time selection in the picker.
  ///   - `onSelect`: A function called when a date is selected in the picker.
  static void date(BuildContext context,
      {DateTime? initDate,
      DateTime? minDate,
      DateTime? maxDate,
      DatePickerStyle? style,
      String? format,
      bool withTime = false,
      Function(DateTime value)? onSelect}) async {
    if (minDate != null && maxDate != null && minDate.isAfter(maxDate)) {
      logg('Min date must be smaller than max date.', name: 'LxPicker');
      return null;
    }

    format = format ?? 'd/m/y';

    // check valid format
    List<String> validFormat = ['d', 'm', 'mm', 'mmm', 'y'];
    List<String> formatList = format.split('/').toSet().toList();

    // if format is not contain d or m or y then return null
    if (!formatList.every((element) => validFormat.contains(element))) {
      logg('Invalid format, please use d/m/y', name: 'LxPicker');
      return null;
    }

    format = formatList.join('/');

    DateTime? result = await context.bottomSheet(
        LzDatePicker(
            initDate: initDate,
            minDate: minDate,
            maxDate: maxDate,
            style: style,
            format: format,
            withTime: withTime),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
  }

  static void dateRange(BuildContext context,
      {List<DateTime>? initDate,
      DateTime? minDate,
      DateTime? maxDate,
      DatePickerStyle? style,
      String? format,
      String? rangeFormat,
      Function(List<DateTime> value)? onSelect}) async {
    List<DateTime> initDateValue =
        initDate ?? [DateTime.now(), DateTime.now().add(1.d)];

    if (minDate != null && maxDate != null && minDate.isAfter(maxDate)) {
      logg('Min date must be smaller than max date.', name: 'LxPicker');
      return null;
    }

    // check valid initDate
    else if (initDate != null && initDate.length < 2) {
      initDateValue = [DateTime.now(), DateTime.now().add(1.d)];
    }

    // check valid minDate and maxDate
    else if (minDate != null && initDateValue[0].isBefore(minDate)) {
      initDateValue[0] = minDate;
    } else if (maxDate != null && initDateValue[1].isAfter(maxDate)) {
      initDateValue[1] = maxDate;
    }

    format = format ?? 'd/m/y';

    // check valid format
    List<String> validFormat = ['d', 'm', 'mm', 'mmm', 'y'];
    List<String> formatList = format.split('/').toSet().toList();

    // if format is not contain d or m or y then return null
    if (!formatList.every((element) => validFormat.contains(element))) {
      logg('Invalid format, please use d/m/y', name: 'LxPicker');
      return null;
    }

    format = formatList.join('/');

    List<DateTime>? result = await context.bottomSheet(
        LzDateRangePicker(
            initDate: initDateValue,
            minDate: minDate,
            maxDate: maxDate,
            style: style,
            format: format,
            rangeFormat: rangeFormat),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
  }

  /// Displays a time picker.
  ///
  /// Parameters:
  ///   - `context`: The build context.
  ///   - `initTime`: The initial time selected in the picker.
  ///   - `minTime`: The minimum selectable time in the picker.
  ///   - `maxTime`: The maximum selectable time in the picker.
  ///   - `style`: The style configuration for the time picker.
  ///   - `onSelect`: A function called when a time is selected in the picker.
  static void time(BuildContext context,
      {Time? initTime,
      Time? minTime,
      Time? maxTime,
      TimePickerStyle? style,
      Function(Time value)? onSelect}) async {
    Time? result = await context.bottomSheet(
        LzTimePicker(
            initTime: initTime,
            minTime: minTime,
            maxTime: maxTime,
            style: style),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
  }
}
