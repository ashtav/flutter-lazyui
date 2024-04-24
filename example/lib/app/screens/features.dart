import 'package:example/app/screens/forms.dart';
import 'package:example/app/screens/refreshtor.dart';
import 'package:example/app/screens/widgets/accordion.dart';
import 'package:example/app/screens/widgets/bagde_n_card.dart';
import 'package:example/app/screens/widgets/customs.dart';
import 'package:example/app/screens/widgets/skeleton.dart';
import 'package:example/app/screens/widgets/test_view.dart';
import 'package:example/app/screens/widgets/toast.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/feature.dart';
import 'button.dart';
import 'confirm.dart';
import 'dropdown.dart';
import 'picker.dart';
import 'trainer.dart';
import 'widgets/image.dart';
import 'widgets/listview.dart';

class FeaturesView extends StatelessWidget {
  const FeaturesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> features = [
      {
        'title': 'Tools',
        'description':
            'A collection of utilities for efficient form management and streamlined data input, ensuring a smooth user experience.',
        'features': [
          Feature(
              'LzForm',
              'Customizable form with validation, error handling and ease full control of your form.',
              Ti.forms),
          Feature(
              'LzPicker',
              'Date picker, time picker and show a list of options in a bottom sheet, with search, disabled items, etc.',
              Ti.alignBoxCenterBottom),
          // 'App Intro',
          // 'Widgets'
        ]
      },
      {
        'title': 'Interaction',
        'description':
            'Dynamic elements designed to facilitate user actions, confirmations, and navigation, enhancing overall interactivity.',
        'features': [
          Feature(
              'LzButton',
              'Customizable button with icon, type, loading, disabled, etc.',
              Ti.click),
          Feature(
              'LzDrop',
              'Show dropdown options in any position, with icons, separators, etc.',
              Ti.dragDrop),
          Feature(
              'LzPad',
              'Show an otp or pin input with a custom message, duration, input, etc.',
              Ti.number),
          Feature(
              'LzConfirm',
              'Show a confirmation dialog with a custom message, title, etc.',
              Ti.questionMark),
          Feature(
              'Refreshtor',
              'Show a pull to refresh indicator with a custom color, size, etc.',
              Ti.refresh),
          Feature(
              'Trainer',
              'Show guide to use your app with a custom message, title, etc.',
              Ti.books),
        ]
      },
      {
        'title': 'Widgets',
        'description':
            'A variety of visual components to display content, notifications, placeholders, and collapsible sections for a polished interface.',
        'features': [
          Feature('LzToast',
              'Show a toast message with a custom icon, color, etc.', Ti.bell),
          Feature(
              'LzImage',
              'Display image in any format such as network, asset, file, etc.',
              Ti.photo),
          Feature(
              'Skeleton',
              'Show a skeleton loader with a custom color, animation, etc.',
              Ti.loader),
          Feature(
              'LzAccordion',
              'Expandable widget with a custom header, body, etc.',
              Ti.layoutNavbarExpand),
          Feature(
              'LzBadge & LzCard',
              'Show a badge or card with a custom color, size, etc.',
              Ti.creditCard),
          Feature(
              'LzListView',
              'Scrollable lists with various features such as scroll limits, custom scroll controllers, and automatic caching.',
              Ti.list),
        ]
      },
      {
        'title': 'Custom Widgets',
        'description':
            'A collection of custom widgets that can be used to build your own custom UI components.',
        'features': [
          Feature(
              'Custom Widgets',
              'List of custom widgets that can be used to build your own custom UI components.',
              Ti.category),
        ]
      },
      {
        'title': 'Utilities',
        'description':
            'A collection of utilities for efficient form management and streamlined data input, ensuring a smooth user experience.',
        'features': [
          Feature(
              'Custom Utilities',
              'List of custom utilities that can be used to build your own custom UI components.',
              Ti.tools),
        ]
      },
    ];

    for (var featureMap in features) {
      if (featureMap['features'] != null) {}
      (featureMap['features'] as List<Feature>)
          .sort((a, b) => a.title.compareTo(b.title));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy UI'),
      ),
      body: LzListView(children: [
        Column(
          children: features.generate((item, i) {
            List<Feature> features = item['features'] ?? [];
            String title = item['title'];
            String description = item['description'];

            return Column(
              children: [
                Container(
                  margin: Ei.only(t: i == 0 ? 0 : 35, b: 25),
                  child: Column(
                    children: [
                      Textr(title, style: Gfont.bold, margin: Ei.only(b: 5)),
                      Text(description, style: Gfont.muted)
                    ],
                  ).start,
                ),
                Column(children: features.generate((feature, i) {
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
                            Text(feature.description, style: Gfont.muted)
                                .margin(t: 5),
                          ],
                        ).start.lz.flexible(),
                        Iconr(Ti.chevronRight,
                            color: Colors.black45, margin: Ei.only(l: 25))
                      ],
                    ),
                  );
                }))
                    .min
                    .lz
                    .clip(all: 10)
                    .lz
                    .border(Br.all(), radius: Br.radius(10))
              ],
            ).start;
          }),
        )
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
      'LzToast': const ToastView(),
      'LzImage': const ImageView(),
      'LzConfirm': const ConfirmView(),
      'Skeleton': const SkeletonView(),
      'LzAccordion': const AccordionView(),
      'Refreshtor': const RefreshtorView(),
      'Trainer': const TrainerView(),
      'Custom Widgets': const CustomWidgetView(),
      'LzBadge & LzCard': const BadgeNCardView(),
      'LzListView': const LzListViewExample(),
    };

    if (label == 'LzPad') {
      LzPicker.picker(context, options: ['OTP Input', 'Passcode Input'],
          onSelect: (value) {
        if (value == 'OTP Input') {
          LzPad.show(context,
              expired: 60.s,
              message:
                  'OTP code sent to +628100000, please enter the code below to reset your password.',
              onCompleted: (otp) async {
            otp.pause();
            LzToast.overlay('Verifying OTP... ${otp.value}', duration: 2.s,
                then: () {
              LzToast.success('Done! You are now logged in.',
                  placement: ToastPlacement.center);
              context.lz.pop();
            });
          });
        } else {
          LzPad.show(context,
              header: const LzPadHeader(
                  icon: Ti.lock,
                  title: 'Enter Passcode',
                  message:
                      'Please enter your passcode to continue payment process.'),
              footer: Textr('Lupa PIN?',
                      style: Gfont.bold.green, padding: Ei.all(20))
                  .onTap(() {
                context.lz.pop();
                // open forgot passcode screen
              }),
              type: PadType.passcode, onCompleted: (state) async {
            state.setMessage('Lorem ipsum dolor seet amet');

            // LzToast.overlay('Processing...', duration: 2.s, then: () {
            //   LzToast.success('Done! Your payment is successful.',
            //       placement: ToastPlacement.center);
            //   context.lz.pop();
            // });
          });
        }
      });

      return;
    }

    context.lz.push(routes[label] ?? const TestView());
  }
}

class LzPicker extends StatelessWidget {
  final List<String> options;
  final List<int> separator;
  const LzPicker(
      {super.key, this.options = const [], this.separator = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: options.generate((item, i) {
            return InkTouch(
              onTap: () => context.lz.pop(item),
              padding: Ei.sym(v: 15, h: 20),
              border: Br.only(['t'],
                  except: i == 0, width: separator.contains(i) ? 4 : .5),
              color: Colors.white,
              child: Row(
                children: [
                  Text(item),
                ],
              ).center,
            );
          }),
        ).min.lz.clip(all: LazyUi.radius),
        InkTouch(
          onTap: () => context.lz.pop(),
          padding: Ei.sym(v: 15, h: 20),
          radius: Br.radius(LazyUi.radius),
          margin: Ei.only(t: 10),
          color: Colors.white,
          child: Row(
            children: [Text('Cancel', style: Gfont.bold.red)],
          ).center,
        )
      ],
    ).min.margin(all: 20);
  }

  static picker(BuildContext context,
      {List<String> options = const [],
      List<int> separator = const [],
      Function(String)? onSelect}) {
    context
        .bottomSheet(LzPicker(options: options, separator: separator),
            draggable: true, safeArea: false)
        .then((value) =>
            value == null ? () {} : onSelect?.call(value.toString()));
  }
}
