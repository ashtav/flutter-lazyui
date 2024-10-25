import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:example/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

void main() async {
  // initialize lazyui
  LazyUi.init(locale: 'id_ID', icon: IconType.hugeIcon);

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
          builder: LazyUi.builder,
        );
      },
    );
  }
}
