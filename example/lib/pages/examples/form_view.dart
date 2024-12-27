import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';

class Notifier extends ChangeNotifier {
  final forms = LzForm.make(['name', 'birthdate', 'password', 'gender', 'hobby', 'ticket']);
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
            /// An example of using a simple input field for a [label] and [hint].
            /// The [model] binds the value, allowing you to manage and retrieve the input.
            LzForm.input(label: 'Full Name', hint: 'Type your name', model: forms.key('name')),

            /// An example of using an input field with a [suffixIcon] for the [label] and [hint].
            /// The [onTap] handler is used to open a date picker, updating the [model] with the selected date.
            LzForm.input(
                label: 'Birthdate',
                hint: 'Enter your birthdate',
                suffixIcon: Hi.calendar01,
                enabled: true,
                model: forms.key('birthdate'),
                onTap: () {
                  LzPicker.date(context, initDate: forms.get('birthdate').toString().toDate(), onSelect: (value) {
                    forms.set('birthdate', value.format());
                  });
                }),

            /// An example of using a password input field with a [label] and [hint].
            /// The [model] binds the input value, and the [suffix] uses the [Obsecure] widget to toggle password visibility with customizable icons.
            LzForm.input(
              label: 'Password',
              hint: 'Type your password',
              model: forms.key('password'),
              suffix: Obsecure(
                hide: Hi.lockPassword,
                show: Hi.squareUnlock01,
              ),
            ),

            /// An example of using a radio button group with a [label] and multiple [options].
            /// The [model] binds the selected value, allowing you to store and manage the choice.
            LzForm.radio(label: 'Gender', options: ['Male', 'Female'], model: forms.key('gender')),

            /// An example of using a checkbox field with multiple [options] for the [label].
            /// The [model] binds the selected values, allowing you to manage and retrieve the user's choices.
            LzForm.checkbox(
                label: 'Hobby',
                options: ['Football', 'Cooking', 'Coding', 'Swimming', 'Reading', 'Writing'],
                model: forms.key('hobby')),

            /// An example of using a number input field with buttons for incrementing and decrementing the value.
            /// The [label] provides a description for the field, and [model] manages the input value.
            LzForm.number(label: 'Ticket', hint: 'Type number of ticket', model: forms.key('ticket')),
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
