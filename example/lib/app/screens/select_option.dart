import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class SelectOptionView extends StatelessWidget {
  const SelectOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Option'),
      ),
      body: LzFormList(
        style: const LzFormStyle(type: FormType.topAligned),
        children: [
          LzForm.input(
              label: 'Full Screen Select Option',
              hint: 'Tap to show option',
              onTap: (_) {
                SelectPicker.show(context,
                    fullScreen: true,
                    initialValue: const Option(option: 'Meeting', value: 3),
                    options: [
                      'Seminar',
                      'Workshop',
                      'Training',
                      'Meeting',
                      'Playing'
                    ].options(values: [0, 1, 2, 3, 4]), onSelect: (o) {
                  logg(o.toMap());
                });
              }),
          LzForm.input(
              label: 'Long Content Select Option',
              hint: 'Tap to show option',
              onTap: (_) {
                SelectPicker.show(context,
                    maxLines: 2,
                    withSearch: true,
                    height: context.height / 2,
                    options: 10.generate((item) => Faker.address()).options(),
                    onSelect: (o) {
                  logg(o.toMap());
                });
              }),
        ],
      ),
    );
  }
}
