import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'src/screens/home/views/home_view.dart';

void main() {
  // init lazyui
  LazyUi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LazyUI',
      theme: LzTheme.light,
      home: const HomeView(),
    );
  }
}
