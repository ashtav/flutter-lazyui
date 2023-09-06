import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'cupertino_picker_widget.dart' as cupertino;
import 'footer_widget.dart';
import 'notifier.dart';
import 'time_selector_widget.dart';

class DateTimeSelector extends StatelessWidget {
  final DateTime? initialDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final String? title, confirmLabel;
  final bool useShortMonths;
  final DatePickerType type;
  final AlignmentGeometry? alignment;

  const DateTimeSelector(
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
    final notifier = DateTimePickerNotifier(
        {'init': initialDate, 'min': minDate, 'max': maxDate});

    Widget cupertinoPickerWidget(String widgetType) {
      List value = notifier.iterations(widgetType);

      return notifier.watch((state) {
        final controller = state.controls[widgetType]!;
        return cupertino.CupertinoDateTimePickerWidget(
          controller: controller,
          notifier: notifier,
          widgetType: widgetType,
          onChange: (int i) async {
            state.setDate(widgetType, value[i],
                fromIndex: controller.initialItem, toIndex: i);
          },
          items: value.map((e) => e.toString()).toList(),
        );
      });
    }

    // get default config
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
                child: Stack(children: [
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
                                                border: Br.only(['l'],
                                                    except: t == 0)),
                                            child:
                                                cupertinoPickerWidget(value)));
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  // footer, button confirmation and close
                  PickerFooterWidget(
                    notifier: notifier,
                    onConfirm: () {
                      if (notifier.isTimeMode) {
                        return notifier.toggleTimeMode();
                      }

                      context.pop(notifier.selectedDate);
                    },
                  ),

                  // time selector
                  TimeSelectorWidget(notifier: notifier),
                ]))));
  }
}
