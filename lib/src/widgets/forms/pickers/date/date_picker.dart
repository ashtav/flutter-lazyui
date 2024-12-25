import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/theme/color.dart';

import 'notifier.dart';
import '../time/time.dart';

/// A date picker widget for selecting dates.
class DatePickerWidget extends StatelessWidget {
  /// The initial date selected on the date picker.
  final DateTime? initDate;

  /// The minimum selectable date on the date picker.
  final DateTime? minDate;

  /// The maximum selectable date on the date picker.
  final DateTime? maxDate;

  /// The format of the selected date.
  final String? format;

  /// The style configuration for the date picker.
  final PickerStyle? style;

  /// Determines if the date picker includes time selection.
  final bool withTime;

  /// Constructs a [DatePickerWidget] widget with optional parameters.
  const DatePickerWidget(
      {super.key, this.initDate, this.minDate, this.maxDate, this.style, this.format, this.withTime = false});

  @override
  Widget build(BuildContext context) {
    List<String> formats = (format ?? 'd/m/y').split('/');

    final notifier = DatePickerNotifier();
    notifier.onInitialized(formats, initDate: initDate, minDate: minDate, maxDate: maxDate);

    double height = context.height * .5;

    if (context.height < 800) {
      height = context.height * .7;
    }

    return ScrollGlowless(
      child: Container(
        decoration: BoxDecoration(color: context.isDarkMode ? darkAppbarColor : scaffoldBackgroundColor),
        child: Stack(
          children: [
            SizedBox(
              height: height,
              child: Intrinsic(
                children: formats.generate((format, i) {
                  final items = notifier.generateDate(format);
                  return Container(
                      decoration: BoxDecoration(border: Br.only(['l'], except: i == 0, color: Colors.black12.themeify)),
                      child: CupertinoPickerWidget(
                        notifier,
                        format: format,
                        items: items,
                        style: style,
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
      ).lz.clip(tlr: config.borderRadius),
    );
  }

  /// Creates a customizable date picker widget with optional configuration.
  static Widget widget(
      {DateTime? initDate,
      DateTime? minDate,
      DateTime? maxDate,
      String? format,
      double height = 300,
      PickerStyle? style,
      Function(DateTime value)? onChange}) {
    List<String> formats = (format ?? 'd/m/y').split('/');

    final notifier = DatePickerNotifier();
    notifier.onInitialized(formats, initDate: initDate, minDate: minDate, maxDate: maxDate);
    notifier.onChangeForWidget = onChange;

    return ScrollGlowless(
      child: SizedBox(
        height: height,
        child: Intrinsic(
          children: formats.generate((format, i) {
            final items = notifier.generateDate(format);
            return Container(
                decoration: BoxDecoration(border: Br.only(['l'], except: i == 0, color: Colors.black12.themeify)),
                child: CupertinoPickerWidget(notifier, format: format, items: items, style: style));
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

  /// The format of picker (e.g., "hour", "minute") used to identify the list
  /// of items and potentially apply styling based on the format.
  final String format;

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
  final PickerStyle? style;

  /// Optional letter spacing for the text displayed in the picker items.
  /// A positive value will increase the space between letters.
  final double? letterSpacing;

  /// Creates a new instance of `CupertinoPickerWidget`.
  const CupertinoPickerWidget(this.notifier,
      {super.key,
      required this.format,
      this.items = const [],
      this.magnification,
      this.itemExtent,
      this.diameterRatio,
      this.squeeze,
      this.style,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    int length = notifier.controller.keys.length;
    bool isYearOnly = notifier.controller.keys.toList().contains('y') && length == 1;

    double magnification = this.magnification ?? (isYearOnly ? 1.5 : 1);
    double itemExtent = this.itemExtent ?? (isYearOnly ? 45 : 40);
    double squeeze = this.squeeze ?? (isYearOnly ? .5 : 0.8);
    double diameterRatio = this.diameterRatio ?? .5;

    String format = ['mm', 'mmm'].contains(this.format) ? 'm' : this.format;

    return notifier.watch((state) => CupertinoPicker(
        magnification: magnification,
        useMagnifier: true,
        itemExtent: itemExtent,
        diameterRatio: diameterRatio,
        squeeze: squeeze,
        scrollController: notifier.controller[format] ?? FixedExtentScrollController(initialItem: 0),
        selectionOverlay: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(color: Colors.black.applyOpacity(.03).themeify),
        ),
        onSelectedItemChanged: (int i) => notifier.onChange(i, format),
        children: items.generate((item, i) {
          return Align(
            alignment: Alignment.center,
            child: ZoomIn(
              child: Textr(
                item,
                style: config.font.copyWith(letterSpacing: letterSpacing, overflow: Tof.ellipsis),
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
  final PickerStyle? style;

  /// Creates a new instance of `ConfirmButton`.
  const ConfirmButton(this.notifier, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    Color buttonColor = style?.buttonColor ?? (context.isDarkMode ? darkBackgroundColor : backgroundColor);
    Color confirmTextColor = style?.confirmTextColor ?? (buttonColor.isDark ? Colors.white : Colors.black87);

    return Poslign(
        alignment: Alignment.bottomCenter,
        margin: Ei.only(b: 15),
        child: Row(
          spacing: 5,
          children: 3.generate((i) {
            return i != 1
                ? Touch(
                    type: TouchType.none,
                    onTap: i != 0
                        ? null
                        : () {
                            if (notifier.openTimePicker) {
                              notifier.values['h'] = notifier.time.hour;
                              notifier.values['i'] = notifier.time.minute;
                              notifier.toggleTimePicker();
                              return;
                            }

                            context.lz.pop();
                          },
                    child: Iconr(La.times,
                        padding: Ei.all(15), color: i != 0 ? Colors.transparent : Colors.black54.themeify),
                  )
                : Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: (context.isDarkMode ? darkAppbarColor : scaffoldBackgroundColor),
                          spreadRadius: 25,
                          blurRadius: 45,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Touch(
                      onTap: () {
                        if (notifier.openTimePicker) {
                          notifier.time = Time(notifier.values['h']!, notifier.values['i']!);
                          notifier.toggleTimePicker();
                          return;
                        }

                        context.lz.pop(notifier.value);
                      },
                      padding: Ei.sym(v: 12, h: 45),
                      border: Br.all(),
                      color: buttonColor,
                      borderRadius: Br.radius(50),
                      child: Text(style?.confirmText ?? 'Confirm',
                          style: config.font.copyWith(fontWeight: Fw.bold, color: confirmTextColor)),
                    ),
                  );
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
  final PickerStyle? style;

  /// Creates a new instance of `TimePicker`.
  const TimePicker(this.notifier, {super.key, this.style});
  @override
  Widget build(BuildContext context) {
    return Poslign(
        alignment: Alignment.topRight,
        margin: Ei.only(t: 20, r: 20),
        child: notifier.watch((state) {
          String time = state.value.format('HH:mm');
          bool isOpened = state.openTimePicker;

          return Touch(
              onTap: isOpened
                  ? null
                  : () {
                      state.toggleTimePicker();
                    },
              color: context.isDarkMode ? darkBackgroundColor : backgroundColor,
              border: Br.all(),
              borderRadius: Br.radius(config.borderRadius),
              child: AnimatedContainer(
                duration: 350.ms,
                curve: isOpened ? Curves.easeInOutBack : Curves.fastEaseInToSlowEaseOut,
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
                              decoration: BoxDecoration(border: Br.only(['l'], except: i == 0)),
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
                          icon: Hi.clock01,
                        ),
                ),
              ));
        }));
  }
}
