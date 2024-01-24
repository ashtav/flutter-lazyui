import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormController {
  final forms = LxForm.make(['name', 'gender', 'birthdate', 'hobby', 'province', 'city', 'email', 'address', 'phone']);
}

class Forms2 extends StatelessWidget {
  const Forms2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FormController();
    final forms = controller.forms;

    // Bindings.onRendered(() {
    //   forms.fill({'name': 'John Doe'});
    // });

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form X'),
        ),
        body: LzListView(
          children: [
            LxFormTheme(
              grouping: true,
              label: Text('Name & Gender', style: Gfont.bold),
              description: 'Please input your full name and gender.',
              style: FormStyle(radio: RadioStyle(activeColor: Colors.orange)),
              children: [
                LxForm.input(
                    label: 'Full Name',
                    hint: 'What is your name?',
                    model: forms['name'],
                    onChange: (value) {
                      // forms.enable('email', value.length > 3).setText(['email', 'phone'], value);
                      // forms.setText('hobby', 'Writing');
                    },
                    indicator: true),
                LxForm.radio(
                  label: 'Select Gender',
                  options: ['Male', 'Female'],
                  model: forms['gender'],
                  onChange: (value) {
                    forms.enable('email', value.label == 'Male');
                    forms.setValue('hobby', ['Coding', 'Reading']);
                  },
                ),
              ],
            ),

            LxFormTheme(grouping: true, children: [
              LxForm.input(
                hint: 'Please input your date of birth',
                model: forms['birthdate'],
                style: FormStyle(suffixIcon: Ti.calendarEvent),
                onTap: (control) {
                  LzPicker.datePicker(context, initialDate: control.text.toDate(), onSelect: (value) {
                    control.text = value.format('dd/MM/yyyy');
                  });
                },
              ),
              LxForm.checkbox(
                  options: ['Football', 'Cooking', 'Coding', 'Swimming', 'Reading', 'Writing'],
                  disabled: [0, 1],
                  model: forms['hobby']),
            ]),

            LxForm.input(
                label: 'Email Address',
                hint: 'Input your email address',
                style: FormStyle(radius: 8, borderColor: Colors.black38),
                type: FormType.grouped,
                model: forms['email'],
                disabled: true,
                indicator: true),

            LxForm.input(
                label: 'Underlined',
                hint: 'This is underlined input',
                style: FormStyle(radius: 8, borderColor: Colors.black38),
                type: FormType.underlined,
                model: forms['address'],
                indicator: true),

            LxForm.input(
                label: 'Phone Number',
                hint: 'Input your phone number',
                style: FormStyle(radius: 8, borderColor: Colors.orange, textColor: Colors.orange),
                type: FormType.topInner,
                model: forms['phone'],
                keyboard: Tit.phone,
                maxLength: 15,
                indicator: true),

            LxForm.input(
                label: 'Birthdate',
                hint: 'Input your birthdate',
                style: FormStyle(
                  radius: 8,
                  borderColor: Colors.black38,
                  suffixIcon: Ti.calendarEvent,
                ),
                type: FormType.topInner,
                onTap: (control) {
                  LzPicker.datePicker(context).then((value) {
                    control.text = value.format();
                  });
                }),

            // grouping

            LxFormTheme(
              type: FormType.topInner,
              grouping: true,
              style: FormStyle(
                borderColor: Colors.black38,
              ),
              label: Text('Username & Password', style: Gfont.bold),
              description: Faker.words(15),
              children: [
                LxForm.input(
                  // label: 'Username',
                  hint: 'Enter your username',
                ),
                LxForm.input(
                    // label: 'Password',
                    hint: 'Enter your password',
                    obsecureToggle: true,
                    style: FormStyle(
                      suffixIcon: Ti.lock,
                    )),
              ],
            )
          ],
        ),
        bottomNavigationBar: LzButton(
            text: 'Submit',
            onTap: (_) {
              final form = forms.validate(
                  required: ['*'],
                  alert: FormAlert.text,
                  messages: FormMessage(required: {
                    'name': 'I am sory, we need to know your name, so please provide your valid information.'
                  }));
              logg(form.value);
            }).theme1(),
      ),
    );
  }
}
