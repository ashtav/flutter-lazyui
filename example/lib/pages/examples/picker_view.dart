import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class PickerView extends StatelessWidget {
  const PickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker'),
        actions: [LzThemeAction()],
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'LzPicker is a flexible tool for selecting dates, times, date ranges, or options, offering a seamless and user-friendly interface for various input needs.',
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              LzButton(
                text: 'Date Picker',
                icon: Hi.calendar01,
                color: Colors.blue,
                onTap: () {
                  LzPicker.date(context,
                      minDate: now.subtract(30.y),
                      withTime: true,
                      showWeekday: true, onSelect: (value) {
                    logg(value);
                  });
                },
              ),
              LzButton(
                text: 'Time Picker',
                icon: Hi.clock01,
                color: context.isDarkMode ? '161616'.hex : Colors.white,
                border: Br.all(color: Colors.black45.themeify),
                onTap: () {
                  LzPicker.time(context, onSelect: (value) {
                    logg(value);
                  });
                },
              ),
              LzButton(
                text: 'Date Range Picker',
                icon: Hi.calendarCheckOut01,
                border: Br.all(color: Colors.black45),
                onTap: () {
                  LzPicker.dateRange(context, withTime: true, showWeekday: true,
                      onSelect: (value) {
                    logg(value);
                  });
                },
              ),
              LzButton(
                text: 'Option Picker',
                icon: Hi.searchList01,
                border: Br.all(color: Colors.black45),
                onTap: () {
                  List<String> options =
                      [1, 10].iterate().generate((_, __) => Faker.name());
                  final disabled =
                      [0, 9].randomInRange(5).generate((i, _) => options[i]);

                  LzPicker.option(context,
                      options: options.option(disabled: disabled),
                      onSelect: (value) {
                    logg(value);
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
