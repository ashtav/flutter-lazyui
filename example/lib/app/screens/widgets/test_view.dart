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
          child: LzFormList(
            style: const LzFormStyle(type: FormType.topAligned),
            children: [
              LzForm.input(label: 'Your Name *', hint: 'Input your name', indicator: true),
              LzForm.slider(label: 'Price *')
            ],
          ),
        ));
  }
}
