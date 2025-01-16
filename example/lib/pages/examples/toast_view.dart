import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class ToastView extends StatelessWidget {
  const ToastView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    double progress = 0;

    void uploading() {
      progress = 0;
      timer?.cancel();

      timer = Timer.periodic(150.ms, (_) {
        progress += [3, 50].iterate().randomize;

        if (progress > 100) {
          timer?.cancel();
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast'),
        actions: [LzThemeAction()],
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'LzToast is a custom implementation of a Toast notification, providing a brief, on-screen message to inform or alert the user.',
          ),
          Wrap(spacing: 15, runSpacing: 15, children: [
            LzButton(
              text: 'Show Toast',
              icon: Hi.informationCircle,
              outlined: true,
              onTap: () {
                LzToast.success(Faker.words(15),
                    icon: Hi.informationSquare,
                    align: Alignment.bottomLeft,
                    maxLength: 25);
              },
            ),
            LzButton(
              text: 'Show Overlay',
              icon: Hi.loading03,
              outlined: true,
              onTap: () {
                LzToast.overlay('Loading...', onCancel: () {
                  LzToast.show('Progrss is cancelled!');
                });
              },
            ),
            LzButton(
              text: 'Show Overlay Progress',
              icon: Hi.percent,
              outlined: true,
              onTap: () {
                uploading();
                LzToast.progress('Uploading...', () => progress);
              },
            )
          ])
        ],
      ),
    );
  }
}
