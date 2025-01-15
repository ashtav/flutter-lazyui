import 'package:example/data/features.dart';
import 'package:example/pages/examples/form_group_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'about_widget.dart';
import 'examples/accordion_view.dart';
import 'examples/badge_view.dart';
import 'examples/button_view.dart';
import 'examples/card_view.dart';
import 'examples/confirm_view.dart';
import 'examples/countdown_view.dart';
import 'examples/dropdown_view.dart';
import 'examples/form_view.dart';
import 'examples/icon_view.dart';
import 'examples/image_view.dart';
import 'examples/listview_view.dart';
import 'examples/pad_view.dart';
import 'examples/picker_view.dart';
import 'examples/refreshtor_view.dart';
import 'examples/shimmer_view.dart';
import 'examples/test_view.dart';
import 'examples/text_count_view.dart';
import 'examples/text_view.dart';
import 'examples/theme_view.dart';
import 'examples/toast_view.dart';
import 'examples/trainer_view.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Features'),
        actions: [
          LzTheme.watch((theme) => IconButton(
              onPressed: () {
                LzTheme.toggle();
              },
              icon: Icon(theme.isDark ? Hi.sun03 : Hi.moon02))),
          ...[Hi.testTube01, Hi.informationCircle].iconButton((i) {
            if (i == 1) {
              context.bottomSheet(const AboutLazyUi());
            } else {
              context.lz.push(const TestView());
            }
          }),
        ],
      ),
      body: ListView(
        children: [
          ...features.generate((e, i) {
            return Column(children: [
              // group label
              LzTheme.watch((theme) => Textr(e.label,
                  padding: Ei.all(20),
                  style: Gfont.green,
                  color: (theme.isDark ? '161616' : 'f5f5f5').hex,
                  width: context.width)),

              // features
              ...e.features.generate((f, j) {
                return Touch(
                  onTap: () => FeatureView.action(context, f.label),
                  padding: Ei.all(20),
                  child: Row(
                    children: [Textr(f.label, icon: f.icon), Icon(Hi.arrowRight01)],
                  ).between,
                );
              }),
            ]).start;
          })
        ],
      ),
    );
  }

  static void action(BuildContext context, String feature) {
    Map<String, Widget> pages = {
      'LzAccordion': const AccordionView(),
      'LzBadge': const BadgeView(),
      'LzButton': const ButtonView(),
      'LzCard': const CardView(),
      'LzDropdown': const DropdownView(),
      'Textr': const TextView(),
      'Iconr': const IconView(),
      'LzForm': const FormView(),
      'LzFormGroup': const FormGroupView(),
      'LzPad': const PadView(),
      'LzPicker': const PickerView(),
      'LzConfirm': const ConfirmView(),
      'Shimmer': const ShimmerView(),
      'LzToast': const ToastView(),
      'LzTheme': const ThemeView(),
      'LzImage': const ImageView(),
      'Refreshtor': const RefreshtorView(),
      'TimerCountDown': const CountdownView(),
      'TextCounter': const TextCountView(),
      'LzListView': const ListViewView(),
      'Trainer': const TrainerView()
    };

    context.lz.push(pages[feature] ?? const TestView());
  }
}
