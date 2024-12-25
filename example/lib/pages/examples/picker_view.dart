import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';

class PickerView extends StatelessWidget {
  const PickerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker'),
        actions: [DarkModeWidget.icon()],
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          Wrap(
            spacing: 15,
            children: [
              LzButton(
                text: 'Date Picker',
                color: Colors.blue,
                onTap: () {
                  LzPicker.date(context, minDate: now, maxDate: now.add(1.y), withTime: true, onSelect: (value) {
                    logg(value);
                  });
                },
              ),
              LzButton(
                text: 'Time Picker',
                border: Br.all(color: Colors.black45),
                onTap: () {
                  LzPicker.time(context, onSelect: (value) {
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
