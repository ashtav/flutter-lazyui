import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class PickerView extends StatelessWidget {
  const PickerView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = 10.generate((i) => Faker.category());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker'),
      ),
      body: LzListView(
        children: [
          LzFormTheme(
            grouping: true,
            description: 'Example of using a LzPicker',
            children: [
              LzForm.input(
                  hint: 'Tap to show picker',
                  onTap: (text) {
                    // LzPicker.option(context, options: categories.option());
                    SelectPicker.show(context,
                        options: categories.option(disabled: ['Yoga', 'Finance', 'Sports', 'Art']));
                  }),
              LzForm.input(hint: 'Tap to show full screen picker', onTap: (text) {})
            ],
          ),
          // LzForm.input(
          //     label: 'Full Screen Select Option',
          //     hint: 'Tap to show option',
          //     onTap: (_) {
          //       // SelectPicker.show(context,
          //       //     fullScreen: true,
          //       //     initialValue: const Option(option: 'Meeting', value: 3),
          //       //     options: [
          //       //       'Seminar',
          //       //       'Workshop',
          //       //       'Training',
          //       //       'Meeting',
          //       //       'Playing'
          //       //     ].options(values: [0, 1, 2, 3, 4]), onSelect: (o) {
          //       //   logg(o.toMap());
          //       // });
          //     }),
          // LzForm.input(
          //     label: 'Long Content Select Option',
          //     hint: 'Tap to show option',
          //     onTap: (_) {
          //       // SelectPicker.show(context,
          //       //     maxLines: 2,
          //       //     withSearch: true,
          //       //     height: context.height / 2,
          //       //     options: 10.generate((item) => Faker.address()).options(),
          //       //     onSelect: (o) {
          //       //   logg(o.toMap());
          //       // });
          //     }),
        ],
      ),
    );
  }
}
