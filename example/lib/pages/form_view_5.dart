import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormView5 extends StatelessWidget {
  const FormView5({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FormController();
    final forms = controller.forms;

    LzForm.fill(controller.forms, {'id': 9});

    return Wrapper(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Form View 5'),
      ),
      body: LzFormList(
        children: [
          LzFormGroup(
            children: [
              LzForm.input(
                  label: 'Your ID *',
                  labelStyle: const LzFormLabelStyle(fontWeight: Fw.bold),
                  hint: 'Input your id',
                  model: controller.forms['id'],
                  keyboard: Tit.number,
                  maxLength: 5,
                  onChange: (value) => controller.getUser(value)),
              LzForm.input(
                  hint: 'Your name here', model: forms['name'], disabled: true),
            ],
          ),
          LzForm.input(
              label: 'Your Answer *',
              labelStyle: const LzFormLabelStyle(fontWeight: Fw.bold),
              hint: 'Input your answer',
              model: forms['answer'],
              disabled: true),
          LzFormGroup(
            children: [
              LzForm.select(
                  label: 'Select Province *',
                  labelStyle: const LzFormLabelStyle(fontWeight: Fw.bold),
                  hint: 'Please select your province',
                  options: controller.provinces,
                  model: forms['province'],
                  onSelect: (selector) {
                    controller.forms['city']?.notifier.setDisabled(false);
                  }),
              LzForm.select(
                  label: 'Select City *',
                  hint: 'Please select your city',
                  options: controller.cities,
                  model: forms['city'],
                  disabled: true,
                  onSelect: (selector) {
                    controller.forms['district']?.notifier.setDisabled(false);
                  }),
              LzForm.select(
                  label: 'Select District *',
                  hint: 'Please select your district',
                  options: controller.districts,
                  model: forms['district'],
                  disabled: true,
                  onSelect: (selector) {
                    controller.forms['id']?.notifier.setFocus();
                  })
            ],
          ),
          LzFormGroup(
              label: 'Set Max Length',
              sublabel:
                  'You can set max length for input field. This is useful for bank account number.',
              sublabelStyle: SublabelStyle.cardWarning,
              prefixIcon: La.idCard,
              children: [
                LzForm.select(
                    label: 'Bank *',
                    hint: 'Please select your bank',
                    options: ['BCA', 'BNI', 'BRI', 'Mandiri'].make((data, i) =>
                        Option(option: data[i], value: [10, 10, 15, 13][i])),
                    model: forms['bank'],
                    onSelect: (selector) {
                      int maxLength = selector.option?.value ?? 0;
                      forms['account']
                          ?.notifier
                          .setText('')
                          .setMaxLength(maxLength)
                          .setDisabled(false)
                          .setFocus();
                    }),
                LzForm.input(
                    label: 'Your Answer *',
                    hint: 'Input your answer',
                    indicator: true,
                    model: forms['account'],
                    disabled: true,
                    keyboard: Tit.number,
                    maxLength: 0),
              ]),
          LzBox(
            children: [
              Row(
                crossAxisAlignment: Caa.start,
                children: [
                  LzForm.switches(id: 'term', onChange: (value) => logg(value)),
                  Text(
                    'By register as a member, you agree to our Terms and Conditions and Privacy Policy.',
                    style: Gfont.fs14,
                  ).onTap(() {
                    LzFormControl.switches('term');
                  }).flexible()
                ],
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: (control) {
            controller.onSubmit();

            final x = LazyUi.getConfig.toMap();
            logg(x);
          }).dark().theme1(),
    ));
  }
}

class FormController {
  final forms = LzForm.make([
    'id',
    'name',
    'answer',
    'province',
    'city',
    'district',
    'bank',
    'account'
  ]);

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
      logg(map3.value
          .removes(['name'])); // {"id": "12008", "answer": "Assassin"}
      logg(map3.value.get(['answer'])); // {"answer": "Assassin"}
    } catch (e, s) {
      Errors.check(e, s);
    }
  }
}
