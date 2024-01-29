import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ToastView extends StatelessWidget {
  const ToastView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['message']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast'),
      ),
      body: LzListView(
        children: [
          LzButton(
            text: 'Show Toast',
            onTap: (_) {
              LzToast.show('Hello World', duration: 3.s);

              Utils.timer(() {
                LzToast.show('Hello World', icon: La.checkCircle);
              }, 3.s);
            },
          ),
          LzButton(
            text: 'Show Toast Overlay',
            onTap: (_) {
              LzToast.overlay('Loading...');

              Utils.timer(() {
                LzToast.dismiss();
                LzToast.show('Dismissed');
              }, 3.s);
            },
          ).margin(v: 5),
          LzForm.input(
            label: 'Message',
            hint: 'Enter message here',
            maxLength: 300,
            model: forms['message'],
          ),
          LzButton(
            text: 'Show Toast with Message',
            onTap: (_) {
              LzToast.show(forms['message']!.controller.text,
                  duration: 3.s, icon: La.comment);
            },
          )
        ],
      ),
    );
  }
}
