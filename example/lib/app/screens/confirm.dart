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
                  
                },
              ),
              InkTouch(
                onTap: () {
                  
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
