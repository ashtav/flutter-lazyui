import 'package:flutter/material.dart';
import 'package:lazyui/config/config.dart';
import 'package:lazyui/config/font.dart';
import 'package:lazyui/externals/line_awesome.dart';
import 'package:lazyui/src/extensions/extensions.dart';
import 'package:lazyui/src/utils/utils.dart';
import 'package:lazyui/src/widgets/widgets.dart';

import 'cupertino_picker_widget.dart';
import 'notifier.dart';

class TimeSelectorWidget extends StatelessWidget {
  final DateTimePickerNotifier notifier;
  const TimeSelectorWidget({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    // get default config
    double radius = LazyUi.getConfig.radius;

    Widget cupertinoTimePickerWidget(String widgetType) {
      List value = notifier.iterations(widgetType);

      return notifier.watch((state) {
        final controller = state.controls[widgetType]!;
        return CupertinioPickerWidget(
          controller: controller,
          notifier: notifier,
          widgetType: 'time',
          onChange: (int i) async {
            state.setDate(widgetType, int.parse(value[i].toString()), fromIndex: controller.initialItem, toIndex: i);
          },
          items: value.map((e) => e.toString()).toList(),
        );
      });
    }

    return Poslign(
        alignment: Alignment.topRight,
        child: InkW(
            margin: Ei.only(t: 20, r: 20),
            onTap: () {
              notifier.toggleTimeMode();
            },
            radius: Br.radius(radius),
            child: notifier.watch(
              (state) => AnimatedContainer(
                duration: 250.ms,
                curve: Curves.easeInOutBack,
                height: state.isTimeMode ? 250 : 35,
                width: state.isTimeMode ? context.width - 40 : 120,
                decoration: BoxDecoration(
                    // boxShadow: [BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10)],
                    border: Br.all(),
                    color: Colors.white,
                    borderRadius: Br.radius(radius)),
                child: Center(
                  child: state.isTimeMode
                      ? SizedBox(
                          height: 250,
                          child: Intrinsic(
                              children: List.generate(2, (i) {
                            return Expanded(
                                child: Container(
                              decoration: BoxDecoration(border: Br.only(['l'], except: i == 0)),
                              child: cupertinoTimePickerWidget(['hour', 'minute'][i]),
                            ));
                          })),
                        )
                      : Textr(
                          state.selectedDate.format('HH:mm'),
                          icon: La.clock,
                          style: Gfont.fs17,
                        ),
                ),
              ),
            )));
  }
}
