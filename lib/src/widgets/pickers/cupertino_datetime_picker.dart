part of pickers;

class CupertinoDateTimePickerWidget extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? title, confirmLabel;
  final bool useShortMonths;
  final DatePickerType type;
  final AlignmentGeometry? alignment;
  const CupertinoDateTimePickerWidget(
      {super.key,
      this.initialDate,
      this.firstDate,
      this.lastDate,
      this.title,
      this.confirmLabel,
      this.useShortMonths = false,
      this.type = DatePickerType.all,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    DateTime init = initialDate ?? DateTime.now();
    DateTime first = firstDate ?? DateTime.now();
    DateTime last = lastDate ?? DateTime(DateTime.now().year + 10, 12, 31);

    init = init.isAfter(last) ? last : init;
    init = init.isBefore(first) ? first : init;

    List<String> months = DummyData.months
        .map((e) => useShortMonths ? e.substring(0, 3) : e)
        .toList();

    /* ------------------------------------------------------------
    | On Init
    ------------------------------------ */

    // default date selected
    PickerNotifier notifier = PickerNotifier({
      'month': months[init.month - 1],
      'year': init.year,
      'hour': init.hour,
      'minute': init.minute
    });
    Map<String, dynamic> selected = {
      'date': init.day,
      'month': months[init.month - 1],
      'year': init.year,
      'hour': init.hour,
      'minute': init.minute
    };

    int maxYear = last.year + 1;

    // iterations
    Map<String, List> iterations = {
      'date':
          List.generate(31, (index) => (index + 1).toString().padLeft(2, '0')),
      'month': List.generate(12, (index) => months[index]),
      'year':
          List.generate(maxYear - first.year, (index) => (index + first.year)),
      'hour': List.generate(24, (index) => (index).toString().padLeft(2, '0')),
      'minute':
          List.generate(60, (index) => (index).toString().padLeft(2, '0')),
    };

    /* ------------------------------------------------------------
    | Methods Date
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
        'is_min_day_r':
            year <= first.year && month < first.month && date < first.day,
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

    /* ------------------------------------------------------------
    | Methods Time
    ------------------------------------ */

    Map timeProperties() {
      int hour = int.parse(selected['hour'].toString());
      int minute = int.parse(selected['minute'].toString());

      DateTime dateTime = DateTime(now.year, now.month, now.day, hour, minute);

      return {
        'hour': hour,
        'minute': minute,
        'selected': dateTime,
        'first': first,
        'last': last,
        'is_after': dateTime.isAfter(last),
        'is_before': dateTime.isBefore(first),
        'min_hour': first.hour,
        'is_min_hour': hour < first.hour,
        'is_min_hour_r': dateTime.hour <= first.hour,
        'is_max_hour': hour > last.hour,
        'is_max_hour_r': hour >= last.hour,
        'is_max_minute': hour >= last.hour && minute > last.minute,

        // minutes
        'is_min_minute_r': hour <= first.hour && minute <= first.minute,
        'is_max_minute_r': hour >= last.hour && minute >= last.minute,
      };
    }

    void setTimeRange() {
      Map prop = timeProperties();

      notifier.hourRanges = [first.hour, last.hour];
      notifier.minuteRanges = prop['is_min_minute_r']
          ? [first.minute, 59]
          : prop['is_max_minute_r']
              ? [first.minute, last.minute]
              : [0, 59];
    }

    void setHourFocus() {
      Map prop = timeProperties();

      if (prop['is_min_hour']) {
        notifier.scrollTo('hour', first.hour);
      } else if (prop['is_max_hour']) {
        notifier.scrollTo('hour', last.hour);
      }

      if (prop['is_min_minute_r']) {
        notifier.scrollTo('minute', first.minute);
      } else if (prop['is_max_minute']) {
        notifier.scrollTo('minute', last.minute);
      }

      setTimeRange();
    }

    void setMinuteFocus() {
      Map prop = timeProperties();

      if (prop['is_before']) {
        notifier.scrollTo('minute', first.minute);
      } else if (prop['is_max_minute']) {
        notifier.scrollTo('minute', last.minute);
      }

      setTimeRange();
    }

    Map<String, Function> methods = {
      'date': () => setDateFocus(),
      'month': () => setMonthFocus(),
      'year': () => setMonthFocus(),
      'hour': () => setHourFocus(),
      'minute': () => setMinuteFocus(),
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
                widgetType: widgetType,
                type: type,
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

    Widget cupertinoTimePickerWidget(String widgetType) {
      List value = iterations[widgetType]!;

      return ValueListenableBuilder(
          valueListenable: notifier,
          builder: (context, _, __) => CupertinioTimePickerWidget(
                controller: notifier.map[widgetType]!,
                notifier: notifier,
                type: widgetType,
                onChange: (int i) async {
                  if (!notifier.hasInit) return;
                  selected[widgetType] = value[i]; // update selected value

                  notifier.toggle({});
                  // methods[widgetType]!();
                },
                items: value.map((e) => e.toString()).toList(),
              ));
    }

    double radius = LazyUi.radius;

    return ScrollConfiguration(
      behavior: Unglow(),
      child: ClipRRect(
        borderRadius: Br.radius(radius, except: ['bl', 'br']),
        child: Container(
          decoration: BoxDecoration(
              color: Utils.hex('f1f1f1'),
              borderRadius: Br.radius(radius, except: ['bl', 'br'])),
          height: context.height * (context.width > 395 ? .6 : .45),
          // height: context.height,
          child: Stack(
            children: [
              Builder(
                builder: (context) {
                  List<String> types = ['date', 'month', 'year'];

                  return SlideUp(
                    delay: 250,
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 350,
                            child: Intrinsic(
                              children: List.generate(types.length, (t) {
                                String value = types[t];

                                return Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Br.only(['l'], except: t == 0)),
                                        child: cupertinoPickerWidget(value)));
                              }),
                            ),
                          ),
                        ],
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: Maa.center,
                    children: [
                      SlideUp(
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
                          child: Builder(builder: (context) {
                            String confirm = confirmLabel ?? 'Confirm';

                            return InkTouch(
                                onTap: () {
                                  DateTime date = dateProperties()['selected'];
                                  Navigator.pop(context, date);
                                },
                                padding: Ei.sym(
                                    v: 13, h: confirm.length > 25 ? 25 : 45),
                                radius: Br.radius(25),
                                color: Utils.hex('fff'),
                                border: Br.all(),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: context.width * .4),
                                  child: Text(
                                    confirm,
                                    textAlign: Ta.center,
                                    maxLines: 1,
                                    overflow: Tof.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            fontWeight: Fw.bold,
                                            color: LzColors.black),
                                  ),
                                ));
                          }),
                        ),
                      ),
                      Touch(
                        onTap: () => context.pop(),
                        child: SlideUp(
                          delay: 400,
                          child: Iconr(
                            La.times,
                            padding: Ei.all(20),
                          ),
                        ),
                      )
                    ],
                  ).margin(b: 15, l: 60),
                ),
              )),
              if (title != null)
                Poslign(
                  alignment: Alignment.topLeft,
                  margin: Ei.all(20),
                  child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Utils.hex('fafafa'),
                            spreadRadius: 10,
                            blurRadius: 25,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Textr(title ?? '',
                          overflow: Tof.ellipsis,
                          maxLines: 1,
                          icon: La.calendar,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: Fw.bold, color: LzColors.black))),
                ),
              Poslign(
                  alignment: Alignment.topRight,
                  child: InkTouch(
                      onTap: () {
                        notifier.toggleTimeMode();
                      },
                      child: notifier.watch(
                        (state) => AnimatedContainer(
                          duration: 250.ms,
                          margin: Ei.only(t: 20, r: 20),
                          height: state.isTimeMode ? 250 : 35,
                          width: state.isTimeMode ? context.width - 40 : 120,
                          decoration: BoxDecoration(
                              color: state.isTimeMode
                                  ? Colors.white
                                  : Colors.black.withOpacity(.5),
                              borderRadius: Br.radius(radius)),
                          child: Center(
                            child: state.isTimeMode
                                ? SizedBox(
                                    height: 250,
                                    child: Intrinsic(
                                        children: List.generate(2, (i) {
                                      return Expanded(
                                          child: Container(
                                        decoration: BoxDecoration(
                                            border:
                                                Br.only(['l'], except: i == 0)),
                                        child: cupertinoTimePickerWidget(
                                            i == 1 ? 'hour' : 'minute'),
                                      ));
                                    })),
                                  )
                                : Textr(
                                    '${state.map['hour']!.initialItem}:45',
                                    icon: Ti.clock,
                                    style: Gfont.fs17.white,
                                  ),
                          ),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

// class CupertinioPickerWidget extends StatelessWidget {
//   final FixedExtentScrollController controller;
//   final void Function(int)? onChange;
//   final List<String> items;
//   final PickerNotifier notifier;
//   final String widgetType;
//   final AlignmentGeometry? alignment;
//   final DatePickerType type;

//   const CupertinioPickerWidget(
//       {super.key,
//       required this.controller,
//       this.onChange,
//       this.items = const [],
//       required this.notifier,
//       this.widgetType = 'date',
//       this.alignment,
//       this.type = DatePickerType.all});

//   @override
//   Widget build(BuildContext context) {
//     bool isYearOnly = type == DatePickerType.year;

//     return CupertinoPicker(
//         magnification: isYearOnly ? 1.5 : 1,
//         useMagnifier: true,
//         itemExtent: isYearOnly ? 45 : 40,
//         diameterRatio: .5,
//         squeeze: isYearOnly ? .5 : 0.8,
//         scrollController: controller,
//         selectionOverlay: Container(
//           alignment: Alignment.centerRight,
//           decoration: BoxDecoration(
//               color: Colors.white.withOpacity(.4), border: Br.only([''])),
//         ),
//         onSelectedItemChanged: onChange,
//         children: List<Widget>.generate(items.length, (int index) {
//           return ValueListenableBuilder(
//               valueListenable: notifier,
//               builder: (context, value, child) {
//                 value as Map;

//                 Map styles = {
//                   'date': notifier.dateRanges,
//                   'month': notifier.monthRanges,
//                 };

//                 return Align(
//                   alignment: alignment ?? Alignment.center,
//                   child: Padding(
//                     padding: Ei.sym(h: 15),
//                     child: ZoomIn(
//                       child: Text(
//                         items[index],
//                         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                             fontSize: isYearOnly ? 35 : 16.5,
//                             color: styles[type] == null
//                                 ? Colors.black87
//                                 : index >= styles[type][0] &&
//                                         index <= styles[type][1]
//                                     ? Colors.black87
//                                     : Colors.black26),
//                       ),
//                     ),
//                   ),
//                 );
//               });
//         }));
//   }
// }
