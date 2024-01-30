import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse('2023-10-11T04:34:19.000000Z');
    logg(date.format('dd/MM/yyyy hh:mm', true));

    final notifier = TestNotifier();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Test View'),
          actions: [
            const Icon(Ti.arrowUp).onPressed(() {
              context.bottomSheet(const MyWidget(),
                  draggable: true, safeArea: false, backBlur: true);
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
            const Textml(
              'This is <b>bold</b> and <i>italic</i> text with <u>underline</u> and <p color="FF5733">custom color</p>.',
              style: TextStyle(fontSize: 16, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            LzTextField(
              hint: 'Type your name',
              controller: notifier.forms['name'],
            ),

            LzImage('https://reseller.saddannusantara.com/images/icons/013-study.svg', size: 100,)
          ],
        )).onTap(() async {
          final device = await Utils.getDevice();

          // ignore: avoid_print
          print(device);
          printt(device.value);

          logg(notifier.forms.value);

          final form = notifier.forms.validate(required: ['*']);
          if (!form.ok) {
            LzToast.warning(form.error);
          }
        }).padding(all: 20));
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
