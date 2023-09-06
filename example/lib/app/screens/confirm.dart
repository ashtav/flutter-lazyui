import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ConfirmView extends StatelessWidget {
  const ConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LzConfirm'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: Maa.center,
            children: [
              LzButton(
                outline: true,
                type: ButtonType.dark,
                text: 'Dialog Confirm',
                onTap: (_) {
                  LzConfirm(
                    title: 'Widget Confirmation',
                    message: 'Are you sure you want to confirm this widget?',
                    onConfirm: () {
                      LzToast.show('Widget confirmed');
                    },
                  ).show(context);
                },
              ),
              InkTouch(
                onTap: () {
                  LzConfirm(
                    title: 'Widget Confirmation',
                    message: 'Are you sure you want to confirm this widget?',
                    type: LzConfirmType.bottomSheet,
                    confirmText: 'Yes, Delete It!',
                    onConfirm: () {
                      LzToast.show('Widget confirmed');
                    },
                  ).show(context);
                },
                radius: Br.radius(7),
                padding: Ei.all(20), margin: Ei.only(t: 20),
                child: const Text('Bottom Sheet Confirm'),
              )
            ],
          ),
        ));
  }
}
