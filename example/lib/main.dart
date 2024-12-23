import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'pages/home_view.dart';

void main() {
  LazyUi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LzTheme(
        child: (theme) => MaterialApp(
              title: 'LazyUi',
              theme: theme,
              home: const HomeView(),
            ));
  }
}
