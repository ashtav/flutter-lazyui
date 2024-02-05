import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = TestNotifier();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Test View'),
        actions: [
          const Icon(Ti.arrowUp).onPressed(() {
            context.bottomSheet(const MyWidget(), draggable: true, safeArea: false, backBlur: true);
            // context.dialog(const MyWidget(), backBlur: true);
          })
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: Maa.center,
        children: [
          const CircleAvatar(
            child: Icon(Ti.user),
          ).lz.sized(70).margin(b: 25),
          LzTextField(
            hint: 'Type your name',
            controller: notifier.forms['name'],
          )
        ],
      )).padding(all: 20),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: Colors.white,
      padding: Ei.all(20),
      child: Column(
        children: [Text(Faker.words(25)), const SizedBox(height: 150)],
      ).start.min,
    ).lz.clip(tlr: 8);
  }
}

class TestNotifier extends ChangeNotifier {
  final name = 'John'.tec;
  final forms = TEC.make(['name']);
}
