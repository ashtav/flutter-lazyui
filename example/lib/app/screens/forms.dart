import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormsView extends StatelessWidget {
  const FormsView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make([
      'name',
      'birthday',
      'fruit',
      'hobby',
      'email',
      'password',
      'province',
      'city',
      'number',
      'is_active'
    ]).fill({
      'email': 'ashtaaav@gmail.com',
      'fruit': 'Apple',
      // 'hobby': 'Swimming, Coding',
      'is_active': '1'
    });

    // reset form
    // forms.reset(except: ['hobby']).fill({'email': 'johndoe@gmail.com'});

    return Wrapper(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: LzFormList(
        cleanOnFilled: true,
        style: LzFormStyle.topAligned(Colors.black26),
        children: [
          LzForm.input(
              label: 'Your Name *',
              hint: 'Input your name',
              indicator: true,
              model: forms['name']),
          LzForm.input(
              label: 'Birthday *',
              hint: 'Input your birthday',
              model: forms['birthday'],
              suffixIcon: La.calendar,
              onTap: (model) {
                // open date picker, then set value to the model
                model.text = '2021-01-01';
              }),
          LzForm.radio(
              label: 'Radio Input *',
              options: [
                'Mango',
                'Banana',
                'Apple',
                'Orange',
                'Durian',
                'Melon',
                'Watermelon'
              ].generate((data, i) =>
                  Option(option: data, disabled: [0, 1, 3].contains(i))),
              model: forms['fruit']),
          LzForm.checkbox(
              label: 'Checkbox *',
              options: List.generate(
                  5,
                  (i) => Option(
                      option: [
                        'Swimming',
                        'Reading',
                        'Coding',
                        'Cooking',
                        'Playing Music'
                      ][i],
                      disabled: i == 1)),
              model: forms['hobby']),
          LzFormGroup(
            label: 'Account *',
            labelStyle: Gfont.fs14,
            children: [
              LzForm.input(
                  label: 'Email *',
                  hint: 'Input your email address',
                  model: forms['email']),
              LzForm.input(
                  label: 'Password *',
                  hint: 'Input your password',
                  model: forms['password'],
                  obsecureToggle: true),
            ],
          ),
          LzForm.select(
              label: 'Country *',
              options: ['Indonesia', 'China', 'Thailand', 'Vietnam', 'Japan']
                  .options(),
              hint: 'Please select your country'),
          LzFormGroup(
            label: 'Address',
            sublabel:
                'Please select your province, city and district. Let me know if you have a problem.',
            prefixIcon: La.mapMarked,
            children: [
              // set options based on data from server
              LzForm.select(
                  label: 'Province *',
                  hint: 'Please select province',
                  model: forms['province'],
                  // initValue: const Option(option: 'DKI Jakarta', value: 2),
                  onTap: (selector) async {
                    // get data from server
                    LzToast.overlay('Loading...');

                    final data = await MyController.getProvince();
                    LzToast.dismiss();

                    // set options
                    selector.options = data
                        .map((e) => Option(option: e['name'], value: e['id']))
                        .toList();
                    // selector.option = const Option(option: 'Jakarta', value: 2);

                    // logg(selector.option?.toMap());
                  },
                  onSelect: (selector) {
                    // You can set value (Option, String (option), or dynamic (value)
                    selector.setExtra(selector.option?.value); // set extra data

                    // clear city value
                    forms.unfill(['city']);
                  }),

              // set options from parameter
              LzForm.select(
                  label: 'City *',
                  hint: 'Please select city',
                  model: forms['city'],
                  onTap: (selector) async {
                    final provinceId = forms.get('province', extra: true);
                    if (provinceId == null) {
                      LzToast.show('Please select province first');
                      return false;
                    }

                    // get data from server
                    LzToast.overlay('Loading...');

                    final data = await MyController.getCity(provinceId);
                    LzToast.dismiss();

                    selector.options = data
                        .map((e) => Option(option: e['name'], value: e['id']))
                        .toList();
                  },
                  options: const [
                    Option(option: 'Denpasar', value: 1),
                    Option(option: 'Tabanan', value: 2)
                  ]),

              LzForm.select(
                  label: 'District *',
                  hint: 'Please select district',
                  maxLines: 2,
                  options: [
                    Faker.words(5),
                    Faker.words(55),
                    Faker.words(20),
                    Faker.words(20)
                  ].options()),
            ],
          ),
          LzFormGroup(
            label: 'Bank Account',
            prefixIcon: La.idCard,
            children: [
              LzForm.select(
                  label: 'Bank Account *',
                  labelStyle: const LzFormLabelStyle(fontWeight: Fw.bold),
                  options: ['BCA', 'BNI', 'BRI', 'Mandiri']
                      .options(values: [10, 10, 15, 13]),
                  hint: 'Please select your bank account'),
              LzForm.input(
                  label: 'Bank Account Number *',
                  hint: 'Input your bank account number')
            ],
          ),
          LzForm.number(
              label: 'Number *',
              hint: 'Input your number',
              model: forms['number'],
              min: 25,
              max: 100,
              readonly: false),
          LzForm.input(
              label: 'Salary *',
              hint: 'Input your salary',
              keyboard: Tit.number,
              prefix: const Text('Rp.'),
              formatters: [Formatter.currency()]),
          LzForm.input(
              label: 'Input with Suffix',
              hint: 'You can type or tap suffix',
              suffix: LzInputicon(
                icon: La.mapMarked,
                onTap: () {
                  LzToast.show('Open address', icon: La.mapMarked);
                },
              )),
          LzForm.switches(label: 'Active|Inactive', model: forms['is_active']),
          const SizedBox(
            height: 50,
          )
        ],
      ),
      bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: (control) {
            LzForm form = LzForm.validate(forms,
                required: ['*'],
                email: ['email'],
                min: ['password:6', 'name:5'],
                messages: FormMessages(required: {
                  'name': 'Please input your name',
                  'fruit':
                      'Please select one of your favorite fruit, this is an example of required with custom message.',
                  'email': 'Please input your email address',
                  'password': 'Please input your password',
                }, email: {
                  'email': 'Please input valid email address',
                }, min: {
                  'name': 'Name must be at least 5 characters',
                  'password': 'Password must be at least 6 characters'
                }),
                notifierType: LzFormNotifier.text,
                singleNotifier: false);

            if (form.ok) {
              LzToast.show('Form is valid');
            }

            logg(form.value); // get value from form
            logg(forms['province']
                ?.notifier
                .extra); // get extra data from select
          }).style(LzButtonStyle.shadow, spacing: 20),
    ));
  }
}

class MyController {
  static Future<List<Map<String, dynamic>>> getProvince() async {
    await Future.delayed(250.ms);
    return [
      {'id': 1, 'name': 'Bali'},
      {'id': 2, 'name': 'DKI Jakarta'},
      {'id': 3, 'name': 'Bandung'},
      {'id': 4, 'name': 'Surabaya'},
      {'id': 5, 'name': 'Yogyakarta'},
    ];
  }

  static Future<List<Map<String, dynamic>>> getCity(int provinceId) async {
    await Future.delayed(500.ms);
    return [
      {'id': 1, 'name': 'Denpasar', 'province_id': 1},
      {'id': 2, 'name': 'Tabanan', 'province_id': 1},
      {'id': 3, 'name': 'Badung', 'province_id': 1},
      {'id': 4, 'name': 'Gianyar', 'province_id': 1},
      {'id': 5, 'name': 'Bangli', 'province_id': 1},
      {'id': 6, 'name': 'Singaraja', 'province_id': 1},
      {'id': 7, 'name': 'Jakarta Barat', 'province_id': 2},
      {'id': 8, 'name': 'Jakarta Pusat', 'province_id': 2},
      {'id': 9, 'name': 'Jakarta Selatan', 'province_id': 2},
    ].where((e) => e['province_id'] == provinceId).toList();
  }
}
