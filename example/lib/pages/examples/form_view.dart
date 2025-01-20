import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Notifier extends ChangeNotifier {
  final forms = LzForm.make([
    'name',
    'phone',
    'birthdate',
    'password',
    'gender',
    'hobby',
    'ticket',
    'province',
    'city',
    'height',
    'terms'
  ]);
}

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();
    final forms = notifier.forms;

    // Example data of provinces and cities
    final provinces = [
      {'id': 1, 'name': 'Bali'},
      {'id': 2, 'name': 'Jakarta'}
    ];

    final cities = [
      // Cities in Bali
      {'id': 1, 'province_id': 1, 'name': 'Denpasar'},
      {'id': 2, 'province_id': 1, 'name': 'Ubud'},
      {'id': 3, 'province_id': 1, 'name': 'Kuta'},
      {'id': 4, 'province_id': 1, 'name': 'Singaraja'},
      {'id': 5, 'province_id': 1, 'name': 'Canggu'},

      // Cities in Jakarta
      {'id': 6, 'province_id': 2, 'name': 'Central Jakarta'},
      {'id': 7, 'province_id': 2, 'name': 'West Jakarta'},
      {'id': 8, 'province_id': 2, 'name': 'South Jakarta'},
      {'id': 9, 'province_id': 2, 'name': 'East Jakarta'},
      {'id': 10, 'province_id': 2, 'name': 'North Jakarta'}
    ];

    // fill the forms
    forms.fill({
      // 'name': 'John Doe',
      // 'phone': 812300000,
      'birthdate': '2000-10-10',
      'password': 'secret',
      // 'gender': 'Female',
      'hobby': 'Football, Cooking, Swimming',
      // 'ticket': 5,
      'height': 150,
    });

    // forms.set('province', Option('Jakarta', value: 2));
    forms.enable('province', true);

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
          actions: [LzThemeAction()],
        ),
        body: LzListView(
          padding: Ei.only(b: 100, others: 20),
          autoCache: true,
          gap: 25,
          children: [
            /// An example of using a simple input field for a [label] and [hint].
            /// The [model] binds the value, allowing you to manage and retrieve the input.
            LzForm.input(
                label: 'Full Name',
                hint: 'Type your name',
                model: forms.key('name')),

            /// An example of using prefix for input
            LzForm.input(
              label: 'Phone Number',
              hint: 'Type your phone number',
              model: forms.key('phone'),
              keyboard: Tit.number,
              prefix: Text('+62'),
            ),

            /// An example of using an input field with a [suffixIcon] for the [label] and [hint].
            /// The [onTap] handler is used to open a date picker, updating the [model] with the selected date.
            LzForm.input(
                label: 'Birthdate',
                hint: 'Enter your birthdate',
                suffixIcon: Hi.calendar01,
                enabled: true,
                model: forms.key('birthdate'),
                onTap: () {
                  LzPicker.date(context,
                      initDate: forms.get('birthdate').toString().toDate(),
                      minDate: now.subtract(50.y),
                      maxDate: now, onSelect: (value) {
                    forms.set('birthdate', value.format());
                  });
                }),

            /// An example of using a password input field with a [label] and [hint].
            /// The [model] binds the input value, and the [suffix] uses the [Obsecure] widget to toggle password visibility with customizable icons.
            LzForm.input(
              label: 'Password',
              hint: 'Type your password',
              model: forms.key('password'),
              suffix: Obscure(
                hide: Hi.lockPassword,
                show: Hi.squareUnlock01,
              ),
            ),

            /// An example of using a radio button group with a [label] and multiple [options].
            /// The [model] binds the selected value, allowing you to store and manage the choice.
            LzForm.radio(
                label: 'Gender',
                options: ['Male', 'Female'],
                model: forms.key('gender')),

            /// An example of using a checkbox field with multiple [options] for the [label].
            /// The [model] binds the selected values, allowing you to manage and retrieve the user's choices.
            LzForm.checkbox(
                label: 'Hobby',
                options: [
                  'Football',
                  'Cooking',
                  'Coding',
                  'Swimming',
                  'Reading',
                  'Writing'
                ],
                model: forms.key('hobby')),

            /// An example of using a number input field with buttons for incrementing and decrementing the value.
            /// The [label] provides a description for the field, and [model] manages the input value.
            Column(
              children: [
                LzForm.number(
                    label: 'Ticket',
                    hint: 'Type number of ticket',
                    model: forms.key('ticket'),
                    onChange: (value) {
                      forms.enable('province', value > 2);
                    }),
                Text('Add at least 3 tickets to enable province.',
                    style: Gfont.fs14.muted)
              ],
            ).start.gap(5),

            /// An example of using a dropdown/select input field.
            /// The [label] describes the purpose of the field, while the [hint] guides the user to select an option.
            LzForm.select(
                label: 'Province',
                hint: 'Select province',
                options: provinces.extract('name'),
                values: provinces.extract('id'),
                model: forms.key('province'),
                enabled: false,
                onChange: (value) {
                  /// Sets the 'city' field based on the selected 'province'.
                  /// Filters the [cities] by [province_id] matching the selected province from [forms.extra('province')].
                  /// Uses 'name' for the display value and 'id' as the underlying value for the city options.
                  forms.set(
                      'city',
                      OptionSet(cities, 'name', 'id',
                          {'province_id': forms.extra('province')}));
                }),

            LzForm.select(
                label: 'City', hint: 'Select city', model: forms.key('city')),

            /// An example of using a slider input with a [label] to specify the purpose of the slider.
            /// The [initValue] sets the initial value of the slider, while [max] determines the upper limit.
            /// The [model] binds the slider value to a key, allowing for data binding and easy management.
            LzForm.slider(
                label: 'Height',
                initValue: 165,
                max: 250,
                model: forms.key('height')),

            /// An example of using a switch with two states, [Agree] and [Disagree].
            /// The [label] specifies the text for both states, separated by a "|".
            /// The [onChange] callback is triggered whenever the switch state changes, passing the new [value].
            LzForm.switches(label: 'Agree|Disagree', onChange: (value) {})
          ],
        ),
        bottomNavigationBar: Padding(
          padding: Ei.only(h: 20, b: 20),
          child: LzButton(
            text: 'Submit',
            color: '212121'.hex,
            onTap: () {
              // logg(forms.extra('province'));
              // logg(forms.extra('city'));

              // do validation
              final form = forms.validate(required: [
                '*',
                'terms'
              ], min: [
                'name:3',
                'phone:5'
              ], max: [
                'phone:10'
              ], message: {
                'name': 'Name\'s missing? C\'mon, give me something!',
                'phone': 'No phone number? Are you for real?',
                'phone:min': 'Bruh, 5 digits, not a joke!',
                'phone:max':
                    'That\'s a phone number, not a book. No more than 10!'
              });

              if (form.ok) {
                logg(form.value);
              }
            },
          ).lz.shadowed(context),
        ),
      ),
    );
  }
}
