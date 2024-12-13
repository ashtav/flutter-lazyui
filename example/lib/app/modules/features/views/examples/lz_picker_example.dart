import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class PickerView extends StatelessWidget {
  const PickerView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = 10.generate((i) => Faker.category());
    List<String> words = 10.generate((item) => Faker.words(10));

    final forms =
        LzForm.make(['category', 'content', 'date', 'date_range', 'time']);

    final font = Gfont.style(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker'),
      ),
      body: LzListView(
        gap: 35,
        children: [
          LzFormWrap(
            grouping: true,
            label: Text(
              'Select Option',
              style: font.bold,
            ),
            description:
                'Example of using a LzPicker, we can use picker with search bar, disabled items, etc.',
            children: [
              LzForm.input(
                  hint: 'Show picker',
                  model: forms['category'],
                  onTap: (text) {
                    final disabled = [
                      'Books',
                      'Art',
                      'Sports',
                      'Nature',
                      'Yoga'
                    ];

                    final init = Option(text);

                    LzPicker.option(context,
                        initialValue: init,
                        options: Option.list(categories, disabled: disabled),
                        onSelect: (value) {
                      forms.setValue('category', value.label);
                    },
                        style: const PickerStyle(
                            title: 'Select Option', withSearch: true));
                  }),
              LzForm.input(
                  hint: 'Show picker with long content',
                  model: forms['content'],
                  maxLines: 2,
                  onTap: (text) {
                    final init = Option(text);

                    LzPicker.option(context,
                        initialValue: init,
                        options: Option.list(words),
                        style: PickerStyle(
                            height: context.height / 1.5,
                            title: 'Select Option',
                            description: Faker.words(7),
                            maxLines: 2), onSelect: (value) {
                      forms.setValue('content', value.label);
                    });
                  })
            ],
          ),
          LzFormWrap(
            grouping: true,
            label: Text(
              'Date & Time Picker',
              style: font.bold,
            ),
            description:
                'Example of using a LzPicker in date, time and date-time mode.',
            children: [
              LzForm.input(
                  hint: 'Show date picker',
                  model: forms['date'],
                  style: InputStyle(suffixIcon: Ti.calendarEvent),
                  onTap: (text) {
                    LzPicker.date(context,
                        initDate: text.toDate(),
                        minDate: '2023-12-25'.toDate(),
                        maxDate: '2025-06-15'.toDate(),
                        format: 'd/mmm/y',
                        // style: DatePickerStyle(darkMode: true),
                        withTime: true, onSelect: (value) {
                      forms.setValue('date', value.format('dd-MM-yyyy HH:mm'));
                    });
                  }),
              LzForm.input(
                  hint: 'Show date range picker',
                  model: forms['date_range'],
                  style: InputStyle(suffixIcon: Ti.calendarEvent),
                  onTap: (text) {
                    List<DateTime> initDate =
                        text.split(' - ').map((e) => e.toDate()).toList();

                    LzPicker.dateRange(context,
                        initDate: initDate,
                        minDate: '2024-02-25'.toDate(),
                        maxDate: '2026-10-15'.toDate(),
                        rangeFormat: 'dd / MM / yyyy', onSelect: (value) {
                      forms.setValue('date_range',
                          value.map((e) => e.format('dd/MM/yyyy')).join(' - '));
                    });
                  }),
              LzForm.input(
                  hint: 'Show time picker',
                  model: forms['time'],
                  style: InputStyle(suffixIcon: Ti.clock),
                  onTap: (text) {
                    LzPicker.time(context,
                        initTime: Time.parse(text),
                        minTime: Time(8, 30),
                        maxTime: Time(11, 30), onSelect: (time) {
                      forms.setValue('time', time.value);
                    });
                  })
            ],
          ),
          Text('Picker Widget', style: font.bold),
          LzDatePicker.widget(
              format: 'm/y',
              maxDate: DateTime.now().add(120.d),
              minDate: DateTime.now().add(3.d),
              onChange: (value) {
                logg(value);
              })
        ],
      ),
    );
  }
}
