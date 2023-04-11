import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'pages/page.dart';
import 'theme/theme.dart';

void main() {
  Utils.setSystemUI(navBarColor: Colors.white);

  LazyUi.config(LazyUiOptions(radius: 5.0, primaryColor: Utils.hex('#212121'), widgets: {
    'confirm': {'cancel': 'Cancel', 'confirm': 'Yes'},
    'no_data': {'title': 'No Data', 'on_tap_message': 'Tap to refresh'},
  }));

  Errors.config(
      botToken: '1650513497:AAG5-o3fW_Fe45xOJfNMAxDxRDrLXPubdHM',
      chatId: '1099040541',
      useBot: true,
      errorBuilder: (ErrorInfo info) {
        String message = 'This is custom error message: ${info.error}, ${info.device}';
        Bot.sendMessage(message, info.botToken!, info.chatId!);
      });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LazyUi",
      theme: appTheme,
      home: const HomePage(),
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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AppIntro2(),
    );
  }
}
