import 'package:example/app/screens/app_intro.dart';
import 'package:example/app/screens/app_trainer.dart';
import 'package:example/app/screens/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'accordion.dart';
import 'button.dart';
import 'confirm.dart';
import 'date_time_picker.dart';
import 'dropdown.dart';
import 'forms.dart';
import 'refreshtor.dart';
import 'select_option.dart';
import 'toast.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> features = [
      'App Intro',
      'App Trainer',
      'Date & Time Picker',
      'Accordion',
      'Button',
      'Confirm',
      'Dropdown',
      'Forms',
      'Select Option',
      'Refreshtor',
      'Skeleton',
      'Toast',
      'Widgets'
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
            children: [
              Text(item),
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
        context.lzPush(const DropdownView());
        break;

      case 'forms':
        context.lzPush(const FormsView());
        break;

      case 'select option':
        context.lzPush(const SelectOptionView());
        break;

      case 'refreshtor':
        context.lzPush(const RefreshtorView());
        break;

      case 'toast':
        context.lzPush(const ToastView());
        break;

      default:
        context.lzPush(const CustomWidgetView());
    }
  }
}
