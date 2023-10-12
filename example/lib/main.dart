import 'package:example/app/screens/app_intro.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // call LazyUi.config() before runApp()
  // to set your own default values, such as: theme, font, spacing, etc.
  LazyUi.config();

  runApp(const MyApp());
}

initializeDateFormatting(String s) {}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LazyUi',
      theme: appTheme,
      home: const AppIntro(),
      builder: (BuildContext context, Widget? widget) {
        // use LazyUi.builder to wrap your widget
        // so that you can use LzToast and setting maxScalingFontSize
        return LazyUi.builder(context, widget, maxScalingFontSize: 1.1);
      },
    );
  }
}
