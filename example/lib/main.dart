import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:mixins/mixins.dart';

import 'pages/form_view.dart';
import 'theme/theme.dart';

void main() {
  Mixins.setSystemUI(navBarColor: Colors.white);

  LazyConfig.setConfig(LazyConfig(radius: 2.0, primaryColor: Mixins.hex('#212121'), widgets: {
    'confirm': {'cancel': 'Cancel', 'confirm': 'Yes'},
    'no_data': {'title': 'No Data', 'on_tap_message': 'Tap to refresh'},
  }));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Welcome to LazyUi', theme: appTheme, home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Welcome to LazyUi',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: .5,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () {
                DropdownDialog.open(context,
                    options: List.generate(4, (index) => 'Option $index'),
                    offset: const Offset(16, 57),
                    disableds: [2],
                    dangers: [1], onSelect: (o, i) {
                  logg(o);
                });
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black87,
              ))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: Maa.center,
        children: [
          InkW(
            onTap: () async {
              try {
                Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (BuildContext context) => const FormView(),
                ));
              } catch (e, s) {
                Mixins.errorCatcher(e, s);
              }
            },
            // onTapDown: (details) => logg(details),
            color: Colors.white, border: Br.all(Colors.black12),
            padding: Ei.sym(v: 15, h: 25),
            child: const Text('Forms View'),
          ),
        ],
      )),
    );
  }
}
