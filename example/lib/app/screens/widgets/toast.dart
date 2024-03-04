import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ToastView extends StatelessWidget {
  const ToastView({super.key});

  @override
  Widget build(BuildContext context) {
    LzToastConfig.set(placement: ToastPlacement.center);
    Timer? timer;
    double progress = 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Toast'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Column(
        children: [
          const Textml(
            '<b>LzToast</b> is a widget used to display brief messages that disappear after a few seconds, containing types such as success, warning & error.',
          ).margin(b: 25),
          LzButton(
            text: 'Show Overlay Progress',
            onTap: (_) {
              progress = 0;
              timer?.cancel();

              timer = Timer.periodic(150.ms, (_) {
                progress += Utils.getRange(1, 15);

                if (progress > 100) {
                  timer?.cancel();
                }
              });

              LzToast.overlayProgress('Loading...',
                  progress: () => progress,
                  percentage: true,
                  then: () {
                    LzToast.success('Progress done!', icon: Ti.checks);
                  },
                  onCancel: () {
                    LzToast.show('Progress cancelled!');
                  });
            },
          ).bg('333'.hex).styled(width: context.width),
          LzButton(
            text: 'Show Overlay',
            onTap: (_) {
              LzToast.overlay('Loading...', duration: 3.s, then: () {
                LzToast.show('Done!', icon: Ti.checks);
              }, onCancel: () {
                LzToast.show('Cancelled!');
              });
            },
          ).bg('333'.hex).styled(outline: true, width: context.width),
          LzButton(
            text: 'Show Toast',
            onTap: (_) {
              LzToast.show('Hey there!', duration: 3.s);

              Utils.timer(() {
                LzToast.show('Thanks for using LazyUi!', icon: La.checkCircle);
              }, 1.s);
            },
          ).sized(context.width),
        ],
      ).min.gap(10).margin(blr: 20),
    );
  }
}
