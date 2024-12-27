import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/forms/pickers/time/time_picker.dart';

import 'date/date_picker.dart';
import 'date_range/date_range_picker.dart';
import 'option/option_picker.dart';
import 'time/time.dart';

export '../../../models/option.dart';
export 'option/option_picker_style.dart';
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

  /// Opens a date range picker dialog and returns the selected date range.
  ///
  /// Displays a picker for selecting a start and end date.
  /// Allows customization with minimum and maximum dates, formatting,
  /// and additional style options.
  ///
  /// Parameters:
  /// - [context]: The build context.
  /// - [initDate]: Initial date range to display in the picker.
  /// - [minDate]: The earliest selectable date.
  /// - [maxDate]: The latest selectable date.
  /// - [style]: Style configuration for customizing the picker appearance.
  /// - [format]: Date format (e.g., 'd/m/y').
  /// - [rangeFormat]: Format for the date range display.
  /// - [withTime]: Whether to include time selection in the picker.
  /// - [onSelect]: Callback triggered when a date range is selected.
  ///
  /// Example:
  /// ```dart
  /// LzPicker.dateRange(
  ///   context,
  ///   onSelect: (value) {
  ///     print('Selected date range: $value');
  ///   },
  /// );
  /// ```
  static void dateRange(BuildContext context,
      {List<DateTime>? initDate,
      DateTime? minDate,
      DateTime? maxDate,
      PickerStyle? style,
      String? format,
      String? rangeFormat,
      bool withTime = false,
      Function(List<DateTime> value)? onSelect}) async {
    List<DateTime> initDateValue = initDate ?? [DateTime.now(), DateTime.now().add(1.d)];

    if (minDate != null && maxDate != null && minDate.isAfter(maxDate)) {
      Print.log('Min date must be smaller than max date.');
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
      Print.log('Invalid format, please use d/m/y');
      return null;
    }

    format = formatList.join('/');

    List<DateTime>? result = await context.bottomSheet(
        DateRangePickerWidget(
          initDate: initDateValue,
          minDate: minDate,
          maxDate: maxDate,
          style: style,
          format: format,
          rangeFormat: rangeFormat,
          withTime: withTime,
        ),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
  }

  /// Displays a time picker in a bottom sheet.
  ///
  /// This method allows users to select a time within a specified range.
  /// The picker can be customized with initial, minimum, and maximum times,
  /// as well as additional styling.
  ///
  /// Parameters:
  /// - [context]: The build context.
  /// - [initTime]: The initial time selected when the picker opens.
  /// - [minTime]: The earliest selectable time in the picker.
  /// - [maxTime]: The latest selectable time in the picker.
  /// - [style]: Style configuration for customizing the appearance of the picker.
  /// - [onSelect]: A callback function triggered when a time is selected.
  ///
  /// Example:
  /// ```dart
  /// // Basic usage
  /// LzPicker.time(
  ///   context,
  ///   onSelect: (value) {
  ///     print('Selected time: $value');
  ///   },
  /// );
  static void time(BuildContext context,
      {Time? initTime, Time? minTime, Time? maxTime, PickerStyle? style, Function(Time value)? onSelect}) async {
    Time? result = await context.bottomSheet(
        TimePickerWidget(initTime: initTime, minTime: minTime, maxTime: maxTime, style: style),
        draggable: true,
        safeArea: false,
        isScrollControlled: true);

    if (result != null && onSelect != null) onSelect(result);
  }

  /// Displays a picker with a list of selectable options.
  ///
  /// This method shows a bottom sheet with options that users can select.
  /// Options can be customized with styles and an initial value.
  ///
  /// Parameters:
  /// - [context]: The build context.
  /// - [options]: A list of options to display in the picker.
  /// - [initialValue]: The initially selected value in the picker.
  /// - [onSelect]: A callback function triggered when an option is selected.
  /// - [style]: The style configuration for the picker, such as maxLines.
  ///
  /// Example:
  /// ```dart
  /// // Simple example
  /// LzPicker.option(
  ///   context,
  ///   options: ['Apple', 'Orange', 'Banana'].option(
  ///     values: [1, 2, 3],
  ///     disabled: ['Apple'],
  ///   ),
  /// );
  ///
  /// // Example with long content
  /// LzPicker.option(
  ///   context,
  ///   options: ['This is a very long content example that needs truncation.'].option(),
  ///   style: OptionPickerStyle(maxLines: 2),
  /// );
  /// ```
  static void option(
    BuildContext context, {
    List<Option> options = const [],
    Option? initialValue,
    void Function(Option)? onSelect,
    OptionPickerStyle? style,
  }) {
    if (options.isEmpty) {
      Print.log('The options list is empty, please provide a list of options.');
      return;
    }

    context.bottomSheet(
      PickerOptionWidget(
        initialValue: initialValue,
        options: options,
        onSelect: onSelect,
        style: style,
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      safeArea: false,
    );
  }
}
