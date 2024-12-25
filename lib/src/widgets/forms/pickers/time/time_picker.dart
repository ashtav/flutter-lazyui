import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/theme/color.dart';

import '../date/date_picker.dart';
import 'notifier.dart';
import 'time.dart';

/// A time picker widget for selecting a time within a specified range.
class TimePickerWidget extends StatelessWidget {
  /// The initial time value displayed when the picker is first shown.
  final Time? initTime;

  /// The minimum selectable time.
  final Time? minTime;

  /// The maximum selectable time.
  final Time? maxTime;

  /// The style configuration for the time picker.
  final PickerStyle? style;

  /// Constructs a [TimePickerWidget] widget.
  const TimePickerWidget({
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
    notifier.onInitialized(formats, initTime: initTime, minTime: minTime, maxTime: maxTime);

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
                      decoration: BoxDecoration(border: Br.only(['l'], except: i == 0)),
                      child: CupertinoPickerWidget(notifier, format: format, items: items, style: style));
                }),
              ),
            ),

            // confirm button
            ConfirmButton(
                style: style, onConfirm: () => context.lz.pop(notifier.value), onCancel: () => context.lz.pop()),
          ],
        ),
      ).lz.clip(tlr: config.borderRadius),
    );
  }
}

/// A widget representing a single column in the date picker using the Cupertino style.
class CupertinoPickerWidget extends StatelessWidget {
  /// Reference to the `TimePickerNotifier` object providing data and state updates.
  final TimePickerNotifier notifier;

  /// Identifier for the date format part (e.g., 'd', 'm', 'y').
  final String format;

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
  final PickerStyle? style;

  /// Optional letter spacing for the picker items.
  final double? letterSpacing;

  /// Optional background color for the picker column.
  final Color? backgroundColor;

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
      this.letterSpacing,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return notifier.watch((state) => CupertinoPicker(
        magnification: 1.9,
        useMagnifier: true,
        itemExtent: 35,
        diameterRatio: .9,
        squeeze: .9,
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
                style: config.font.copyWith(letterSpacing: 1.5),
                padding: Ei.sym(h: 15),
              ),
            ),
          );
        })));
  }
}
