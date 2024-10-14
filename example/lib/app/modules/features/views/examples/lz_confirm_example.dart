import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ConfirmView extends StatelessWidget {
  const ConfirmView({super.key});

  @override
  Widget build(BuildContext context) {
    // put this in main.dart
    LzConfirm.config(confirmText: 'Yeah, Sure!', cancelText: 'No');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Confirm'),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: Column(mainAxisAlignment: Maa.end, children: [
            const Textml(
                    '<b>LzConfirm</b> provide 2 ways to show a confirmation dialog, Dialog and Bottom Sheet.')
                .margin(b: 20),
            ...2.generate((index) {
              return LzButton(
                text: [
                  'Show Confirm Dialog',
                  'Show Confirm Bottom Sheet'
                ][index],
                onTap: (state) {
                  if (index == 0) {
                    LzConfirm.show(context,
                        title: 'Confirm Dialog',
                        message: Faker.words(13),
                        confirmColor: Colors.redAccent,
                        darkMode: true, onConfirm: () {
                      LzToast.show('Your action has been confirmed',
                          icon: Ti.checks);
                    });
                  }

                  // bottom sheet
                  else {
                    LzConfirm.show(context,
                        title: 'Confirm Sheet',
                        margin: 20,
                        message: Faker.words(13), onConfirm: () {
                      LzToast.show('Your action has been confirmed',
                          icon: Ti.checks);
                    }, type: ConfirmType.sheet);
                  }
                },
              ).sized(context.width).styled(borderColor: Colors.black38);
            })
          ]).gap(10).margin(all: 20),
        ));
  }
}
