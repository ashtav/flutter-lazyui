import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ToastView extends StatelessWidget {
  const ToastView({super.key});

  @override
  Widget build(BuildContext context) {
    // final forms = LzForm.make(['message']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast'),
      ),
      bottomNavigationBar: Column(
        children: [
          const Textml(
            '<b>LzToast</b> is a widget used to display brief messages that disappear after a few seconds, containing types such as success, warning & error.',
          ).margin(b: 25),
          LzButton(
            text: 'Show Overlay',
            onTap: (_) {
              LzToast.overlay('Loading...', duration: 3.s);
            },
          ).bg('333'.hex).styled(outline: true, width: context.width),
          LzButton(
            text: 'Show Toast',
            onTap: (_) {
              LzToast.show('Hey there!', duration: 3.s, position: Position.center);

              Utils.timer(() {
                LzToast.show('Thanks for using LazyUi!', icon: La.checkCircle, position: Position.center);
              }, 1.s);
            },
          ).sized(context.width),
        ],
      ).min.gap(10).margin(blr: 20),
    );
  }
}
