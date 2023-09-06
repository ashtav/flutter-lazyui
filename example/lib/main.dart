import 'package:example/app/screens/app_intro.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'app/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  LazyUi.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LazyUi',
      theme: appTheme,
      home: const AppIntro(),
      builder: (BuildContext context, Widget? widget) {
        double fontDeviceSize = MediaQuery.of(context).textScaleFactor;

        // prevent user from scaling font size
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: fontDeviceSize > 1.1 ? 1.1 : 1.0,
            ),
            child: LzToastOverlay(child: widget));
      },
    );
  }
}