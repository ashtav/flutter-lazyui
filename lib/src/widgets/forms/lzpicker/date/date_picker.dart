import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';

/// A date picker widget for selecting dates.
class LzDatePicker extends StatelessWidget {
  /// The initial date selected on the date picker.
  final DateTime? initDate;

  /// The minimum selectable date on the date picker.
  final DateTime? minDate;

  /// The maximum selectable date on the date picker.
  final DateTime? maxDate;

  /// The style configuration for the date picker.
  final DatePickerStyle? style;

  /// The format of the selected date.
  final String? format;

  /// Determines if the date picker includes time selection.
  final bool withTime;

  /// Constructs a [LzDatePicker] widget with optional parameters.
  const LzDatePicker(
      {super.key,
      this.initDate,
      this.minDate,
      this.maxDate,
      this.style,
      this.format,
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

    return ScrollGlowless(
      child: Container(
        decoration: BoxDecoration(color: backgroundColor.lighten(.05)),
        child: Stack(
          children: [
            SizedBox(
              height: height,
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

            // confirm button
            ConfirmButton(notifier, style: style),

            // time picker
            if (withTime) TimePicker(notifier, style: style)
          ],
        ),
      ).lz.clip(tlr: radius),
    );
  }

  /// Creates a customizable date picker widget with optional configuration.
  static Widget widget(
      {DateTime? initDate,
      DateTime? minDate,
      DateTime? maxDate,
      String? format,
      double height = 300,
      DatePickerStyle? style,
      Function(DateTime value)? onChange}) {
    List<String> formats = (format ?? 'd/m/y').split('/');

    final notifier = DatePickerNotifier();
    notifier.onInitialized(formats,
        initDate: initDate, minDate: minDate, maxDate: maxDate);
    notifier.onChangeForWidget = onChange;

    bool isDarkMode = style?.darkMode ?? lzDarkMode;
    Color backgroundColor = isDarkMode ? '333'.hex : 'f1f1f1'.hex;

    return ScrollGlowless(
      child: SizedBox(
        height: height,
        child: Intrinsic(
          children: formats.generate((f, i) {
            final items = notifier.generateDate(f);
            return Container(
                decoration: BoxDecoration(
                    border: Br.only(['l'],
                        except: i == 0, color: backgroundColor.darken(.2))),
                child: CupertinoPickerWidget(
                  notifier,
                  type: f,
                  items: items,
                  style: style,
                  overlayColor: backgroundColor.withValues(alpha: .4),
                ));
          }),
        ),
      ),
    );
  }
}

/// A customizable Cupertino-style picker widget.

class CupertinoPickerWidget extends StatelessWidget {
  /// The `DatePickerNotifier` object providing data and state updates.
  final DatePickerNotifier notifier;

  /// The type of picker (e.g., "hour", "minute") used to identify the list
  /// of items and potentially apply styling based on the type.
  final String type;

  /// The list of items to be displayed in the picker. This list is expected
  /// to be populated by the `DatePickerNotifier`.
  final List<String> items;

  /// Optional magnification factor for the text displayed in the picker items.
  /// A value greater than 1.0 will magnify the text.
  final double? magnification;

  /// Optional height of each picker item. This can be used to customize the
  /// spacing between items in the picker.
  final double? itemExtent;

  /// Optional diameter ratio for the picker wheel. This value affects the
  /// visual appearance of the picker, typically used by the chosen date picker
  /// library.
  final double? diameterRatio;

  /// Optional squeeze factor for item spacing. This can be used to adjust the
  /// visual density of items within the picker.
  final double? squeeze;

  /// Optional style customizations for the picker. The specific effects of
  /// style depend on the chosen date picker library.
  final DatePickerStyle? style;

  /// Optional letter spacing for the text displayed in the picker items.
  /// A positive value will increase the space between letters.
  final double? letterSpacing;

  /// Optional background color for the picker widget.
  final Color? backgroundColor;

  /// Optional overlay color for the picker widget. This might be used for
  /// visual effects like highlighting the selected item.
  final Color? overlayColor;

  /// Creates a new instance of `CupertinoPickerWidget`.
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
    double squeeze = this.squeeze ?? (isYearOnly ? .5 : 0.8);
    double diameterRatio = this.diameterRatio ?? .5;

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
                style: LazyUi.font.copyWith(
                    color: textColor,
                    letterSpacing: letterSpacing,
                    overflow: Tof.ellipsis),
                padding: Ei.sym(h: 15),
              ),
            ),
          );
        })));
  }
}

/// A customizable confirm button for use with date pickers.

class ConfirmButton extends StatelessWidget {
  /// The `DatePickerNotifier` object providing data and state updates.
  /// The button's behavior is likely tied to actions within the notifier.
  final DatePickerNotifier notifier;

  /// Optional style customizations for the confirm button.
  /// These might influence appearance (colors, font, etc.) based on the
  /// chosen button widget implementation.
  final DatePickerStyle? style;

  /// Creates a new instance of `ConfirmButton`.
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

                            context.lz.pop(notifier.value);
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

/// A customizable time picker widget for use with date pickers.

class TimePicker extends StatelessWidget {
  /// The `DatePickerNotifier` object providing data and state updates.
  /// The time picker likely interacts with the notifier to update the selected time.
  final DatePickerNotifier notifier;

  /// Optional style customizations for the time picker.
  /// These might influence appearance (colors, font, etc.) based on the
  /// chosen time picker library implementation.
  final DatePickerStyle? style;

  /// Creates a new instance of `TimePicker`.
  const TimePicker(this.notifier, {super.key, this.style});
  @override
  Widget build(BuildContext context) {
    double radius = style?.radius ?? LazyUi.radius;
    bool isDarkMode = style?.darkMode ?? lzDarkMode;
    Color backgroundColor = isDarkMode ? '222'.hex : 'fff'.hex;
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
                                          ? backgroundColor.lighten(.02)
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
