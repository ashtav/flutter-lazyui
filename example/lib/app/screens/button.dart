
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LzButton'),
      ),
      body: LzListView(
        children: [
          LzButton(
            text: 'Default Button',
            onTap: (state) {},
          ).margin(b: 5),
          LzButton(text: 'Warning Button', onTap: (state) {})
              .warning()
              .margin(b: 5),
          LzButton(text: 'Success Button', onTap: (state) {})
              .success()
              .margin(b: 5),
          LzButton(text: 'Danger Button', onTap: (state) {})
              .danger()
              .margin(b: 5),
          LzButton(text: 'Dark Button', onTap: (state) {}).dark().margin(b: 5),
          LzButton(
            text: 'Outline Button',
            onTap: (state) {},
            outline: true,
          ).dark(),
          Textr(
            'This is button group',
            margin: Ei.only(b: 15, t: 25),
          ),
          [
            LzButton(
                    text: 'Left Align + Icon',
                    icon: La.user,
                    iconAlign: IconAlign.right,
                    onTap: (state) {})
                .primary(),
            LzButton(
              text: 'Right Align',
              onTap: (state) {},
            ).warning(),
          ].group(textAlign: Ta.justify).margin(b: 15),
          [
            LzButton(
                icon: La.user, onTap: (state) => state.submit(abortOn: 2.s)),
            LzButton(
                icon: La.archive, onTap: (state) => state.submit(abortOn: 2.s)),
            LzButton(
                icon: La.stream, onTap: (state) => state.submit(abortOn: 2.s)),
            LzButton(
                icon: La.star, onTap: (state) => state.submit(abortOn: 2.s)),
          ].group(direction: Axis.horizontal),
        ],
      ),
    );
  }
}
