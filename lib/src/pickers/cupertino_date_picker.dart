import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';
import '../extensions/context_extension.dart';
import '../pickers/constant.dart';
import '../utils/utils.dart';
import '../widgets/transition.dart';
import '../shortcut.dart';
import '../utils/constant.dart';
import '../widgets/widgets.dart';

enum DatePickerType { all, monthYear, year }

class CupertinoDatePickerWidget extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? confirmLabel;
  final bool useShortMonths;
  final DatePickerType? type;
  final AlignmentGeometry? alignment;
  const CupertinoDatePickerWidget(
      {super.key,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.confirmLabel,
      this.useShortMonths = false,
      this.type = DatePickerType.all,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    DateTime init = initialDate ?? DateTime.now();
    DateTime first = firstDate ?? DateTime.now();
    DateTime last = lastDate ?? DateTime(DateTime.now().year + 10, 12, 31);

    init = init.isAfter(last) ? last : init;
    init = init.isBefore(first) ? first : init;

    List<String> months = Const.months.map((e) => useShortMonths ? e.substring(0, 3) : e).toList();

    /* ------------------------------------------------------------
    | On Init
    ------------------------------------ */

    // default date selected
    PickerNotifier notifier = PickerNotifier({'month': months[init.month], 'year': init.year});
    Map<String, dynamic> selected = {'date': init.day, 'month': months[init.month - 1], 'year': init.year};

    int maxYear = last.year + 1;

    // iterations
    Map<String, List> iterations = {
      'date': List.generate(31, (index) => (index + 1).toString().padLeft(2, '0')),
      'month': List.generate(12, (index) => months[index]),
      'year': List.generate(maxYear - first.year, (index) => (index + first.year)),
    };

    /* ------------------------------------------------------------
    | Methods
    ------------------------------------ */
    Map dateProperties() {
      int date = int.parse(selected['date'].toString());
      int month = int.parse(months.indexOf(selected['month']).toString());
      int year = int.parse(selected['year'].toString());

      DateTime dateTime = DateTime(year, month + 1, date);
      int daysInMonth = DateTime(dateTime.year, month + 2, 0).day - 1;

      return {
        'selected': dateTime,
        'is_after': dateTime.isAfter(last),
        'is_before': dateTime.isBefore(first),
        'max_year': last.year,
        'max_month': last.month - 1,
        'max_day': last.day - 1,
        'min_year': first.year,
        'min_month': first.month - 1,
        'min_day': first.day - 1,
        'is_max_year': dateTime.year == last.year,
        'is_min_year': dateTime.year == first.year,
        'is_max_month': dateTime.month == last.month,
        'is_min_month': dateTime.month == first.month,
        'is_max_day': date > daysInMonth + 1,
        'days_in_month': daysInMonth,
        'is_min_day_r': year <= first.year && month < first.month && date < first.day,
        'is_min_month_r': year <= first.year && month < first.month - 1,
      };
    }

    void setDateMonthRange() {
      Map prop = dateProperties();

      // set month range
      notifier.monthRanges = prop['is_max_year']
          ? [0, prop['max_month']]
          : prop['is_min_year']
              ? [prop['min_month'], 11]
              : [0, 11];

      // set date range based on month
      notifier.dateRanges = [0, prop['days_in_month']];

      // set date range based on min date
      if (prop['is_min_year'] && prop['is_min_month']) {
        notifier.dateRanges = [prop['min_day'], prop['days_in_month']];
      }

      // set date range base on max date
      else if (prop['is_max_year'] && prop['is_max_month']) {
        notifier.dateRanges = [0, prop['max_day']];
      }
    }

    void setDateFocus() {
      Map prop = dateProperties();

      if (prop['is_max_year'] && prop['is_max_month'] && prop['is_after']) {
        notifier.scrollTo('date', prop['max_day']);
      } else if (prop['is_min_day_r']) {
        notifier.scrollTo('date', prop['min_day']);
      } else if (prop['is_max_day']) {
        notifier.scrollTo('date', prop['days_in_month']);
      }

      setDateMonthRange();
    }

    void setMonthFocus() {
      Map prop = dateProperties();

      if (prop['is_after']) {
        notifier.scrollTo('month', prop['max_month']);
      } else if (prop['is_min_month_r']) {
        notifier.scrollTo('month', prop['min_month']);
      }

      setDateFocus();
    }

    Map<String, Function> methods = {
      'date': () => setDateFocus(),
      'month': () => setMonthFocus(),
      'year': () => setMonthFocus(),
    };

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int duration = 1000;

      int d = iterations['date']!.indexOf(init.day.toString().padLeft(2, '0'));
      int m = iterations['month']!.indexOf(months[init.month - 1]);
      int y = iterations['year']!.indexOf(init.year);

      int dd = (d - 5) < 0 ? 0 : d - 5;
      int mm = (m - 5) < 0 ? 0 : m - 5;
      int yy = (y - 5) < 0 ? 0 : y - 5;

      notifier.jumpToItem('date', dd);
      notifier.jumpToItem('month', mm);
      notifier.jumpToItem('year', yy);
      setDateMonthRange();

      await Future.delayed(const Duration(milliseconds: 100), () {
        notifier.scrollTo('date', d, duration: duration);
        notifier.scrollTo('month', m, duration: duration);
        notifier.scrollTo('year', y, duration: duration);
      });

      await Future.delayed(const Duration(milliseconds: 1000), () {
        notifier.hasInit = true;
      });
    });

    Widget cupertinoPickerWidget(String widgetType) {
      List value = iterations[widgetType]!;

      return ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, _, __) => CupertinioPickerWidget(
                controller: notifier.map[widgetType]!,
                notifier: notifier,
                type: widgetType,
                alignment: alignment,
                onChange: (int i) async {
                  if (!notifier.hasInit) return;
                  selected[widgetType] = value[i]; // update selected value

                  // listen to month & year changes
                  if (['month', 'year'].contains(widgetType)) {
                    notifier.toggle({});
                    setDateMonthRange();
                  }

                  methods[widgetType]!();
                },
                items: value.map((e) => e.toString()).toList(),
              ));
    }

    double radius = LazyUi.getConfig.radius;

    return ScrollConfiguration(
      behavior: NoScrollGlow(),
      child: Container(
        decoration: BoxDecoration(color: Utils.hex('f1f1f1'), borderRadius: Br.radius(radius, except: ['bl', 'br'])),
        height: context.height * 0.4,
        child: Stack(
          children: [
            FutureBuilder(
              future: Future.delayed(const Duration(milliseconds: 0)),
              builder: (context, snapshot) {
                List<String> types = ['date', 'month', 'year'];

                if (type == DatePickerType.monthYear) {
                  types = ['month', 'year'];
                } else if (type == DatePickerType.year) {
                  types = ['year'];
                }

                return Center(
                  child: SizedBox(
                    height: context.height * 0.4,
                    child: Intrinsic(
                      children: List.generate(types.length, (t) {
                        String value = types[t];

                        return Expanded(
                            child: Container(decoration: BoxDecoration(border: Br.only(['l'], except: t == 0)), child: cupertinoPickerWidget(value)));
                      }),
                    ),
                  ),
                );
              },
            ),

            /* ------------------------------------------------------------
            | Confirm Button
            | */

            Positioned.fill(
                child: Align(
              alignment: Alignment.bottomCenter,
              child: SlideUp(
                delay: 300,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Utils.hex('f1f1f1'),
                        spreadRadius: 15,
                        blurRadius: 25,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: InkW(
                      onTap: () {
                        DateTime date = dateProperties()['selected'];
                        Navigator.pop(context, date);
                      },
                      padding: Ei.sym(v: 10, h: 45),
                      margin: Ei.only(b: 20),
                      radius: Br.radius(25),
                      color: Utils.hex('fff'),
                      child: Text(
                        confirmLabel ?? 'Confirm',
                        textAlign: Ta.center,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: Fw.bold),
                      )),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class CupertinioPickerWidget extends StatelessWidget {
  final FixedExtentScrollController controller;
  final void Function(int)? onChange;
  final List<String> items;
  final PickerNotifier notifier;
  final String type;
  final AlignmentGeometry? alignment;
  const CupertinioPickerWidget(
      {super.key, required this.controller, this.onChange, this.items = const [], required this.notifier, this.type = 'date', this.alignment});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
        magnification: 1,
        useMagnifier: true,
        itemExtent: 40,
        diameterRatio: .5,
        squeeze: 0.8,
        scrollController: controller,
        selectionOverlay: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(color: Colors.white.withOpacity(.4), border: Br.only([''])),
        ),
        onSelectedItemChanged: onChange,
        children: List<Widget>.generate(items.length, (int index) {
          return ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, value, child) {
                value as Map;

                Map styles = {
                  'date': notifier.dateRanges,
                  'month': notifier.monthRanges,
                };

                return Align(
                  alignment: alignment ?? Alignment.center,
                  child: Padding(
                    padding: Ei.sym(h: 15),
                    child: ZoomIn(
                      child: Text(
                        items[index],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: styles[type] == null
                                ? Colors.black87
                                : index >= styles[type][0] && index <= styles[type][1]
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
