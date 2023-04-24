import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'page.dart';

class FeaturesView extends StatelessWidget {
  const FeaturesView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> features = [
      'Date & Time Picker',
      'LzForm',
      'App Trainer',
      'App Intro Example',
      'LzDropdown',
      'Expandable List',
      'LzOption, Select Option',
      'Animation',
      'No Data',
      'Toast',
      'Skeleton',
      'LzPopover',
      'LzButton',
      'Profile Design Example',
      'Refreshtor',
      'Popup Dialog',
      'Login Example',
      'Widgets'
    ];

    features.sort();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('LazyUi Examples'),
        ),
        body: LzListView(
          padding: Ei.zero,
          children: [
            Col(
              children: List.generate(features.length, (i) {
                String label = features[i];

                return InkW(
                  onTap: () => Actions.execute(context, label),
                  padding: Ei.all(20),
                  color: Colors.white,
                  border: Br.only(['t'], except: i == 0),
                  child: Row(
                    mainAxisAlignment: Maa.spaceBetween,
                    children: [
                      Text(label),
                      const Icon(
                        La.angleRight,
                        color: Colors.black54,
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ));
  }
}

class Actions {
  static execute(BuildContext context, String label) {
    try {
      switch (label) {
        case 'Date & Time Picker':
          context.push(const DateTimePicker());
          break;

        case 'App Intro Example':
          context.push(const AppIntro());
          break;

        case 'App Trainer':
          context.push(const AppTrainerView());
          break;

        case 'LzForm':
          context.push(const FormView());
          break;

        case 'No Data':
          context.push(const NoDataView());
          break;

        case 'LzDropdown':
          context.push(const LzDropdownView());
          break;

        case 'Expandable List':
          context.push(const ExpandableListView());
          break;

        case 'Animation':
          context.push(const AnimationView());
          break;

        case 'LzOption, Select Option':
          context.push(const LzOptionView());
          break;

        case 'Toast':
          context.push(const ToastView());
          break;

        case 'Skeleton':
          context.push(const SkeletonView());
          break;

        case 'LzPopover':
          context.push(const PopoverView());
          break;

        case 'LzButton':
          context.push(const ButtonView());
          break;

        case 'Profile Design Example':
          context.push(const ProfileView());
          break;

        case 'Refreshtor':
          context.push(const RefreshtorView());
          break;

        case 'Popup Dialog':
          context.push(const PopupDialogView());
          break;

        case 'Login Example':
          context.push(const LoginExampleView());
          break;

        case 'Widgets':
          context.push(const WidgetsView());
          break;
        default:
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }
}
