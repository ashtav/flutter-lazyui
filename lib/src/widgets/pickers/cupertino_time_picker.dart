part of pickers;

class CupertinoTimePickerWidget extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final String? title, confirmLabel;
  const CupertinoTimePickerWidget(
      {super.key,
      this.initialDate,
      this.minDate,
      this.maxDate,
      this.title,
      this.confirmLabel});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();

    DateTime init = initialDate ?? now;
    DateTime first = minDate ?? DateTime(now.year, now.month, now.day, 0, 0, 0);
    DateTime last =
        maxDate ?? DateTime(now.year, now.month, now.day, 23, 59, 59);

    init = init.isAfter(last) ? last : init;
    init = init.isBefore(first) ? first : init;

    /* ------------------------------------------------------------
    | On Init
    ------------------------------------ */

    // default date selected
    PickerNotifier notifier =
        PickerNotifier({'hour': init.hour, 'minute': init.minute});
    Map<String, dynamic> selected = {'hour': init.hour, 'minute': init.minute};

    // iterations
    Map<String, List> iterations = {
      'hour': List.generate(24, (index) => (index).toString().padLeft(2, '0')),
      'minute':
          List.generate(60, (index) => (index).toString().padLeft(2, '0')),
    };

    /* ------------------------------------------------------------
    | Methods
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
      'hour': () => setHourFocus(),
      'minute': () => setMinuteFocus(),
    };

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      int duration = 1000;

      int h = iterations['hour']!.indexOf(init.hour.toString().padLeft(2, '0'));
      int m =
          iterations['minute']!.indexOf(init.minute.toString().padLeft(2, '0'));

      int hh = (h - 5) < 0 ? 0 : h - 5;
      int mm = (m - 5) < 0 ? 0 : m - 5;

      notifier.jumpToItem('hour', hh);
      notifier.jumpToItem('minute', mm);

      await Future.delayed(const Duration(milliseconds: 100), () {
        notifier.scrollTo('hour', h, duration: duration);
        notifier.scrollTo('minute', m, duration: duration);
      });

      setTimeRange();

      await Future.delayed(const Duration(milliseconds: 1000), () {
        notifier.hasInit = true;
      });
    });

    Widget cupertinoPickerWidget(String widgetType) {
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
                  return SlideUp(
                    delay: 250,
                    child: Center(
                      child: SizedBox(
                        height: context.height * 0.4,
                        child: Intrinsic(
                          children: List.generate(2, (t) {
                            String value = ['hour', 'minute'][t];
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
              ------------------------------------ */
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
                                  DateTime date = timeProperties()['selected'];
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
                          icon: La.clock,
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

class CupertinioTimePickerWidget extends StatelessWidget {
  final FixedExtentScrollController controller;
  final void Function(int)? onChange;
  final List<String> items;
  final PickerNotifier notifier;
  final String type;
  const CupertinioTimePickerWidget(
      {super.key,
      required this.controller,
      this.onChange,
      this.items = const [],
      required this.notifier,
      this.type = 'hour'});

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
        magnification: 1.5,
        useMagnifier: false,
        itemExtent: 45,
        offAxisFraction: 0,
        diameterRatio: .5,
        squeeze: 0.5,
        scrollController: controller,
        selectionOverlay: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(.4), border: Br.only([''])),
        ),
        onSelectedItemChanged: onChange,
        children: List<Widget>.generate(items.length, (int index) {
          return ValueListenableBuilder(
              valueListenable: PickerNotifier({}),
              builder: (context, value, child) {
                value as Map;

                Map styles = {
                  'hour': notifier.hourRanges,
                  'minute': notifier.minuteRanges,
                };

                return Center(
                  child: Padding(
                    padding: Ei.sym(h: 15),
                    child: ZoomIn(
                      child: Text(
                        items[index],
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 35,
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
