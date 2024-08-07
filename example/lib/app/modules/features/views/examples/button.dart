import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Button'),
        ),
        body: LzListView(
          children: [
            Column(
              children: [
                LzButton(
                    text: 'Click Me',
                    icon: Ti.click,
                    onTap: (state) {
                      state.submit(abortOn: 2.s);
                    }),
              ],
            ).gap(10).start,
            Text('Button Icon', style: font.bold).margin(b: 3, t: 35),
            Text('Example of button with icon only.', style: font.muted)
                .margin(b: 20),
            Row(
              children: [
                LzButton(icon: Ti.archive, onTap: (state) {}),
                LzButton(icon: Ti.calendarEvent, onTap: (state) {})
                    .bg('#8a8583'.hex),
                LzButton(
                    icon: Ti.users,
                    onTap: (state) {
                      state.submit(abortOn: 2.s);
                    }).bg('#cd8b62'.hex, true),
              ],
            ).gap(10),
            Text('Button Padding', style: font.bold).margin(b: 3, t: 35),
            Text('Example of button with padding.', style: font.muted)
                .margin(b: 20),
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
                        })
                    .styled(
                        backgroundColor: '#a3573a'.hex, padding: Ei.all(35)),
              ],
            ).gap(10),
          ],
        ),
        bottomNavigationBar: MainButton(onTap: (state) {
          state.setText('Submitting...');
          state.submit(abortOn: 2.s);
        }));

    // Button('Submit', () => {})
  }
}

class MainButton extends StatelessWidget {
  final Function(ButtonState state)? onTap;
  const MainButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);
    return LzButton(
            text: 'Submit',
            style: LzButtonStyle(textStyle: font.bold.white),
            onTap: onTap)
        .bg('#475c6c'.hex)
        .lz
        .shadowed(context)
        .margin(blr: 20);
  }
}
