import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button'),
      ),
      body: LzListView(
        children: [
          Column(
            children: [
              LzButton(
                  text: 'Submit',
                  icon: Ti.click,
                  style: LzButtonStyle(backgroundColor: 'ccc'.hex),
                  onTap: (state) {
                    state.submit(abortOn: 2.s);
                  }),
              LzButton(
                  text: 'Get Started!',
                  onTap: (state) {
                    state.submit(abortOn: 2.s);
                  }).bg('#8a8583'.hex).sized(context.width),
            ],
          ).gap(10).start,

          Text('Button Icon', style: Gfont.bold).margin(b: 3, t: 35),
          Text('Example of button with icon only.', style: Gfont.muted).margin(b: 20),
          Row(
            children: [
              LzButton(icon: Ti.archive, onTap: (state) {}),
              LzButton(icon: Ti.calendarEvent, onTap: (state) {}).bg('#475c6c'.hex),
              LzButton(
                  icon: Ti.users,
                  onTap: (state) {
                    state.submit(abortOn: 2.s);
                  }).bg('#cd8b62'.hex, true),
            ],
          ).gap(10),

          Text('Button Padding', style: Gfont.bold).margin(b: 3, t: 35),
          Text('Example of button with padding.', style: Gfont.muted).margin(b: 20),
          Row(
            children: [
              LzButton(
                  icon: Ti.exchange,
                  style: LzButtonStyle(padding: Ei.all(35)),
                  onTap: (state) {
                    state.submit(abortOn: 2.s);
                  }).bg('#cd8b62'.hex, true),
              LzButton(
                  icon: Ti.bucketDroplet,
                  text: 'Bucket Droplet',
                  onTap: (state) {
                    state.setText('Loading...');
                    state.submit(abortOn: 2.s);
                  }).styled(backgroundColor: '#a3573a'.hex, padding: Ei.all(35)),
            ],
          ).gap(10),

          // LzButton(
          //   text: 'Default Button',
          //   onTap: (state) {},
          // ).margin(b: 5),
          // LzButton(text: 'Warning Button', onTap: (state) {})
          //     .warning()
          //     .margin(b: 5),
          // LzButton(text: 'Success Button', onTap: (state) {})
          //     .success()
          //     .margin(b: 5),
          // LzButton(text: 'Danger Button', onTap: (state) {})
          //     .danger()
          //     .margin(b: 5),
          // LzButton(text: 'Dark Button', onTap: (state) {}).dark().margin(b: 5),
          // LzButton(
          //   text: 'Outline Button',
          //   onTap: (state) {},
          //   outline: true,
          // ).dark(),
          // Textr(
          //   'This is button group',
          //   margin: Ei.only(b: 15, t: 25),
          // ),
          // [
          //   LzButton(
          //           text: 'Left Align + Icon',
          //           icon: La.user,
          //           iconAlign: IconAlign.right,
          //           onTap: (state) {})
          //       .primary(),
          //   LzButton(
          //     text: 'Right Align',
          //     onTap: (state) {},
          //   ).warning(),
          // ].group(textAlign: Ta.justify).margin(b: 15),
          // [
          //   LzButton(
          //       icon: La.user, onTap: (state) => state.submit(abortOn: 2.s)),
          //   LzButton(
          //       icon: La.archive, onTap: (state) => state.submit(abortOn: 2.s)),
          //   LzButton(
          //       icon: La.stream, onTap: (state) => state.submit(abortOn: 2.s)),
          //   LzButton(
          //       icon: La.star, onTap: (state) => state.submit(abortOn: 2.s)),
          // ].group(direction: Axis.horizontal),
        ],
      ),
    );
  }
}
