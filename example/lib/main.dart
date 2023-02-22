import 'package:example/pages/form_view_2.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'pages/animate_view.dart';
import 'pages/form_view.dart';
import 'pages/item_view.dart';
import 'theme/theme.dart';

void main() {
  Utils.setSystemUI(navBarColor: Colors.white);

  LazyConfig.setConfig(LazyConfig(radius: 5.0, primaryColor: Utils.hex('#212121'), widgets: {
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
    GlobalKey key = GlobalKey();

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
                List<String> options = ['Option A', 'Option B', 'Option C', 'List Item', 'Animation'];
                DropdownDialog.open(context, options: options, offset: const Offset(16, 90), contextLess: true, disableds: [2], dangers: [1],
                    onSelect: (o, i) {
                  switch (o) {
                    case 'List Item':
                      context.push(const ItemView()).then((value) {
                        logg(value);
                      });
                      break;
                    case 'Animation':
                      context.push(const AnimateView());
                      break;

                    default:
                  }
                });
              },
              icon: const Icon(La.bars, color: Colors.black87))
        ],
      ),
      body: ZoomIn(
        child: Center(
            child: Column(
          mainAxisAlignment: Maa.center,
          children: [
            InkW(
              key: key,
              onTap: () {
                DropdownDialog.open(key.currentContext!, options: ['Option A', 'Option B', 'Option C']);
              },
              padding: Ei.sym(v: 15, h: 20),
              border: Br.all(),
              color: Colors.white,
              margin: Ei.only(b: 10),
              child: const Text('Dropdown Dialog'),
            ),
            Button(
              text: 'Form View 1',
              onTap: () => context.push(const FormView()),
              margin: Ei.sym(v: 5),
            ),
            Button(
              text: 'Form View 2',
              onTap: () => context.push(const FormView2()),
              margin: Ei.sym(v: 5),
            ),
            ...List.generate(
              3,
              (i) => Button(
                text: ['Select Date', 'Select Time', 'Select Image'][i],
                onTap: () async {
                  if (i == 0) {
                    DateTime? date = await Pickers.datePicker(context);
                    logg(date);
                  } else if (i == 1) {
                    DateTime? time = await Pickers.timePicker(context);
                    logg(time);
                  } else {
                    List<Media>? images = await Pickers.imagePicker(context, maxImages: 5);
                    logg(images);
                  }
                },
                margin: Ei.sym(v: 5),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
