import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';

/// A date picker widget for selecting dates.
class LzDateRangePicker extends StatelessWidget {
  /// The initial date selected on the date picker.
  final List<DateTime>? initDate;

  /// The minimum selectable date on the date picker.
  final DateTime? minDate;

  /// The maximum selectable date on the date picker.
  final DateTime? maxDate;

  /// The style configuration for the date picker.
  final DatePickerStyle? style;

  /// The format of the selected date.
  final String? format;

  /// Determines if the date picker includes time selection.
  final String? rangeFormat;

  /// Determines if the date picker includes time selection.
  final bool withTime;

  /// Constructs a [LzDateRangePicker] widget with optional parameters.
  const LzDateRangePicker(
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

    final notifier = DatePickerNotifier();
    notifier.onInitialized(formats,
        initDate: initDate, minDate: minDate, maxDate: maxDate);

    double radius = style?.radius ?? LazyUi.radius;
    double height = context.height * (context.width > 395 ? .6 : .45);

    bool isDarkMode = style?.darkMode ?? lzDarkMode;
    Color backgroundColor = isDarkMode ? '333'.hex : 'f1f1f1'.hex;

    return ScrollConfiguration(
      behavior: Unglow(),
      child: Container(
        decoration: BoxDecoration(color: backgroundColor.lighten(.05)),
        child: Stack(
          children: [
            Container(
              padding: Ei.only(b: 70),
              child: SizedBox(
                height: height - 70,
                child: Intrinsic(
                  children: formats.generate((f, i) {
                    final items = notifier.generateDate(f);
                    return Container(
                        decoration: BoxDecoration(
                            border: Br.only(['l'],
                                except: i == 0,
                                color: backgroundColor.darken(.2))),
                        child: CupertinoPickerWidget(
                          notifier,
                          type: f,
                          items: items,
                          style: style,
                          overlayColor: backgroundColor
                              .lighten(isDarkMode ? .2 : .9)
                              .withValues(alpha: .4),
                        ));
                  }),
                ),
              ),
            ),

            // start date & end date
            StartEndDate(notifier, style: style, format: rangeFormat),

            // confirm button
            ConfirmButton(notifier, style: style),

            // time picker
            if (withTime) TimePicker(notifier, style: style)
          ],
        ),
      ).lz.clip(tlr: radius),
    );
  }
}

/// Represents a widget for displaying a Cupertino-style picker.
///
/// This widget is likely used within a date picker UI to select specific
/// values (e.g., year, month, day) using a picker wheel.
class CupertinoPickerWidget extends StatelessWidget {
  /// The `DatePickerNotifier` instance used for managing picker state and updates.
  final DatePickerNotifier notifier;

  /// The type of value being selected (e.g., "year", "month", "day").
  final String type;

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
  final DatePickerStyle? style;

  /// Optional letter spacing for the picker text (default: unspecified).
  final double? letterSpacing;

  /// Optional background color for the picker (default: unspecified).
  final Color? backgroundColor;

  /// Optional overlay color for the picker (default: unspecified).
  final Color? overlayColor;

  /// Creates a new `CupertinoPickerWidget` instance.
  ///
  /// [notifier] and [type] are required parameters.
  /// All other parameters are optional.
  const CupertinoPickerWidget(this.notifier,
      {super.key,
      required this.type,
      this.items = const [],
      this.magnification,
      this.itemExtent,
      this.diameterRatio,
      this.squeeze,
      this.style,
      this.letterSpacing,
      this.backgroundColor,
      this.overlayColor});

  @override
  Widget build(BuildContext context) {
    int length = notifier.controller.keys.length;
    bool isYearOnly =
        notifier.controller.keys.toList().contains('y') && length == 1;

    double magnification = this.magnification ?? (isYearOnly ? 1.5 : 1);
    double itemExtent = this.itemExtent ?? (isYearOnly ? 45 : 40);
    double squeeze = this.squeeze ?? (isYearOnly ? .5 : 0.9);
    double diameterRatio = this.diameterRatio ?? .6;

    String type = ['mm', 'mmm'].contains(this.type) ? 'm' : this.type;

    bool isDarkMode = style?.darkMode ?? lzDarkMode;
    Color backgroundColor =
        this.backgroundColor ?? (isDarkMode ? '333'.hex : 'f1f1f1'.hex);
    Color textColor = style?.textColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);

    return notifier.watch((state) => CupertinoPicker(
        magnification: magnification,
        useMagnifier: true,
        itemExtent: itemExtent,
        diameterRatio: diameterRatio,
        squeeze: squeeze,
        scrollController: notifier.controller[type] ??
            FixedExtentScrollController(initialItem: 0),
        selectionOverlay: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(color: overlayColor),
        ),
        onSelectedItemChanged: (int i) => notifier.onChange(i, type),
        children: items.generate((item, i) {
          return Align(
            alignment: Alignment.center,
            child: ZoomIn(
              child: Textr(
                item,
                style: LazyUi.font
                    .copyWith(color: textColor, letterSpacing: letterSpacing),
                padding: Ei.sym(h: 15),
              ),
            ),
          );
        })));
  }
}

/// Represents a confirmation button likely used within a date picker UI.
///
/// This button might be used to finalize a selected date or trigger an action
/// based on the picker's state.
class ConfirmButton extends StatelessWidget {
  /// The `DatePickerNotifier` instance used for interaction with picker state.
  final DatePickerNotifier notifier;

  /// Optional styling options for the button (default: unspecified).
  final DatePickerStyle? style;

  /// Creates a new `ConfirmButton` instance.
  ///
  /// [notifier] is required, [style] is optional.
  const ConfirmButton(this.notifier, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = style?.darkMode ?? lzDarkMode;
    Color backgroundColor = isDarkMode ? '333'.hex : 'f1f1f1'.hex;
    Color textColor = style?.textColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);
    Color buttonColor =
        style?.buttonColor ?? (lzDarkMode ? '222'.hex : Colors.white);
    Color confirmTextColor = style?.confirmTextColor ??
        (buttonColor.isDark() ? Colors.white : Colors.black87);

    return Poslign(
        alignment: Alignment.bottomCenter,
        margin: Ei.only(b: 15),
        child: Row(
          children: 3.generate((i) {
            return SlideAnimate(
                delay: (i + 1) * 100,
                child: i != 1
                    ? Iconr(La.times, padding: Ei.all(15), color: textColor)
                        .onTap(() {
                          if (notifier.openTimePicker) {
                            notifier.values['h'] = notifier.time.hour;
                            notifier.values['i'] = notifier.time.minute;
                            notifier.toggleTimePicker();
                            return;
                          }

                          context.lz.pop();
                        })
                        .lz
                        .disabled(i == 0, 0)
                    : Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: backgroundColor.lighten(.05),
                              spreadRadius: 25,
                              blurRadius: 35,
                              offset: const Offset(0, -5),
                            ),
                          ],
                        ),
                        child: InkTouch(
                          onTap: () {
                            if (notifier.openTimePicker) {
                              notifier.time = Time(
                                  notifier.values['h']!, notifier.values['i']!);
                              notifier.toggleTimePicker();
                              return;
                            }

                            context.lz.pop(notifier.initDate);
                          },
                          padding: Ei.sym(v: 12, h: 45),
                          margin: Ei.sym(h: 5),
                          border: Br.all(),
                          color: buttonColor,
                          radius: Br.radius(50),
                          child: Text(style?.confirmText ?? 'Confirm',
                              style: LazyUi.font.copyWith(
                                  fontWeight: Fw.bold,
                                  color: confirmTextColor)),
                        ),
                      ));
          }),
        ).center);
  }
}

/// Represents a time picker widget likely used within a date picker UI.
///
/// This widget allows users to select a specific time, potentially in
/// conjunction with a date picker for a complete datetime selection.
class TimePicker extends StatelessWidget {
  /// The `DatePickerNotifier` instance used for interaction with picker state.
  final DatePickerNotifier notifier;

  /// Optional styling options for the time picker (default: unspecified).
  final DatePickerStyle? style;

  /// Creates a new `TimePicker` instance.
  ///
  /// [notifier] is required, [style] is optional.
  const TimePicker(this.notifier, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    double radius = style?.radius ?? LazyUi.radius;
    bool isDarkMode = style?.darkMode ?? lzDarkMode;
    Color backgroundColor = isDarkMode ? '333'.hex : 'fff'.hex;
    Color textColor = style?.textColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);
    final font = Gfont.style(context);

    return Poslign(
        alignment: Alignment.topRight,
        margin: Ei.only(t: 20, r: 20),
        child: InkTouch(
            onTap: () {
              if (!notifier.openTimePicker) {
                notifier.toggleTimePicker();
              }
            },
            color: backgroundColor,
            border: Br.all(color: backgroundColor.darken(isDarkMode ? .4 : .3)),
            radius: Br.radius(radius),
            child: notifier.watch(
              (state) {
                String time = state.value.format('HH:mm');

                return AnimatedContainer(
                  duration: 350.ms,
                  curve: state.openTimePicker
                      ? Curves.easeInOutBack
                      : Curves.fastEaseInToSlowEaseOut,
                  height: state.openTimePicker ? 250 : 35,
                  width: state.openTimePicker ? context.width - 40 : 120,
                  child: Center(
                    child: state.openTimePicker
                        ? SizedBox(
                            height: 250,
                            child: Intrinsic(
                                children: ['h', 'i'].generate((f, i) {
                              final items = notifier.generateDate(f);

                              return Container(
                                decoration: BoxDecoration(
                                    border: Br.only(['l'],
                                        except: i == 0,
                                        color: backgroundColor
                                            .darken(isDarkMode ? .4 : .3))),
                                child: CupertinoPickerWidget(
                                  notifier,
                                  type: f,
                                  items: items,
                                  magnification: 1.9,
                                  itemExtent: 35,
                                  squeeze: .9,
                                  diameterRatio: .9,
                                  style: style,
                                  letterSpacing: 1.5,
                                  overlayColor: (isDarkMode
                                          ? backgroundColor.lighten(.08)
                                          : backgroundColor.darken(.1))
                                      .withValues(alpha: .4),
                                ),
                              );
                            })),
                          )
                        : Textr(
                            time,
                            style: font.muted
                                .copyWith(letterSpacing: 2, color: textColor),
                            icon: Ti.clock,
                          ),
                  ),
                );
              },
            )));
  }
}

/// Represents a widget for displaying and potentially selecting start and end dates.
///
/// This widget might be used within a date picker UI where users need to specify
/// a date range (start and end dates). The `format` property allows customization
/// of how the dates are displayed.
class StartEndDate extends StatelessWidget {
  /// The `DatePickerNotifier` instance used for interaction with picker state.
  final DatePickerNotifier notifier;

  /// Optional styling options for the start and end date display (default: unspecified).
  final DatePickerStyle? style;

  /// Optional format string for displaying the dates (e.g., "yyyy-MM-dd").
  final String? format;

  /// Creates a new `StartEndDate` instance.
  ///
  /// [notifier] is required, [style] and [format] are optional.
  const StartEndDate(this.notifier, {super.key, this.style, this.format});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = style?.darkMode ?? lzDarkMode;
    Color backgroundColor = isDarkMode ? '333'.hex : 'f1f1f1'.hex;
    final font = Gfont.style(context);

    return Poslign(
        alignment: Alignment.bottomCenter,
        margin: Ei.only(b: 60),
        child: Container(
          padding: Ei.all(5),
          margin: Ei.sym(h: 25, v: 10),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: backgroundColor.lighten(.05),
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

              return IntrinsicHeight(
                child: Row(
                    children: [start, '-', end].generate((text, i) {
                  int ii = i == 0 ? 0 : 1;

                  bool isFirstDate = state.dateIndex == 0;
                  bool isTo = i == 1;

                  IconData arrow = isFirstDate ? Ti.arrowLeft : Ti.arrowRight;
                  Color textColor = state.dateIndex == ii
                      ? Colors.orange
                      : isDarkMode
                          ? Colors.white
                          : Colors.black54;

                  return Expanded(
                    flex: isTo ? 0 : 1,
                    child: InkTouch(
                      onTap: isTo ? null : () => state.onSelectDate(ii),
                      padding: Ei.sym(v: 7, h: 15),
                      radius: Br.radius(4),
                      child: Center(
                          child: isTo
                              ? Icon(arrow,
                                  color: isDarkMode
                                      ? Colors.white
                                      : Colors.black38)
                              : Text(text,
                                  style: font
                                      .fcolor(textColor)
                                      .fbold(state.dateIndex == ii))),
                    ),
                  );
                })),
              );
            },
          ),
        ));
  }
}
