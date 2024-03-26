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

    bool isDarkMode = style?.darkMode ?? false;
    Color backgroundColor = isDarkMode ? '222'.hex : 'f1f1f1'.hex;

    return ScrollConfiguration(
      behavior: Unglow(),
      child: Container(
        decoration: BoxDecoration(color: backgroundColor.lighten(.95)),
        child: Stack(
          children: [
            SizedBox(
              height: height,
              child: Intrinsic(
                children: formats.generate((f, i) {
                  final items = notifier.generateDate(f);
                  return Expanded(
                    child: Container(
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
                              .lighten(isDarkMode ? .8 : .1)
                              .withOpacity(.4),
                        )),
                  );
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
}

class CupertinoPickerWidget extends StatelessWidget {
  final DatePickerNotifier notifier;
  final String type;
  final List<String> items;
  final double? magnification, itemExtent, diameterRatio, squeeze;
  final DatePickerStyle? style;
  final double? letterSpacing;
  final Color? backgroundColor;
  final Color? overlayColor;

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

    bool isDarkMode = style?.darkMode ?? false;
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

class ConfirmButton extends StatelessWidget {
  final DatePickerNotifier notifier;
  final DatePickerStyle? style;
  const ConfirmButton(this.notifier, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = style?.darkMode ?? false;
    Color backgroundColor = isDarkMode ? '222'.hex : 'f1f1f1'.hex;
    Color textColor = style?.textColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);
    Color buttonColor = style?.buttonColor ?? Colors.white;
    Color confirmTextColor = style?.confirmTextColor ??
        (buttonColor.isDark() ? Colors.white : Colors.black87);

    return Poslign(
        alignment: Alignment.bottomCenter,
        margin: Ei.only(b: 15),
        child: Row(
          children: 3.generate((i) {
            return SlideUp(
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
                              color: backgroundColor.lighten(.95),
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

class TimePicker extends StatelessWidget {
  final DatePickerNotifier notifier;
  final DatePickerStyle? style;
  const TimePicker(this.notifier, {super.key, this.style});

  @override
  Widget build(BuildContext context) {
    double radius = style?.radius ?? LazyUi.radius;
    bool isDarkMode = style?.darkMode ?? false;
    Color backgroundColor = isDarkMode ? '222'.hex : 'fff'.hex;
    Color textColor = style?.textColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);

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
                                          ? backgroundColor.lighten(.92)
                                          : backgroundColor.darken(.1))
                                      .withOpacity(.4),
                                ),
                              );
                            })),
                          )
                        : Textr(
                            time,
                            style: Gfont.muted
                                .copyWith(letterSpacing: 2, color: textColor),
                            icon: Ti.clock,
                          ),
                  ),
                );
              },
            )));
  }
}
