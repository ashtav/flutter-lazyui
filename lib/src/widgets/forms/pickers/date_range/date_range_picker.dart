import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/theme/color.dart';

import '../date/date_picker.dart';
import '../time/time.dart';
import 'notifier.dart';

/// A date picker widget for selecting dates.
class DateRangePickerWidget extends StatelessWidget {
  /// The initial date selected on the date picker.
  final List<DateTime>? initDate;

  /// The minimum selectable date on the date picker.
  final DateTime? minDate;

  /// The maximum selectable date on the date picker.
  final DateTime? maxDate;

  /// The style configuration for the date picker.
  final PickerStyle? style;

  /// The format of the selected date.
  final String? format;

  /// Determines if the date picker includes time selection.
  final String? rangeFormat;

  /// Determines if the date picker includes time selection.
  final bool withTime;

  /// Constructs a [DateRangePickerWidget] widget with optional parameters.
  const DateRangePickerWidget(
      {super.key,
      this.initDate,
      this.minDate,
      this.maxDate,
      this.style,
      this.format,
      this.rangeFormat,
      this.withTime = false});

  @override
  Widget build(BuildContext context) {
    List<String> formats = (format ?? 'd/m/y').split('/');

    final notifier = DateRangePickerNotifier();
    notifier.onInitialized(formats,
        initDate: initDate, minDate: minDate, maxDate: maxDate);

    double height = context.height * .5;

    if (context.height < 800) {
      height = context.height * .7;
    }

    return ScrollGlowless(
      child: Container(
        decoration: BoxDecoration(
            color:
                context.isDarkMode ? darkAppbarColor : scaffoldBackgroundColor),
        child: Stack(
          children: [
            Container(
              padding: Ei.only(b: 70),
              child: SizedBox(
                height: height - 70,
                child: Intrinsic(
                  children: formats.generate((format, i) {
                    final items = notifier.generateDate(format);
                    return Container(
                        decoration: BoxDecoration(
                            border: Br.only(['l'], except: i == 0)),
                        child: CupertinoPickerWidget(notifier,
                            format: format, items: items, style: style));
                  }),
                ),
              ),
            ),

            // start date & end date
            StartEndDate(notifier, style: style, format: rangeFormat),

            // confirm button
            ConfirmButton(
              confirmText: style?.confirmText,
              confirmTextColor: style?.confirmTextColor,
              buttonColor: style?.buttonColor,
              onConfirm: () {
                if (notifier.openTimePicker) {
                  notifier.times[notifier.dateIndex] =
                      Time(notifier.values['h']!, notifier.values['i']!);
                  notifier.updateDateTime();
                  notifier.toggleTimePicker();
                  return;
                }

                context.lz.pop(notifier.initDate);
              },
              onCancel: () {
                if (notifier.openTimePicker) {
                  notifier.values['h'] =
                      notifier.times[notifier.dateIndex].hour;
                  notifier.values['i'] =
                      notifier.times[notifier.dateIndex].minute;
                  notifier.toggleTimePicker();
                  return;
                }

                context.lz.pop();
              },
            ),

            // time picker
            if (withTime) TimePicker(notifier, style: style)
          ],
        ),
      ).lz.clip(tlr: config.borderRadius),
    );
  }
}

/// Represents a widget for displaying a Cupertino-style picker.
///
/// This widget is likely used within a date picker UI to select specific
/// values (e.g., year, month, day) using a picker wheel.
class CupertinoPickerWidget extends StatelessWidget {
  /// The `DatePickerNotifier` instance used for managing picker state and updates.
  final DateRangePickerNotifier notifier;

  /// The format of value being selected (e.g., "year", "month", "day").
  final String format;

  /// List of items to display in the picker wheel (defaults to an empty list).
  final List<String> items;

  /// Optional magnification factor for the picker wheel (default: unspecified).
  final double? magnification;

  /// Optional extent (height) of each item in the picker wheel (default: unspecified).
  final double? itemExtent;

  /// Optional diameter ratio for the picker wheel (default: unspecified).
  final double? diameterRatio;

  /// Optional squeeze factor for the picker wheel (default: unspecified).
  final double? squeeze;

  /// Optional styling options for the picker (default: unspecified).
  final PickerStyle? style;

  /// Optional letter spacing for the picker text (default: unspecified).
  final double? letterSpacing;

  /// Optional background color for the picker (default: unspecified).
  final Color? backgroundColor;

  /// Creates a new `CupertinoPickerWidget` instance.
  ///
  /// [notifier] and [type] are required parameters.
  /// All other parameters are optional.
  const CupertinoPickerWidget(this.notifier,
      {super.key,
      required this.format,
      this.items = const [],
      this.magnification,
      this.itemExtent,
      this.diameterRatio,
      this.squeeze,
      this.style,
      this.letterSpacing,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    int length = notifier.controller.keys.length;
    bool isYearOnly =
        notifier.controller.keys.toList().contains('y') && length == 1;

    double magnification = this.magnification ?? (isYearOnly ? 1.5 : 1);
    double itemExtent = this.itemExtent ?? (isYearOnly ? 45 : 40);
    double squeeze = this.squeeze ?? (isYearOnly ? .5 : 0.9);
    double diameterRatio = this.diameterRatio ?? .6;

    String format = ['mm', 'mmm'].contains(this.format) ? 'm' : this.format;

    return notifier.watch((state) => CupertinoPicker(
        magnification: magnification,
        useMagnifier: true,
        itemExtent: itemExtent,
        diameterRatio: diameterRatio,
        squeeze: squeeze,
        scrollController: notifier.controller[format] ??
            FixedExtentScrollController(initialItem: 0),
        selectionOverlay: Container(
          alignment: Alignment.centerRight,
          decoration:
              BoxDecoration(color: Colors.black.applyOpacity(.03).themeify),
        ),
        onSelectedItemChanged: (int i) => notifier.onChange(i, format),
        children: items.generate((item, i) {
          return Align(
            alignment: Alignment.center,
            child: ZoomIn(
              child: Textr(
                item,
                style: config.font.copyWith(
                    color: state.dates.contains(item) || this.format != 'd'
                        ? Colors.black87
                        : Colors.black12,
                    letterSpacing: letterSpacing),
                padding: Ei.sym(h: 15),
              ),
            ),
          );
        })));
  }
}

/// Represents a time picker widget likely used within a date picker UI.
///
/// This widget allows users to select a specific time, potentially in
/// conjunction with a date picker for a complete datetime selection.
class TimePicker extends StatelessWidget {
  /// The `DatePickerNotifier` instance used for interaction with picker state.
  final DateRangePickerNotifier notifier;

  /// Optional styling options for the time picker (default: unspecified).
  final PickerStyle? style;

  /// Creates a new `TimePicker` instance.
  ///
  /// [notifier] is required, [style] is optional.
  const TimePicker(this.notifier, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    return Poslign(
        alignment: Alignment.topRight,
        margin: Ei.only(t: 20, r: 20),
        child: notifier.watch((state) {
          String time = state.times[state.dateIndex].value;
          bool isOpened = state.openTimePicker;

          return Touch(
              onTap: isOpened
                  ? null
                  : () {
                      notifier.toggleTimePicker();
                    },
              color: context.isDarkMode ? darkBackgroundColor : backgroundColor,
              border: Br.all(),
              radius: Br.radius(config.borderRadius),
              child: AnimatedContainer(
                duration: 350.ms,
                curve: isOpened
                    ? Curves.easeInOutBack
                    : Curves.fastEaseInToSlowEaseOut,
                height: isOpened ? 250 : 35,
                width: isOpened ? context.width - 40 : 120,
                child: Center(
                  child: isOpened
                      ? SizedBox(
                          height: 250,
                          child: Intrinsic(
                              children: ['h', 'i'].generate((format, i) {
                            final items = notifier.generateDate(format);

                            return Container(
                              decoration: BoxDecoration(
                                  border: Br.only(['l'], except: i == 0)),
                              child: CupertinoPickerWidget(notifier,
                                  format: format,
                                  items: items,
                                  magnification: 1.9,
                                  itemExtent: 35,
                                  squeeze: .9,
                                  diameterRatio: .9,
                                  style: style,
                                  letterSpacing: 1.5),
                            );
                          })),
                        )
                      : Textr(
                          time,
                          style: config.font.copyWith(letterSpacing: 2),
                          icon: Ti.clock,
                        ),
                ),
              ));
        }));
  }
}

/// Represents a widget for displaying and potentially selecting start and end dates.
///
/// This widget might be used within a date picker UI where users need to specify
/// a date range (start and end dates). The `format` property allows customization
/// of how the dates are displayed.
class StartEndDate extends StatelessWidget {
  /// The `DatePickerNotifier` instance used for interaction with picker state.
  final DateRangePickerNotifier notifier;

  /// Optional styling options for the start and end date display (default: unspecified).
  final PickerStyle? style;

  /// Optional format string for displaying the dates (e.g., "yyyy-MM-dd").
  final String? format;

  /// Creates a new `StartEndDate` instance.
  ///
  /// [notifier] is required, [style] and [format] are optional.
  const StartEndDate(this.notifier, {super.key, this.style, this.format});

  @override
  Widget build(BuildContext context) {
    return Poslign(
        alignment: Alignment.bottomCenter,
        margin: Ei.only(b: 60),
        child: Container(
          padding: Ei.all(5),
          margin: Ei.sym(h: 25, v: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: (context.isDarkMode
                    ? darkAppbarColor
                    : scaffoldBackgroundColor),
                spreadRadius: 25,
                blurRadius: 35,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: notifier.watch(
            (state) {
              String start = state.initDate[0].format(format ?? 'yyyy-MM-dd');
              String end = state.initDate[1].format(format ?? 'yyyy-MM-dd');

              return Opacity(
                opacity: state.openTimePicker ? .2 : 1,
                child: IntrinsicHeight(
                  child: Row(
                      children: [start, '-', end].generate((text, i) {
                    int ii = i == 0 ? 0 : 1;

                    bool isFirstDate = state.dateIndex == 0;
                    bool isTo = i == 1;

                    IconData arrow = isFirstDate ? Ti.arrowLeft : Ti.arrowRight;
                    Color textColor = state.dateIndex == ii
                        ? Colors.orange
                        : Colors.black54.themeify;

                    return Expanded(
                      flex: isTo ? 0 : 1,
                      child: Touch(
                        onTap: isTo ? null : () => state.onSelectDate(ii),
                        padding: Ei.sym(v: 7, h: 15),
                        radius: Br.radius(4),
                        child: Center(
                            child: isTo
                                ? Icon(arrow, color: Colors.black38.themeify)
                                : Text(text,
                                    style: config.font
                                        .fcolor(textColor)
                                        .fbold(state.dateIndex == ii))),
                      ),
                    );
                  })),
                ),
              );
            },
          ),
        ));
  }
}
