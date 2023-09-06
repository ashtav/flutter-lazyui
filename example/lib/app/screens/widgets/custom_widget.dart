import 'package:example/app/screens/widgets/loader_view.dart';
import 'package:example/app/screens/widgets/nodata_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'test_view.dart';

class CustomWidgetView extends StatelessWidget {
  const CustomWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> features = [
      'Loader',
      'No Data',
      'Test',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy UI'),
      ),
      body: ListView(children: features.generate((item, i) {
        return InkTouch.space(
          onTap: () => Actions.on(context, item.toLowerCase()),
          border: Br.only(['t'], except: i == 0),
          child: Row(
            mainAxisAlignment: Maa.spaceBetween,
            children: [Text(item), const Icon(Ti.chevronRight, color: Colors.black45)],
          ),
        );
      })),
    );
  }
}

class Actions {
  static on(BuildContext context, String label) {
    switch (label) {
      case 'loader':
        context.push(const LoaderView());
        break;

      case 'no data':
        context.push(const NoDataView());
        break;
      default:
        context.push(const TestView());
        break;
    }
  }
}
