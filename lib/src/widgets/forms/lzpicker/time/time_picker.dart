import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'notifier.dart';

/// A time picker widget for selecting a time within a specified range.
class LzTimePicker extends StatelessWidget {
  /// The initial time value displayed when the picker is first shown.
  final Time? initTime;

  /// The minimum selectable time.
  final Time? minTime;

  /// The maximum selectable time.
  final Time? maxTime;

  /// The style configuration for the time picker.
  final TimePickerStyle? style;

  /// Constructs a [LzTimePicker] widget.
  const LzTimePicker({
    super.key,
    this.initTime,
    this.minTime,
    this.maxTime,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    List<String> formats = ['h', 'i'];

    final notifier = TimePickerNotifier();
    notifier.onInitialized(formats,
        initTime: initTime, minTime: minTime, maxTime: maxTime);

    double radius = style?.radius ?? LazyUi.radius;
    double height = context.height * (context.width > 395 ? .6 : .45);

    bool isDarkMode = style?.darkMode ?? lzDarkMode;
    Color backgroundColor = isDarkMode ? '333'.hex : 'f1f1f1'.hex;

    return ScrollConfiguration(
      behavior: Unglow(),
      child: Container(
        decoration: BoxDecoration(color: backgroundColor),
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
                            .lighten(isDarkMode ? .8 : .1)
                            .withValues(alpha: .4),
                      ));
                }),
              ),
            ),

            // confirm button
            ConfirmButton(notifier, style: style),
          ],
        ),
      ).lz.clip(tlr: radius),
    );
  }
}

/// A widget representing a single column in the date picker using the Cupertino style.

class CupertinoPickerWidget extends StatelessWidget {
  /// Reference to the `TimePickerNotifier` object providing data and state updates.
  final TimePickerNotifier notifier;

  /// Identifier for the date format part (e.g., 'd', 'm', 'y').
  final String type;

  /// List of items displayed in the picker column (e.g., days, months, years).
  final List<String> items;

  /// Optional magnification factor for the picker items.
  final double? magnification;

  /// Optional fixed extent for each picker item.
  final double? itemExtent;

  /// Optional diameter ratio for the picker.
  final double? diameterRatio;

  /// Optional squeeze factor for the picker items.
  final double? squeeze;

  /// Optional styling for the picker.
  final TimePickerStyle? style;

  /// Optional letter spacing for the picker items.
  final double? letterSpacing;

  /// Optional background color for the picker column.
  final Color? backgroundColor;

  /// Optional overlay color for the picker.
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
    bool isDarkMode = style?.darkMode ?? lzDarkMode;
    Color backgroundColor =
        this.backgroundColor ?? (isDarkMode ? '333'.hex : 'f1f1f1'.hex);
    Color textColor = style?.textColor ??
        (backgroundColor.isDark() ? Colors.white : Colors.black87);

    return notifier.watch((state) => CupertinoPicker(
        magnification: 1.9,
        useMagnifier: true,
        itemExtent: 35,
        diameterRatio: .9,
        squeeze: .9,
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
                style:
                    LazyUi.font.copyWith(color: textColor, letterSpacing: 1.5),
                padding: Ei.sym(h: 15),
              ),
            ),
          );
        })));
  }
}

/// A customizable confirm button for use with time pickers.
class ConfirmButton extends StatelessWidget {
  /// The `TimePickerNotifier` object providing data and state updates.
  /// The button's behavior is likely tied to actions within the notifier.
  final TimePickerNotifier notifier;

  /// Optional style customizations for the confirm button.
  /// These might influence appearance (colors, font, etc.) based on the
  /// chosen button widget implementation.
  final TimePickerStyle? style;

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
                          context.lz.pop();
                        })
                        .lz
                        .disabled(i == 0, 0)
                    : Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: backgroundColor,
                              spreadRadius: 25,
                              blurRadius: 35,
                              offset: const Offset(0, -5),
                            ),
                          ],
                        ),
                        child: InkTouch(
                          onTap: () {
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
