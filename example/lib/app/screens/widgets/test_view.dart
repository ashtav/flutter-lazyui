import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test View'),
        ),
        body: Center(
          child: Colr(
            children: [
              LzButton(
                onTap: (s) {
                  s.submit(abortOn: 2.s);
                },
                text: 'Test Button',
                icon: Ti.album,
              ).lz.blink(),
            ],
          ),
        ));
  }
}
