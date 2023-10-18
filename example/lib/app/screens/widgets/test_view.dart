import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse('2023-10-11T04:34:19.000000Z');
    logg(date.format('dd/MM/yyyy hh:mm', true));

    return Scaffold(
        appBar: AppBar(
          title: const Text('Test View'),
        ),
        body: const Center(
            child: Textml(
          'This is <b>bold</b> and <i>italic</i> text with <u>underline</u> and <p color="FF5733">custom color</p>.',
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        )).onTap(() async {
          final device = await Utils.getDevice();
          logg(device.value);
        }));
  }
}
