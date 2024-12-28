import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';
import '../widgets/example_label_widget.dart';

class ToastView extends StatelessWidget {
  const ToastView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast'),
        actions: [DarkModeWidget.icon()],
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
              outlined: true,
              onTap: () {
                LzToast.show(Faker.words(5));
              },
            ),
            LzButton(
              text: 'Show Overlay',
              icon: Hi.loading03,
              outlined: true,
              onTap: () {
                LzToast.overlay('Loading...', duration: 30.s);
              },
            )
          ])
        ],
      ),
    );
  }
}
