import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/src/constants/enum.dart';
import 'package:lazyui/src/utils/utils.dart';
import 'package:lazyui/src/widgets/widget.dart';

import 'notifier.dart';

class CupertinoDateTimePickerWidget extends StatelessWidget {
  final FixedExtentScrollController controller;
  final void Function(int)? onChange;
  final List<String> items;
  final DateTimePickerNotifier notifier;
  final String widgetType;
  final AlignmentGeometry? alignment;
  final DatePickerType type;

  const CupertinoDateTimePickerWidget(
      {super.key,
      required this.controller,
      this.onChange,
      this.items = const [],
      required this.notifier,
      this.widgetType = 'date',
      this.alignment,
      this.type = DatePickerType.dateTime});

  @override
  Widget build(BuildContext context) {
    bool isYearOnly = type == DatePickerType.year;
    bool style2 = isYearOnly || widgetType == 'time';

    return CupertinoPicker(
        magnification: style2 ? 1.5 : 1,
        useMagnifier: true,
        itemExtent: style2 ? 45 : 40,
        diameterRatio: .5,
        squeeze: style2 ? .5 : 0.8,
        scrollController: controller,
        selectionOverlay: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.4), border: Br.only([''])),
        ),
        onSelectedItemChanged: onChange,
        children: List<Widget>.generate(items.length, (int index) {
          return ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, value, child) {
                Map styles = {
                  'date': notifier.dateRanges,
                  'month': notifier.monthRanges,
                  'hour': notifier.hourRanges,
                  'minute': notifier.minuteRanges,
                };

                return Align(
                  alignment: alignment ?? Alignment.center,
                  child: Padding(
                    padding: Ei.sym(h: 15),
                    child: ZoomIn(
                      child: Text(
                        items[index],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: style2 ? 35 : 16.5,
                            color: styles[type] == null
                                ? Colors.black87
                                : index >= styles[type][0] &&
                                        index <= styles[type][1]
                                    ? Colors.black87
                                    : Colors.black26),
                      ),
                    ),
                  ),
                );
              });
        }));
  }
}
