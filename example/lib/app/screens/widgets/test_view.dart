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
        body: const Center(
            child: Textml(
          'This is <b>bold</b> and <i>italic</i> text with <u>underline</u> and <p color="FF5733">custom color</p>.',
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.center,
        )));
  }
}
