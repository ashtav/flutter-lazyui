import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormView6 extends StatelessWidget {
  const FormView6({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['name', 'type', 'category', 'qty']);

    return Wrapper(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Form View 6'),
      ),
      body: LzFormList(
        style: const LzFormStyle(type: FormType.topAligned, inputLabelFontWeight: Fw.bold),
        children: [
          LzForm.input(
            label: 'Name *',
            hint: 'Input your name',
            model: forms['name'],
          ),
          LzFormGroup(
            label: 'Event Type & Category *',
            labelSize: 14,
            children: [
              LzForm.select(
                  label: 'Event Type *',
                  hint: 'Select event type',
                  model: forms['type'],
                  options: ['Offline', 'Online'].makeOptions(values: [1, 2]),
                  onSelect: (selector) {
                    final offlines = ['Seminar', 'Workshop', 'Training'].makeOptions();
                    final onlines = ['Webinar', 'Live Streaming', 'E-Learning'].makeOptions();

                    final category = forms['category']?.notifier;
                    category?.setOption(null);

                    if (selector.option?.option == 'Offline') {
                      category?.setOptions(offlines);
                    } else {
                      category?.setOptions(onlines);
                    }
                  }),
              LzForm.select(
                label: 'Event Category *',
                hint: 'Select event category',
                model: forms['category'],
              ),
            ],
          ),
          LzForm.number(label: 'Item Qty *', hint: 'Input item qty', model: forms['qty']),
          LzForm.input(
              label: 'Full Screen Select *',
              hint: 'Select something here',
              onTap: (model) {
                SelectPicker.open(context, fullScreen: true, options: ['Seminar', 'Workshop', 'Training', 'Meeting', 'Playing'].makeOptions());
              }),
        ],
      ),
      bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: (control) {
            final form = LzForm.validate(forms,
                min: ['qty:2'],
                messages: FormMessages(min: {
                  'qty': 'Qty must be greater than 2, current value is {value}',
                }),
                notifierType: FormValidateNotifier.text);
          }).dark().theme1(),
    ));
  }
}

class FormController {
  final forms = LzForm.make(['id', 'name', 'answer', 'province', 'city', 'district', 'bank', 'account']);

  List<Option> provinces = const [
    Option(option: 'Bali', value: 1),
    Option(option: 'Jawa Barat', value: 2),
    Option(option: 'Kalimantan', value: 3),
    Option(option: 'Sulawesi', value: 4),
  ];

  List<Option> cities = const [
    Option(option: 'Denpasar', value: 1),
    Option(option: 'Jakarta', value: 2),
    Option(option: 'Bandung', value: 3),
    Option(option: 'Bogor', value: 4),
  ];

  List<Option> districts = const [
    Option(option: 'Kuta', value: 1),
    Option(option: 'Legian', value: 2),
    Option(option: 'Seminyak', value: 3),
    Option(option: 'Canggu', value: 4),
  ];

  Future getUser(String value) async {
    try {
      if (value.length >= 5) {
        forms.fill({'name': 'John Doe'});

        // set enabled to "answer" input
        forms['answer']?.notifier.setDisabled(false).setFocus();
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }

  Future onSubmit() async {
    try {
      // how to get value from forms
      String id = forms.get('id');
      logg(id); // 12008

      // how to get all value from forms
      final map = forms.toMap();
      logg(map); // {"id": "12008", "name": "John Doe", "answer": "Assassin"}

      // get value except "name"
      final map2 = forms.toMap(except: ['name']);
      logg(map2); // {"id": "12008", "answer": "Assassin"}

      final map3 = LzForm.validate(forms);
      logg(map3.value.removes(['name'])); // {"id": "12008", "answer": "Assassin"}
      logg(map3.value.get(['answer'])); // {"answer": "Assassin"}
    } catch (e, s) {
      Errors.check(e, s);
    }
  }
}