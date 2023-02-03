import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:mixins/mixins.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController(),
        phone = TextEditingController(),
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
          Forms.select(
            label: 'City',
            hint: 'Select your city',
            controller: city,
            options: List.generate(cities.length, (i) => Option(option: cities[i])),
          ),
          Forms.switches(
            label: 'Available|Not Available',
            onChanged: (value) {},
          )
        ],
      ),
      bottomNavigationBar: InkW(
        onTap: () {},
        padding: Ei.all(20),
        child: const Text('Submit'),
      ),
    );
  }
}
