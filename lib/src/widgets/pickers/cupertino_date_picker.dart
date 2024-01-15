part of pickers;

/// `CupertinoDatePickerWidget` is a StatelessWidget that provides a Cupertino style
/// date picker interface. It allows users to select a date within a specified range.

class CupertinoDatePickerWidget extends StatelessWidget {
  /// The date that is initially selected when the picker is displayed.
  /// If null, the current date is used as the default.
  final DateTime? initialDate;

  /// The earliest allowable date that a user can select.
  /// If null, there is no lower bound on the date selection.
  final DateTime? minDate;

  /// The latest allowable date that a user can select.
  /// If null, there is no upper bound on the date selection.
  final DateTime? maxDate;

  /// The title text displayed at the top of the date picker.
  /// If null, no title is displayed.
  final String? title;

  /// The label for the confirmation button in the date picker.
  /// If null, a default label is used.
  final String? confirmLabel;

  /// Determines whether the picker uses abbreviated month names.
  /// If `true`, the picker displays abbreviated month names.
  /// If `false`, full month names are used.
  final bool useShortMonths;

  /// The type of date picker to display. This can be date, time, or date and time.
  final DatePickerType type;

  /// Alignment of the date picker widget within its parent.
  /// If null, the widget is centered.
  final AlignmentGeometry? alignment;

  const CupertinoDatePickerWidget(
      {super.key,
      this.initialDate,
      this.minDate,
      this.maxDate,
      this.title,
      this.confirmLabel,
      this.useShortMonths = false,
      this.type = DatePickerType.all,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    DateTime init = initialDate ?? DateTime.now();
    DateTime first = minDate ?? DateTime.now();
    DateTime last = maxDate ?? DateTime(DateTime.now().year + 10, 12, 31);

    init = init.isAfter(last) ? last : init;
    init = init.isBefore(first) ? first : init;

    List<String> months = ExampleData.months
        .map((e) => useShortMonths ? e.substring(0, 3) : e)
        .toList();

    /* ------------------------------------------------------------
    | On Init
    ------------------------------------ */

    // default date selected
    PickerNotifier notifier =
        PickerNotifier({'month': months[init.month - 1], 'year': init.year});
    Map<String, dynamic> selected = {
      'date': init.day,
      'month': months[init.month - 1],
      'year': init.year
    };

    int maxYear = last.year + 1;

    // iterations
    Map<String, List> iterations = {
      'date':
          List.generate(31, (index) => (index + 1).toString().padLeft(2, '0')),
      'month': List.generate(12, (index) => months[index]),
      'year':
          List.generate(maxYear - first.year, (index) => (index + first.year)),
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
        'is_min_day_r':
            year <= first.year && month < first.month && date < first.day,
        'is_min_month_r': year <= first.year && month < first.month - 1,
      };
    }

    /// Updates the date and month ranges in a date picker based on provided properties.
    ///
    /// This method adjusts the selectable date and month ranges within the date picker
    /// to align with minimum and maximum date constraints. It also ensures that the
    /// selectable days are updated to reflect the correct number of days in the selected
    /// month and year.

    void setDateMonthRange() {
      // Retrieves date properties which may include min/max dates and flags.
      Map prop = dateProperties();

      // Sets the selectable month range.
      // If the current year is the maximum year, limits the end month.
      // If the current year is the minimum year, limits the start month.
      // Otherwise, allows selection of any month.
      notifier.monthRanges = prop['is_max_year']
          ? [0, prop['max_month']]
          : prop['is_min_year']
              ? [prop['min_month'], 11]
              : [0, 11];

      // Sets the default selectable date range for the entire month.
      notifier.dateRanges = [0, prop['days_in_month']];

      // Adjusts the selectable date range if the current month and year
      // are the minimum allowed.
      if (prop['is_min_year'] && prop['is_min_month']) {
        notifier.dateRanges = [prop['min_day'], prop['days_in_month']];
      }

      // Adjusts the selectable date range if the current month and year
      // are the maximum allowed.
      else if (prop['is_max_year'] && prop['is_max_month']) {
        notifier.dateRanges = [0, prop['max_day']];
      }
    }

    /// Sets the focus on a specific date in the date picker based on certain conditions.
    ///
    /// This method determines which date should be focused or highlighted when the
    /// date picker is first displayed or when the date needs to be adjusted due to
    /// changes in selection or constraints. It utilizes `dateProperties` to understand
    /// the current context and constraints and then updates the focus accordingly.

    void setDateFocus() {
      // Retrieves date properties to determine the current context and constraints.
      Map prop = dateProperties();

      // Checks if the current context is after the maximum date and sets the focus
      // on the maximum day if true.
      if (prop['is_max_year'] && prop['is_max_month'] && prop['is_after']) {
        notifier.scrollTo('date', prop['max_day']);
      }
      // Checks if the minimum day is in range and sets the focus on the minimum day.
      else if (prop['is_min_day_r']) {
        notifier.scrollTo('date', prop['min_day']);
      }
      // Checks if the maximum day is in range and sets the focus on the last day of the month.
      else if (prop['is_max_day']) {
        notifier.scrollTo('date', prop['days_in_month']);
      }

      // Updates the date and month ranges based on the current selection and constraints.
      setDateMonthRange();
    }

    /// Sets the focus on a specific month in the date picker based on current constraints.
    ///
    /// This method is responsible for determining which month should be initially focused or highlighted
    /// in the date picker. It uses `dateProperties` to understand the constraints and conditions
    /// (like minimum or maximum allowable dates) and then scrolls to the appropriate month.

    void setMonthFocus() {
      // Retrieves date properties to understand the constraints and current context.
      Map prop = dateProperties();

      // If the current date is after the maximum date constraint, it scrolls to the maximum month.
      if (prop['is_after']) {
        notifier.scrollTo('month', prop['max_month']);
      }
      // If the minimum month is in range, it scrolls to the minimum month.
      else if (prop['is_min_month_r']) {
        notifier.scrollTo('month', prop['min_month']);
      }

      // Calls setDateFocus to set the focus on the appropriate date within the selected month.
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
          child: Stack(
            children: [
              Builder(
                builder: (context) {
                  List<String> types = ['date', 'month', 'year'];

                  if (type == DatePickerType.monthYear) {
                    types = ['month', 'year'];
                  } else if (type == DatePickerType.year) {
                    types = ['year'];
                  } else if (type == DatePickerType.dateMonth) {
                    types = ['date', 'month'];
                  }

                  return SlideUp(
                    delay: 250,
                    child: Center(
                      child: SizedBox(
                        height: context.height * 0.4,
                        child: Intrinsic(
                          children: List.generate(types.length, (t) {
                            String value = types[t];

                            return Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Br.only(['l'], except: t == 0)),
                                    child: cupertinoPickerWidget(value)));
                          }),
                        ),
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
                        onTap: () => context.lzPop(),
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
            ],
          ),
        ),
      ),
    );
  }
}

/// `CupertinoPickerWidget` is a StatelessWidget that provides a custom picker
/// interface using the Cupertino style. It is designed to allow users to
/// select from a list of items.
///
class CupertinioPickerWidget extends StatelessWidget {
  /// A controller for managing the item positions in the picker.
  final FixedExtentScrollController controller;

  /// A callback function that is called when the selected item in the picker changes.
  /// It provides the index of the newly selected item.
  final void Function(int)? onChange;

  /// A list of strings that represents the items available for selection in the picker.
  final List<String> items;

  /// A notifier used to react to changes or actions within the picker.
  final PickerNotifier notifier;

  /// Specifies the type of widget this picker is, which might influence its behavior
  /// or appearance.
  final String widgetType;

  /// The alignment of the picker widget within its parent.
  /// If null, the widget defaults to center alignment.
  final AlignmentGeometry? alignment;

  /// Specifies the type of date picker, influencing its appearance and functionality.
  /// This can be date, time, or date and time.
  final DatePickerType type;

  const CupertinioPickerWidget(
      {super.key,
      required this.controller,
      this.onChange,
      this.items = const [],
      required this.notifier,
      this.widgetType = 'date',
      this.alignment,
      this.type = DatePickerType.all});

  @override
  Widget build(BuildContext context) {
    bool isYearOnly = type == DatePickerType.year;

    return CupertinoPicker(
        magnification: isYearOnly ? 1.5 : 1,
        useMagnifier: true,
        itemExtent: isYearOnly ? 45 : 40,
        diameterRatio: .5,
        squeeze: isYearOnly ? .5 : 0.8,
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
                value as Map;

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
                            fontSize: isYearOnly ? 35 : 16.5,
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
