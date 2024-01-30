import 'package:example/app/screens/forms.dart';
import 'package:example/app/screens/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/feature.dart';
import 'button.dart';
import 'dropdown.dart';
import 'picker.dart';

class FeaturesView extends StatelessWidget {
  const FeaturesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Feature> features = [
      Feature(
          'LzForm', 'Customizable form with validation, error handling and ease full control of your form.', Ti.forms),
      Feature('LzDrop', 'Show dropdown options in any position, with icons, separators, etc.', Ti.dragDrop),
      Feature(
          'LzPicker',
          'Date picker, time picker and show a list of options in a bottom sheet, with search, disabled items, etc.',
          Ti.alignBoxCenterBottom),
      Feature('LzButton', 'Customizable button with icon, type, loading, disabled, etc.', Ti.click),
      // 'App Intro',
      // 'App Trainer',
      // 'Accordion',
      // 'Confirm',
      // 'Refreshtor',
      // 'Skeleton',
      // 'Toast',
      // 'Widgets'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy UI'),
      ),
      body: LzListView(children: [
        Column(
          children: features.generate((feature, i) {
            return InkTouch.space(
              onTap: () => Actions.on(context, feature.title),
              border: Br.only(['t'], except: i == 0),
              child: Row(
                mainAxisAlignment: Maa.spaceBetween,
                children: [
                  Column(
                    children: [
                      Textr(
                        feature.title,
                        style: Gfont.bold,
                        icon: feature.icon,
                      ),
                      Text(feature.description, style: Gfont.muted).margin(t: 5),
                    ],
                  ).start.lz.flexible(),
                  const Icon(Ti.chevronRight, color: Colors.black45)
                ],
              ),
            );
          }),
        ).min.lz.clip(all: 10)
      ]),
    );
  }
}

class Actions {
  static on(BuildContext context, String label) {
    Map<String, dynamic> routes = {
      'LzForm': const FormsView(),
      'LzDrop': const DropdownView(),
      'LzPicker': const PickerView(),
      'LzButton': const ButtonView(),
    };

    context.lzPush(routes[label] ?? const CustomWidgetView());
  }
}
