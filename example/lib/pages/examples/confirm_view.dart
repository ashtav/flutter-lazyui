import 'package:example/pages/widgets/example_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ConfirmView extends StatelessWidget {
  const ConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('LzConfirm'),
          actions: [LzThemeAction()],
        ),
        body: LzListView(
          padding: Ei.all(20),
          gap: 25,
          children: [
            const ExampleLabel(
              description:
                  'LzConfirm is a customizable dialog widget for displaying confirmation prompts with optional actions, designed for flexibility and a user-friendly experience.',
            ),
            Column(
              spacing: 50,
              children: [
                LzButton(
                  text: 'Show Confirm',
                  outlined: true,
                  onTap: () {
                    LzConfirm.show(context, confirmText: 'Ya!', onConfirm: () {
                      LzToast.show('Confirmed!');
                    });
                  },
                )
              ],
            ).start
          ],
        ),
      ),
    );
  }
}
