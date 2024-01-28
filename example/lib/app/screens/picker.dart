import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class PickerView extends StatelessWidget {
  const PickerView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categories = 10.generate((i) => Faker.category());
    final forms = LzForm.make(['category']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker'),
      ),
      body: LzListView(
        children: [
          LzFormTheme(
            grouping: true,
            label: Text(
              'Select Option',
              style: Gfont.bold,
            ),
            description: 'Example of using a LzPicker, we can use picker with search bar, disabled items, etc.',
            children: [
              LzForm.input(
                  hint: 'Show picker',
                  model: forms['category'],
                  onTap: (text) {
                    final disabled = ['Books', 'Art', 'Sports', 'Nature', 'Yoga'];
                    LzPicker.option(context, options: Option.list(categories, disabled: disabled), onSelect: (value) {
                      forms.setValue('category', value.label);
                    }, style: const PickerStyle(withSearch: true));
                  }),
              LzForm.input(
                  hint: 'Show picker with long content',
                  onTap: (text) {
                    List<String> words = 10.generate((item) => Faker.words(10));
                    LzPicker.option(context, options: Option.list(words), style: const PickerStyle(maxLines: 2));
                  })
            ],
          ),
          LzFormTheme(
            grouping: true,
            label: Text(
              'Date Picker',
              style: Gfont.bold,
            ),
            description: 'Example of using a LzPicker in date, time and date time mode.',
            children: [
              LzForm.input(
                  hint: 'Show date picker',
                  onTap: (text) {
                    LzPicker.date(context);
                  }),
              LzForm.input(hint: 'Show time picker', onTap: (text) {})
            ],
          ),
        ],
      ),
    );
  }
}
