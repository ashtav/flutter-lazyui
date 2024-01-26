import 'package:example/app/screens/app_intro.dart';
import 'package:example/app/screens/app_trainer.dart';
import 'package:example/app/screens/forms2.dart';
import 'package:example/app/screens/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/feature.dart';
import 'accordion.dart';
import 'button.dart';
import 'confirm.dart';
import 'date_time_picker.dart';
import 'dropdown.dart';
import 'forms.dart';
import 'refreshtor.dart';
import 'select_option.dart';
import 'skeleton.dart';
import 'toast.dart';

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
    switch (label) {
      case 'app intro':
        context.lzPush(const AppIntro());
        break;

      case 'app trainer':
        context.lzPush(const AppTrainerView());
        break;

      case 'date & time picker':
        context.lzPush(const DateTimePicker());
        break;

      case 'accordion':
        context.lzPush(const AccordionView());
        break;

      case 'button':
        context.lzPush(const ButtonView());
        break;

      case 'confirm':
        context.lzPush(const ConfirmView());
        break;

      case 'dropdown':
        // context.lzPush(const DropdownView());
        break;

      case 'forms':
        context.lzPush(const FormsView());
        break;

      case 'LzForm':
        context.lzPush(const Forms2());
        break;

      case 'select option':
        context.lzPush(const SelectOptionView());
        break;

      case 'refreshtor':
        context.lzPush(const RefreshtorView());
        break;

      case 'skeleton':
        context.lzPush(const SkeletonView());
        break;

      case 'toast':
        context.lzPush(const ToastView());
        break;

      default:
        context.lzPush(const CustomWidgetView());
    }
  }
}
