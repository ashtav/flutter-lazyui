import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormController {
  final forms = LxForm.make(['name', 'email', 'address', 'phone']);
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form X'),
      ),
      body: Wrapper(
        child: LzListView(
          children: [
            LxForm.input(
                label: 'Full Name',
                hint: 'What is your name?',
                style: FormStyle(
                  radius: 8,
                  borderColor: Colors.black38,
                  suffixIcon: Ti.user,
                ),
                model: forms['name'],
                type: FormType.topAligned,
                indicator: true),

            LxForm.input(
                label: 'Email Address',
                hint: 'Input your email address',
                style: FormStyle(radius: 8, borderColor: Colors.black38),
                type: FormType.grouped,
                model: forms['email'],
                indicator: true),

            LxForm.input(
                label: 'Underlined',
                hint: 'This is underlined input',
                style: FormStyle(radius: 8, borderColor: Colors.black38),
                type: FormType.underlined,
                model: forms['address'],
                indicator: true),

            LxForm.input(
                label: 'Top Inner',
                hint: 'This is top-inner input',
                style: FormStyle(
                  radius: 8,
                  borderColor: Colors.black38,
                ),
                type: FormType.topInner,
                model: forms['phone'],
                keyboard: Tit.number,
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
      ),
      bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: (_) {
            final form = forms.validate(required: ['*'], alert: FormAlert.text);
            logg(form.ok);
            logg(form.error?.message);
          }).theme1(),
    );
  }
}
