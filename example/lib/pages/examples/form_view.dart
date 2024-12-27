import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';

class Notifier extends ChangeNotifier {
  final forms = LzForm.make(['name', 'birthdate']);
}

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();
    final forms = notifier.forms;

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
          actions: [DarkModeWidget.icon()],
        ),
        body: LzListView(
          padding: Ei.all(20),
          gap: 25,
          children: [
            LzForm.input(label: 'Full Name', hint: 'Type your name', model: forms.key('name')),
            LzForm.input(
                label: 'Birthdate',
                hint: 'Enter your birthdate',
                suffix: Hi.calendar01,
                enabled: true,
                model: forms.key('birthdate'),
                onTap: () {
                  LzPicker.date(context, initDate: forms.get('birthdate').toString().toDate(), onSelect: (value) {
                    forms.set('birthdate', value.format());
                  });
                }),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: LzButton(
            text: 'Submit',
            color: '212121'.hex,
            onTap: () {
              logg(forms.get('name'));
            },
          ),
        ),
      ),
    );
  }
}
