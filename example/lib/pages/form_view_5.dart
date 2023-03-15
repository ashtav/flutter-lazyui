import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormView5 extends StatelessWidget {
  const FormView5({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FormController();

    return Wrapper(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: LzFormList(
        children: [
          LzFormGroup(
            children: [
              LzForm.input(
                  label: 'Your ID *',
                  hint: 'Input your id',
                  model: controller.forms['id'],
                  keyboard: Tit.number,
                  maxLength: 5,
                  onChange: (value) => controller.getUser(value)),
              LzForm.input(hint: 'Your name here', model: controller.forms['name'], disabled: true),
            ],
          ),
          LzForm.input(label: 'Your Answer *', hint: 'Input your answer', model: controller.forms['answer'], disabled: true),
          LzFormGroup(
            children: [
              LzForm.select(
                  label: 'Select Province *',
                  hint: 'Please select your province',
                  options: controller.provinces,
                  model: controller.forms['province'],
                  onSelect: (selector) {
                    controller.forms['city']?.notifier.setDisabled(false);
                  }),
              LzForm.select(
                  label: 'Select City *',
                  hint: 'Please select your city',
                  options: controller.cities,
                  model: controller.forms['city'],
                  disabled: true,
                  onSelect: (selector) {
                    controller.forms['district']?.notifier.setDisabled(false);
                  }),
              LzForm.select(
                  label: 'Select District *',
                  hint: 'Please select your district',
                  options: controller.districts,
                  model: controller.forms['district'],
                  disabled: true,
                  onSelect: (selector) {
                    controller.forms['id']?.notifier.setFocus();
                  })
            ],
          ),
        ],
      ),
      bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: (control) {
            controller.onSubmit();
          }).dark().style(LzButtonStyle.shadow, spacing: 20),
    ));
  }
}

class FormController {
  final forms = LzForm.make(['id', 'name', 'answer', 'province', 'city', 'district']);

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
