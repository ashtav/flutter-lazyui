import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/widgets/forms/pads/notifier.dart';

class PadWidget extends StatelessWidget {
  final PadNotifier notifier;
  final int length;
  final Duration? expired;
  const PadWidget(this.notifier, {super.key, this.length = 6, this.expired});

  @override
  Widget build(BuildContext context) {
    List<String> keys = [
      ...[1, 9].iterate().map((e) => '$e'),
      'x',
      '0',
      '<'
    ];

    if (expired != null && context.mounted) {
      notifier.startTimer(expired!, onTimeout: () {
        context.lz.pop();
      });
    }

    return Scaffold(
        appBar: TransAppBar(
          leading: IconButton(onPressed: () => context.lz.pop(), icon: Icon(Hi.cancel01)),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                spacing: 20,
                children: [
                  // header
                  Padding(
                    padding: Ei.sym(h: 20),
                    child: Column(
                      spacing: 10,
                      children: [
                        Text('Please enter your OTP Code.', style: Gfont.bold, textAlign: Ta.center),
                        Text('Otp code sent to +62000000, please enter the code below to reset your password.',
                            textAlign: Ta.center),
                      ],
                    ),
                  ),

                  // input
                  notifier.watch((state) => Row(
                        mainAxisAlignment: Maa.center,
                        spacing: 10,
                        children: length.generate((i) {
                          return PadInput(
                            state.values.length < (i + 1) ? null : state.values[i],
                            active: i == state.values.length,
                            obsecure: true,
                          );
                        }),
                      )),
                ],
              ).centered,
            ),

            // timer
            notifier.watch((state) {
              return BlinkAnimate(
                  isAnimated: !state.isPaused,
                  duration: 500.ms,
                  child: Textr('Expired in ${state.expired} seconds', style: config.font.red, padding: Ei.sym(v: 20)));
            }),

            // custom keypad
            Wrap(
              children: keys.generate((k, i) {
                double width = context.width / 3;

                final maps = {'x': Hi.eraser, '<': Hi.eraser01};
                final key = maps[k] ?? k;

                return Touch(
                  onTap: () => notifier.onInput(k),
                  padding: Ei.all(20),
                  color: i % 2 == 0 ? 'f5f5f5'.hex : Colors.white,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(),
                      width: width - 40,
                      height: 20,
                      child: key is String ? Text(key, style: Gfont.fs16) : Icon(key as IconData)),
                );
              }),
            )
          ],
        ));
  }
}

class PadInput extends StatelessWidget {
  final String? value;
  final bool active;
  final bool obsecure;
  const PadInput(this.value, {super.key, this.active = false, this.obsecure = false});

  @override
  Widget build(BuildContext context) {
    if (obsecure) {
      return AnimatedContainer(
        width: 20,
        height: 20,
        duration: 100.ms,
        margin: Ei.sym(h: 5, v: 20),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Br.all(color: Colors.green, width: value == null ? 0.5 : 5)),
      );
    }

    return BlinkAnimate(
      isAnimated: value == null && active,
      child: Container(
        padding: Ei.sym(v: 20),
        width: 40,
        decoration:
            BoxDecoration(border: Br.only(['b'], color: value == null ? Colors.black12 : Colors.black54, width: 2)),
        child: Text(value == null ? '' : value!, textAlign: Ta.center),
      ),
    );
  }
}
