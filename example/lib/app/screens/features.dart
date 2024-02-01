import 'package:example/app/screens/forms.dart';
import 'package:example/app/screens/toast.dart';
import 'package:example/app/screens/widgets/custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/feature.dart';
import 'button.dart';
import 'confirm.dart';
import 'dropdown.dart';
import 'picker.dart';
import 'widgets/lz_image.dart';

class FeaturesView extends StatelessWidget {
  const FeaturesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> features = [
      {
        'title': 'Tools',
        'features': [
          Feature('LzForm', 'Customizable form with validation, error handling and ease full control of your form.',
              Ti.forms),
          Feature(
              'LzPicker',
              'Date picker, time picker and show a list of options in a bottom sheet, with search, disabled items, etc.',
              Ti.alignBoxCenterBottom),
          // 'App Intro',
          // 'App Trainer',
          // 'Accordion',
          // 'Confirm',
          // 'Refreshtor',
          // 'Skeleton',
          // 'Toast',
          // 'Widgets'
        ]
      },
      {
        'title': 'Interaction',
        'features': [
          Feature('LzButton', 'Customizable button with icon, type, loading, disabled, etc.', Ti.click),
          Feature('LzDrop', 'Show dropdown options in any position, with icons, separators, etc.', Ti.dragDrop),
          Feature('LzOtp', 'Show a otp input with a custom message, input, etc.', Ti.number),
          Feature('LzConfirm', 'Show a confirmation dialog with a custom message, title, etc.', Ti.questionMark),
        ]
      },
      {
        'title': 'Widgets',
        'features': [
          Feature('LzToast', 'Show a toast message with a custom icon, color, etc.', Ti.bell),
          Feature('LzImage', 'Display image in any format such as network, asset, file, etc.', Ti.photo),
        ]
      },
    ];

    for (var featureMap in features) {
      (featureMap['features'] as List<Feature>).sort((a, b) => a.title.compareTo(b.title));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy UI'),
      ),
      body: LzListView(children: [
        Column(
          children: features.generate((item, i) {
            List<Feature> features = item['features'];
            String title = item['title'];

            return Column(
              children: [
                Container(
                  margin: Ei.only(t: i == 0 ? 0 : 35, b: 25),
                  child: Column(
                    children: [
                      Textr(title, style: Gfont.bold, margin: Ei.only(b: 5)),
                      Text(Faker.words(12), style: Gfont.muted)
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
                            Text(feature.description, style: Gfont.muted).margin(t: 5),
                          ],
                        ).start.lz.flexible(),
                        Iconr(Ti.chevronRight, color: Colors.black45, margin: Ei.only(l: 25))
                      ],
                    ),
                  );
                })).min.lz.clip(all: 10)
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
    };

    if (label == 'LzOtp') {
      LzOtp.show(context,
          expired: 60.s,
          type: OtpType.bottomLine,
          subtitle: 'OTP code sent to +628100000, please enter the code below to reset your password.',
          onCompleted: (otp) {
        String value = otp.value;
        logg('Otp value: $value');
      });

      return;
    }

    context.lzPush(routes[label] ?? const CustomWidgetView());
  }
}
