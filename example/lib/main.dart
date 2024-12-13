import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:example/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

void errorHandler(ErrorInfo info) {
  String error = info.error;

  if (error.contains("is not a subtype of type")) {
    final match = RegExp(r"type '(.*?)' is not a subtype of type '(.*?)'")
        .firstMatch(error);

    if (match != null) {
      final from = match.group(2);
      final to = match.group(1);
      String message =
          'There is a change in data type from \'$from\' to \'$to\'';

      if (info.frames.isNotEmpty) {
        error = '$message, file: ${info.frames.first}';
      }
    }
  }

  // errors
  List<String> errorList = [
    error,
    '',
    '<b>App, User & Device</b>',
    'LazyUI, v1.0.0 24.12.02.1',
  ];

  String message = errorList.join('\n');
  logg(message);
}

void main() async {
  // initialize lazyui
  LazyUi.init(locale: 'id_ID', icon: IconType.huge);

  Errors.config(
      botToken: 'a',
      chatId: 'a',
      useBot: true,
      errorBuilder: (info) {
        errorHandler(info);
      });

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
