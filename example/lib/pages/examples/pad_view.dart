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
                  LzPad.otp(context, expired: 60.s);
                },
              ),
            ])
          ],
        ),
      ),
    );
  }
}
