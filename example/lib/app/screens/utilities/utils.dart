import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'utilitiy.dart';

class UtilsView extends StatelessWidget {
  const UtilsView({super.key});

  @override
  Widget build(BuildContext context) {
    // actions
    List<String> titles = [
      'Bot',
      'Error Handler',
      'Faker',
      'Formatter',
      'Lipsum',
      'Log',
      'Shortcut',
      'Utilities'
    ];
    List<String> description = [
      'A simple bot to automate your app, with a custom message, delay, etc.',
      'Show a error message with a custom message, title, etc.',
      'Generate fake data with a custom type, length, etc.',
      'Format your data with a custom type, length, etc.',
      'Generate a lipsum text with a custom length, type, etc.',
      'Show a log message with a custom message, type, etc.',
      'Show a shortcut message with a custom message, type, etc.',
      'A collection of utilities for efficient form management and streamlined data input, ensuring a smooth user experience.'
    ];

    final font = Gfont.style(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Utilities'),
      ),
      body: LzListView(
        children: [
          ...titles.generate((item, i) {
            return InkTouch.space(
              onTap: () => Actions.on(context, item),
              border: Br.only(['t'], except: i == 0),
              child: Column(
                children: [
                  Textr(item, style: font.bold.muted, margin: Ei.only(b: 5)),
                  Text(description[i], style: font.muted)
                ],
              ).start,
            );
          }),
        ],
      ),
    );
  }
}

class Actions {
  static on(BuildContext context, String label) {
    Map<String, dynamic> routes = {};

    context.lz
        .push(Utility(title: label, child: routes[label] ?? const None()));
  }
}
