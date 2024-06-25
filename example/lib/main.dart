import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:example/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

void main() async {
  // initialize lazyui
  LazyUi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: LzTheme.light,
      builder: (context, theme) {
        return MaterialApp(
          theme: theme,
          title: 'LazyUi',
          home: const HomeView(),
          builder: (BuildContext context, Widget? widget) {
            // use LazyUi.builder to wrap your widget
            // so that you can use LzToast and setting maxScalingFontSize
            return LazyUi.builder(context, widget, maxScalingFontSize: 1.1);
          },
        );
      },
    );
  }
}
