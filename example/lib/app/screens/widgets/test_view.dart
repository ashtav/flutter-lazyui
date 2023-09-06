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

      body: LzListView(
        children: [
          Text('Hello world!', style: Gfont.color('09f'.hex).bold)
        ],
      )
    );
  }
}