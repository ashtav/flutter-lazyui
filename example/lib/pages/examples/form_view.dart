import 'package:example/pages/widgets/example_label_widget.dart';
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
            LzTextField(
              hint: 'Enter your name',
            ),
            LzTextField(
              hint: 'Enter your address',
              prefixIcon: Icon(Hi.mapsLocation01),
            ),
            ExampleLabel(),
            LzForm.input(label: 'Full Name', hint: 'Type your name', model: forms['name']), // forms.get('name')
            LzForm.input(
                label: 'Birthdate',
                hint: 'Enter your birthdate',
                suffix: Hi.calendar01,
                enabled: true,
                onTap: () {
                  logg('it works!');
                }),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: LzButton(
            text: 'Submit',
            color: '212121'.hex,
            onTap: () {
              logg(forms.value);
            },
          ),
        ),
      ),
    );
  }
}
