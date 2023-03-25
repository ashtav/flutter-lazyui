import 'package:example/pages/another_widget_view.dart';
import 'package:example/pages/form_view_6.dart';
import 'package:example/pages/item_view.dart';
import 'package:example/pages/nodata_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'pages/animate_view.dart';
import 'pages/error_handler_view.dart';
import 'pages/form_view.dart';
import 'pages/form_view_2.dart';
import 'pages/form_view_3.dart';
import 'pages/form_view_4.dart';
import 'pages/form_view_5.dart';
import 'pages/lazicon_view.dart';
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
      title: "Welcome to LazyUi",
      theme: appTheme,
      home: const HomePage(),
      builder: (BuildContext context, Widget? widget) {
        double fontDeviceSize = MediaQuery.of(context).textScaleFactor;

        // prevent user from scaling font size
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: fontDeviceSize > 1.1 ? 1.1 : 1.0,
            ),
            child: LzLoadingOverlay(child: widget ?? Container()));
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    GlobalKey key3 = GlobalKey();

    List<String> features = [
      'Select Date',
      'Select Time',
      'LzDropdown',
      'LzDropdown In List',
      'Custom Dialog',
      'Forms',
      'Stacked List',
      'Select Option',
      'Animation',
      'Lazicon',
      'No Data',
      'Error Handler',
      'Another Widgets',
      'Forms 3',
      'Forms 4',
      'Forms 5',
      'Forms 6',
    ];

    void onFeatureTap(int index) async {
      switch (features[index]) {
        case 'Select Date':
          DateTime? date = await Pickers.datePicker(context);
          logg(date);

          break;

        case 'Select Time':
          DateTime? time = await Pickers.timePicker(context);
          logg(time);

          break;

        case 'LzDropdown':
          // DropdownDialog.open(key.currentContext!, options: ['Option A', 'Option B', 'Option C'], onSelect: (o, i) {
          //   logg(o);
          // });

          final options = ['Setting Account', 'Change Password', 'Logout'].make((data, i) => Option(option: data[i]));
          LzDropdown.show(key.currentContext!, options: options);
          break;

        case 'LzDropdown In List':
          context.push(const ItemView());

          // final options = ['Setting Account', 'Change Password', 'Logout'].make((data, i) => Option(option: data[i]));
          // LzDropdown.show(key3.currentContext!, options: options, offset: const Offset(20, 0));

          break;

        case 'Custom Dialog':
          context.dialog(CustomDialog(
            tapClose: true,
            alignment: Caa.start,
            children: [
              Text('Dialog Title', style: Gfont.fs20.bold),
              Textr(
                Lipsum.createWord(15),
                margin: Ei.only(t: 10, b: 15),
              ),
              Col(
                children: List.generate(5, (i) {
                  return Container(
                    padding: Ei.sym(v: 20),
                    decoration: BoxDecoration(border: Br.only(['t'])),
                    child: Row(
                      children: [
                        Text(Lipsum.createWord(3)),
                      ],
                    ),
                  );
                }),
              ),
              const TextInputTransparent(
                hint: 'Type something...',
              ),
            ],
          ));
          break;

        case 'Forms':
          context.push(const FormView());
          break;

        case 'Stacked List':
          context.push(const FormView2());
          break;

        case 'Select Option':
          List<Option> options = List.generate(5, (i) => Option(option: Lipsum.createWord(3), value: i));
          context.bottomSheet(
              SelectPicker(
                  options: options,
                  onSelect: (option) {
                    logg(option.option);
                  }),
              useSafeArea: false,
              enableDrag: true);

          break;

        case 'Animation':
          context.push(const AnimateView());
          break;

        case 'Lazicon':
          context.push(const LaziconView());
          break;

        case 'No Data':
          context.push(const NoDataView());
          break;

        case 'Error Handler':
          context.push(const ErrorHandlerView());
          break;

        case 'Another Widgets':
          context.push(const AnotherWidgetView());
          break;

        case 'Forms 3':
          context.push(const FormView3());
          break;

        case 'Forms 4':
          context.push(const FormView4());
          break;

        case 'Forms 5':
          context.push(const FormView5());
          break;

        case 'Forms 6':
          context.push(const FormView6());
          break;
        default:
      }
    }

    GlobalKey key2 = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'LazyUi',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: .5,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: () {}, icon: const Iconr(La.search, flipX: true)),
          IconButton(
              key: key2,
              onPressed: () {
                // List<String> options = ['Option A', 'Option B', 'Option C', 'Option D', 'Option E'];
                // DropdownDialog.open(context, options: options, top: true, disableds: [2], dangers: [1], sparators: [3]);

                final options = ['Option A', 'Option B', 'Option C', 'Option D', 'Option E'].make((data, i) => Option(option: data[i]));
                LzDropdown.show(key2.currentContext!, options: options, offset: const Offset(20, 0));
              },
              icon: const Icon(
                La.bars,
                color: Colors.black87,
              ))
        ],
      ),
      body: ListView(
        physics: BounceScroll(),
        padding: Ei.all(20),
        children: [
          Wrap(
              children: List.generate(
                  features.length,
                  (i) => Button(
                        key: {2: key, 3: key3}[i],
                        onTap: () {
                          onFeatureTap(i);
                        },
                        text: features[i],
                        gradient: true,
                        margin: Ei.all(2),
                      ))),
          const SizedBox(height: 20),
          ExpandableList(
              children: List.generate(
                  5,
                  (i) => ExpandableContent(
                        title: Lipsum.createWord(5).ucwords,
                        child: Text(Lipsum.createWord(50)),
                      ))),
          const SizedBox(height: 20),
          Button(
            text: 'Gradient Button',
            gradient: true,
            type: ButtonType.warning,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
