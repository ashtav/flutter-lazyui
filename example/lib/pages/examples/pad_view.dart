import 'dart:async';

import 'package:example/pages/widgets/example_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';

class PadView extends StatelessWidget {
  const PadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pad'),
          actions: [DarkModeWidget.icon()],
        ),
        body: LzListView(
          padding: Ei.all(20),
          gap: 25,
          children: [
            const ExampleLabel(
              description:
                  'LzPad is a secure and intuitive widget designed for inputting OTPs or passcodes, offering a customizable interface for seamless user authentication experiences.',
            ),
            Wrap(spacing: 15, runSpacing: 15, children: [
              LzButton(
                text: 'Input OTP',
                onTap: () {
                  LzPad.otp(context, expired: 3.m, onCompleted: (controller) {
                    logg(controller.value);

                    controller.pause();
                    LzToast.overlay('Validating...');
                    // request api...

                    Timer(2.s, () {
                      LzToast.dismiss();

                      if (controller.value == '123456') {
                        context.lz.pop();
                        Print.info('Your OTP is valid');
                      } else {
                        controller.reset().resume();
                        Print.error('Your OTP is invalid');
                      }
                    });
                  });
                },
              ),
              LzButton(
                text: 'Input Passcode',
                color: context.isDarkMode ? '161616'.hex : Colors.white,
                border: Br.all(color: Colors.black45.themeify),
                onTap: () {
                  LzPad.passcode(context, onCompleted: (controller) {
                    logg(controller.value);
                  });
                },
              ),
            ])
          ],
        ),
      ),
    );
  }
}
