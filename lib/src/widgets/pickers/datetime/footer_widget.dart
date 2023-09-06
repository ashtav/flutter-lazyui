import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/pickers/datetime/notifier.dart';

class PickerFooterWidget extends StatelessWidget {
  final String? confirmLabel;
  final Function()? onConfirm;
  final DateTimePickerNotifier notifier;
  const PickerFooterWidget(
      {super.key, this.confirmLabel, this.onConfirm, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return Poslign(
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
                      onTap: onConfirm,
                      padding: Ei.sym(v: 13, h: confirm.length > 25 ? 25 : 45),
                      radius: Br.radius(25),
                      color: Utils.hex('fff'),
                      border: Br.all(),
                      child: Container(
                        constraints:
                            BoxConstraints(maxWidth: context.width * .4),
                        child: Text(
                          confirm,
                          textAlign: Ta.center,
                          maxLines: 1,
                          overflow: Tof.ellipsis,
                          style: LazyUi.font.copyWith(
                              fontWeight: Fw.bold, color: LzColors.black),
                        ),
                      ));
                }),
              ),
            ),
            Touch(
              onTap: () {
                if (notifier.isTimeMode) {
                  return notifier.toggleTimeMode();
                }

                context.pop();
              },
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
    );
  }
}
