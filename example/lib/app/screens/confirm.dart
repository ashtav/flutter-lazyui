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
                  LzConfirm.show(context,
                      title: 'Keluar Akun',
                      message:
                          'Yakin ingin keluar dari akun ini?\nAnda dapat login kembali kapan saja dengan akun yang sama.',
                      confirmText: 'Ya, Keluar',
                      onConfirm: () {});
                },
              ),
              InkTouch(
                onTap: () {
                  LzConfirm.show(context, title: 'Confirm Sheet', message: Faker.words(13), onConfirm: () {
                      LzToast.show('Your action has been confirmed', icon: Ti.checks);
                    }, type: ConfirmType.sheet, margin: 35);
                },
                radius: Br.radius(7),
                padding: Ei.all(20),
                margin: Ei.only(t: 20),
                child: const Text('Bottom Sheet Confirm'),
              )
            ],
          ),
        ));
  }
}
