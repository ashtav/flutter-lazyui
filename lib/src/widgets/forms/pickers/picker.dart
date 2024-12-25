import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/forms/pickers/time/time_picker.dart';

import 'date/date_picker.dart';
import 'time/time.dart';

export 'picker_style.dart';

class LzPicker {
  /// Displays a customizable date picker using a bottom sheet.
  ///
  /// [context] is required to display the bottom sheet.
  ///
  /// Optional parameters:
  /// - [initDate]: The initially selected date.
  /// - [minDate]: The minimum selectable date.
  /// - [maxDate]: The maximum selectable date.
  /// - [format]: The date format to display (e.g., 'd/m/y').
  /// - [style]: Custom styling for the date picker.
  /// - [withTime]: If `true`, includes time selection. Defaults to `false`.
  /// - [onSelect]: Callback that returns the selected date as [DateTime].
  ///
  /// Valid date formats: `d`, `m`, `mm`, `mmm`, `y`. Use `/` to separate parts.
  ///
  /// Example:
  /// ```dart
  /// LzPicker.date(context, onSelect: (value) {
  ///   print(value);
  /// });
  /// ```
  static void date(BuildContext context,
      {DateTime? initDate,
      DateTime? minDate,
      DateTime? maxDate,
      String? format,
      PickerStyle? style,
      bool withTime = false,
      Function(DateTime value)? onSelect}) async {
    if (minDate != null && maxDate != null && minDate.isAfter(maxDate)) {
      Print.log('Min date must be smaller than max date.');
      return null;
    }

    format = format ?? 'd/m/y';

    // check valid format
    List<String> validFormat = ['d', 'm', 'mm', 'mmm', 'y'];
    List<String> formatList = format.split('/').toSet().toList();

    // if format is not contain d or m or y then return null
    if (!formatList.every((element) => validFormat.contains(element))) {
      Print.log('Invalid format, please use d/m/y');
      return null;
    }

    format = formatList.join('/');

    DateTime? result = await context.bottomSheet(
        DatePickerWidget(
            initDate: initDate, minDate: minDate, maxDate: maxDate, style: style, format: format, withTime: withTime),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
  }

  static void dateRange({String fomat = 'y-m-d', bool time = false}) {}

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
      {Time? initTime, Time? minTime, Time? maxTime, PickerStyle? style, Function(Time value)? onSelect}) async {
    Time? result = await context.bottomSheet(
        TimePickerWidget(initTime: initTime, minTime: minTime, maxTime: maxTime, style: style),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
  }

  static void option() {}
}
