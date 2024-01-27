import 'package:example/app/screens/forms.dart';
import 'package:example/app/screens/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/feature.dart';
import 'dropdown.dart';
import 'picker.dart';

class FeaturesView extends StatelessWidget {
  const FeaturesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Feature> features = [
      Feature(
          'LzForm', 'Customizable form with validation, error handling and ease full control of your form.', Ti.forms),
      Feature('LzDrop', 'Show dropdown options in any position, with icons, separators, etc.', Ti.cooker),
      Feature('LzPicker', 'Show a list of options in a bottom sheet, with search, disabled items, etc.',
          Ti.alignBoxCenterBottom),
      // 'App Intro',
      // 'App Trainer',
      // 'Date & Time Picker',
      // 'Accordion',
      // 'Button',
      // 'Confirm',
      // 'Dropdown',
      // 'Forms',
      // 'Forms 2',
      // 'Select Option',
      // 'Refreshtor',
      // 'Skeleton',
      // 'Toast',
      // 'Widgets'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy UI'),
      ),
      body: LzListView(children: features.generate((feature, i) {
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
      })),
    );
  }
}

class Actions {
  static on(BuildContext context, String label) {
    Map<String, dynamic> routes = {
      'LzForm': const FormsView(),
      'LzDrop': const DropdownView(),
      'LzPicker': const PickerView(),
    };

    context.lzPush(routes[label] ?? const CustomWidgetView());
  }
}
