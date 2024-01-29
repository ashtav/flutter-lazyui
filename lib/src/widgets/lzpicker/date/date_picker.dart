import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'date_picker_style.dart';
import 'notifier.dart';

class LzDatePicker extends StatelessWidget {
  final DateTime? initDate;
  final DateTime? minDate;
  final DateTime? maxDate;
  final DatePickerStyle? style;
  final String? format;
  final bool withTime;

  const LzDatePicker(
      {super.key, this.initDate, this.minDate, this.maxDate, this.style, this.format, this.withTime = false});

  @override
  Widget build(BuildContext context) {
    List<String> formats = (format ?? 'd/m/y').split('/');

    final notifier = DatePickerNotifier();
    notifier.onInitialized(formats, initDate: initDate, minDate: minDate, maxDate: maxDate);

    double radius = style?.radius ?? LazyUi.radius;
    double height = context.height * (context.width > 395 ? .6 : .45);

    return ScrollConfiguration(
      behavior: Unglow(),
      child: Container(
        decoration: BoxDecoration(color: Utils.hex('f1f1f1')),
        child: Stack(
          children: [
            SizedBox(
              height: height,
              child: Intrinsic(
                children: formats.generate((f, i) {
                  final items = notifier.generateDate(f);
                  return Expanded(
                      child: Container(
                          decoration: BoxDecoration(border: Br.only(['l'], except: i == 0)),
                          child: CupertinoPickerWidget(notifier, type: f, items: items)));
                }),
              ),
            ),

            // confirm button
            Poslign(
                alignment: Alignment.bottomCenter,
                margin: Ei.only(b: 15),
                child: Row(
                  children: 3.generate((i) {
                    return SlideUp(
                        delay: (i + 1) * 100,
                        child: i != 1
                            ? Iconr(La.times, padding: Ei.all(15))
                                .onTap(() {
                                  if (notifier.openTimePicker) {
                                    notifier.toggleTimePicker();
                                    return;
                                  }

                                  context.lzPop();
                                })
                                .lz
                                .disabled(i == 0, 0)
                            : Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Utils.hex('f1f1f1'),
                                      spreadRadius: 25,
                                      blurRadius: 35,
                                      offset: const Offset(0, -5),
                                    ),
                                  ],
                                ),
                                child: InkTouch(
                                  onTap: () {
                                    logg(notifier.value);
                                  },
                                  padding: Ei.sym(v: 12, h: 45),
                                  margin: Ei.sym(h: 5),
                                  border: Br.all(),
                                  color: Colors.white,
                                  radius: Br.radius(50),
                                  child: Text(style?.confirmText ?? 'Confirm', style: LazyUi.font),
                                ),
                              ));
                  }),
                ).center),

            // time picker
            TimePicker(notifier, radius: radius)
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

  const CupertinoPickerWidget(this.notifier,
      {super.key,
      required this.type,
      this.items = const [],
      this.magnification,
      this.itemExtent,
      this.diameterRatio,
      this.squeeze});

  @override
  Widget build(BuildContext context) {
    int length = notifier.controller.keys.length;
    bool isYearOnly = notifier.controller.keys.toList().contains('y') && length == 1;

    double magnification = this.magnification ?? (isYearOnly ? 1.5 : 1);
    double itemExtent = this.itemExtent ?? (isYearOnly ? 45 : 40);
    double squeeze = this.squeeze ?? (isYearOnly ? .5 : 0.8);
    double diameterRatio = this.diameterRatio ?? .5;

    String type = ['mm', 'mmm'].contains(this.type) ? 'm' : this.type;

    return notifier.watch((state) => CupertinoPicker(
        magnification: magnification,
        useMagnifier: true,
        itemExtent: itemExtent,
        diameterRatio: diameterRatio,
        squeeze: squeeze,
        scrollController: notifier.controller[type] ?? FixedExtentScrollController(initialItem: 0),
        selectionOverlay: Container(
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(color: Colors.white.withOpacity(.4)),
        ),
        onSelectedItemChanged: (int i) => notifier.onChange(i, type),
        children: items.generate((item, i) {
          return Align(
            alignment: Alignment.center,
            child: ZoomIn(
              child: Textr(
                item,
                style: LazyUi.font,
                padding: Ei.sym(h: 15),
              ),
            ),
          );
        })));
  }
}

class TimePicker extends StatelessWidget {
  final DatePickerNotifier notifier;
  final double radius;
  const TimePicker(this.notifier, {super.key, this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return Poslign(
        alignment: Alignment.topRight,
        margin: Ei.only(t: 20, r: 20),
        child: InkTouch(
            onTap: () {
              notifier.toggleTimePicker();
            },
            color: 'f1f1f1'.hex,
            border: Br.all(color: Colors.black26),
            radius: Br.radius(radius),
            child: notifier.watch(
              (state) {
                String time = state.value.format('HH:mm');

                return AnimatedContainer(
                  duration: 350.ms,
                  curve: state.openTimePicker ? Curves.easeInOutBack : Curves.fastEaseInToSlowEaseOut,
                  height: state.openTimePicker ? 250 : 35,
                  width: state.openTimePicker ? context.width - 40 : 120,
                  child: Center(
                    child: state.openTimePicker
                        ? SizedBox(
                            height: 250,
                            child: Intrinsic(
                                children: ['h', 'i'].generate((f, i) {
                              final items = notifier.generateDate(f);

                              return Expanded(
                                  child: Container(
                                decoration: BoxDecoration(border: Br.only(['l'], except: i == 0)),
                                child: CupertinoPickerWidget(
                                  notifier,
                                  type: f,
                                  items: items,
                                  magnification: 1.5,
                                  itemExtent: 40,
                                  squeeze: .7,
                                  diameterRatio: .6,
                                ),
                              ));
                            })),
                          )
                        : Textr(
                            time,
                            style: Gfont.muted.copyWith(letterSpacing: 2),
                            icon: Ti.clock,
                          ),
                  ),
                );
              },
            )));
  }
}
