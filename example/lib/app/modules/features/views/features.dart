import 'package:example/app/data/feature.dart';
import 'package:example/app/modules/settings/views/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'examples/button.dart';
import 'examples/confirm.dart';
import 'examples/dropdown.dart';
import 'examples/forms.dart';
import 'examples/picker.dart';
import 'examples/refreshtor.dart';
import 'examples/trainer.dart';
import 'examples/widgets/accordion.dart';
import 'examples/widgets/bagde_n_card.dart';
import 'examples/widgets/customs.dart';
import 'examples/widgets/image.dart';
import 'examples/widgets/listview.dart';
import 'examples/widgets/skeleton.dart';
import 'examples/widgets/test_view.dart';
import 'examples/widgets/toast.dart';

bool isDarkMode = false;

class FeatureView extends StatelessWidget {
  const FeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazy UI'),
        actions: [
          IconButton(
            onPressed: () => context.lz.push(const SettingView()),
            icon: const Icon(Ti.settings),
          )
        ],
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
                      Textr(title, style: font.bold, margin: Ei.only(b: 5)),
                      Text(description, style: font.muted)
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
                              style: font.bold,
                              icon: feature.icon,
                            ),
                            Text(feature.description, style: font.muted)
                                .margin(t: 5),
                          ],
                        ).start.lz.flexible(),
                        Iconr(Ti.chevronRight,
                            color: Colors.black45.adaptWithTheme,
                            margin: Ei.only(l: 25))
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

    final font = Gfont.style(context);
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
                      style: font.bold.green, padding: Ei.all(20))
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
    } else if (label == 'LzOption') {
      LzOption.show(context, title: 'Select Menu', options: [
        OptionMenu(
            label: 'Profile',
            widget: Textr('Your profile!', padding: Ei.all(35)),
            icon: Ti.user),
        OptionMenu(
            label: 'Birth Date',
            widget: LzDatePicker.widget(format: 'd/mmm/y'),
            icon: Ti.calendarEvent),
        OptionMenu(
            label: 'News - Long Content',
            widget: Column(
              children: [
                Textr(
                  Faker.words(25, 10),
                  padding: Ei.all(20),
                )
              ],
            ),
            icon: Ti.news),
        OptionMenu(
            label: 'No Widget',
            icon: Ti.gift,
            onTap: () {
              context.lz.pop();
              LzToast.show('Thank you!', placement: ToastPlacement.center);
            }),
      ]);

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
    final font = Gfont.style(context);
    final theme = LzTheme.get(context);

    return Column(
      children: [
        Column(
          children: options.generate((item, i) {
            return InkTouch(
              onTap: () => context.lz.pop(item),
              padding: Ei.sym(v: 15, h: 20),
              border: Br.only(['t'],
                  except: i == 0, width: separator.contains(i) ? 4 : .5),
              color: theme.background,
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
          color: theme.background,
          child: Row(
            children: [Text('Cancel', style: font.bold.red)],
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
