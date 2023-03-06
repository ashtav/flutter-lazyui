import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController(),
        phone = TextEditingController(),
        birthday = TextEditingController(),
        gender = TextEditingController(),
        city = TextEditingController(),
        hobby = TextEditingController(text: 'Hot, Salty');

    List<String> cities = ['Denpasar', 'Badung', 'Tabanan', 'Singaraja', "Negare", 'Jembrana'];

    List<String> hobbies = ['Footbal', 'Killing', 'Drawing', 'Reading', 'Music', 'Writing'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: ListView(
        physics: BounceScroll(),
        padding: Ei.all(20),
        children: [
          FormsGroup(children: [
            Forms.input(label: 'Email', hint: 'Input your email'),
            Forms.input(label: 'Password', hint: 'Input your password', obsecureToggle: true),
          ]),
          FormsGroup(children: [
            Forms.input(
              label: 'Your Name',
              hint: 'Input your name',
              controller: name,
              indicator: true,
            ),
            Forms.input(label: 'Phone', hint: 'Input phone number', controller: phone, keyboard: Tit.number),
            Forms.radio(label: 'Gender', options: const ['Male', 'Female'], controller: gender),
            Forms.checkbox(label: 'Hobby', options: hobbies, controller: hobby, disabled: const [1, 3]),
          ]),
          Forms.input(label: 'Salary', hint: 'Input your salary', maxLength: 11, keyboard: Tit.number, formatters: [InputFormat.idr]),
          Forms.select(
              label: 'Control Your Options',
              hint: 'Select your city',
              controller: city,
              onTap: (control) async {
                control.options = List.generate(cities.length, (i) => Option(option: cities[i]));
              },
              onSelect: (control, option) {}),
          FormsGroup(children: [
            Forms.select(
              label: 'City',
              hint: 'Select your city',
              controller: city,
              options: List.generate(cities.length, (i) => Option(option: cities[i])),
            ),
            Forms.input(
                label: 'Date of Birth',
                hint: 'Input birthday',
                controller: birthday,
                onTap: (c) async {
                  DateTime? date = await Pickers.datePicker(context);
                  if (date != null) c?.text = date.format();
                }),
          ]),
          Forms.input(label: 'Date of Birth', hint: 'Input birthday', enabled: false),
          Forms.switches(
            label: 'Available|Not Available',
            onChanged: (value) {},
          ),
        ],
      ),
      bottomNavigationBar: Forms.button(
        text: 'Submit',
        icon: La.check,
        type: ButtonType.dark,
        onTap: () {},
      ),
    );
  }
}
