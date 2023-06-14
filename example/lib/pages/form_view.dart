part of page;

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms =
        LzForm.make(['name', 'birthday', 'fruit', 'hobby', 'email', 'password', 'province', 'number']).fill({'email': 'ashtaaav@gmail.com'});

    return Wrapper(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: LzFormList(
        cleanOnType: true,
        style: LzFormStyle(activeColor: LzColors.dark, inputBorderColor: Colors.black26, type: FormType.topAligned),
        children: [
          LzForm.input(label: 'Your Name *', hint: 'Input your name', indicator: true, model: forms['name']),
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
              options: ['Mango', 'Banana', 'Apple', 'Orange', 'Durian', 'Melon', 'Watermelon']
                  .make((data, i) => Option(option: data[i], disabled: [0, 1, 3].contains(i))),
              model: forms['fruit']),
          LzForm.checkbox(
              label: 'Checkbox *',
              options: List.generate(5, (i) => Option(option: ['Swimming', 'Reading', 'Coding', 'Cooking', 'Playing Music'][i], disabled: i == 1)),
              model: forms['hobby']),
          LzFormGroup(
            label: 'Account',
            prefixIcon: La.lock,
            children: [
              LzForm.input(label: 'Email *', hint: 'Input your email address', model: forms['email']),
              LzForm.input(label: 'Password *', hint: 'Input your password', model: forms['password'], obsecureToggle: true),
            ],
          ),
          LzFormGroup(
            label: 'Address',
            sublabel: 'Please select your province, city and district. Let me know if you have a problem.',
            prefixIcon: La.mapMarked,
            children: [
              // set options based on data from server
              LzForm.select(
                  label: 'Province *',
                  hint: 'Please select province',
                  model: forms['province'],
                  onTap: (selector) async {
                    // get data from server
                    LzToast.overlay('Loading...');

                    final data = await MyController.getProvince();
                    LzToast.dismiss();

                    // set options
                    selector.options = data.map((e) => Option(option: e['name'], value: e['id'])).toList();
                    selector.option = const Option(option: 'Jakarta', value: 2);

                    // logg(selector.option?.toMap());
                  },
                  onSelect: (selector) {
                    // You can set value (Option, String (option), or dynamic (value)
                    // provinceId = selector.option?.value
                  }),

              // set options from parameter
              LzForm.select(
                  label: 'City *',
                  hint: 'Please select city',
                  options: const [Option(option: 'Denpasar', value: 1), Option(option: 'Tabanan', value: 2)]),
              LzForm.select(label: 'District *', hint: 'Please select district'),
            ],
          ),
          LzFormGroup(
            label: 'Bank Account',
            prefixIcon: La.idCard,
            children: [
              LzForm.select(
                  label: 'Bank Account *',
                  labelStyle: const LzFormLabelStyle(fontWeight: Fw.bold),
                  options: ['BCA', 'BNI', 'BRI', 'Mandiri'].options(values: [10, 10, 15, 13]),
                  hint: 'Please select your bank account'),
              LzForm.input(label: 'Bank Account Number *', hint: 'Input your bank account number')
            ],
          ),
          LzForm.number(label: 'Number *', hint: 'Input your number', model: forms['number'], min: 25, max: 100, readonly: false),
          LzForm.input(label: 'Salary *', hint: 'Input your salary', keyboard: Tit.number, formatters: [InputFormat.idr()]),
          LzForm.input(
              label: 'Input with Suffix',
              hint: 'You can type or tap suffix',
              suffix: LzInputicon(
                icon: La.mapMarked,
                onTap: () {
                  LzToast.show('Open address', icon: La.mapMarked);
                },
              )),
          LzForm.switches(label: 'Active|Inactive'),
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
                  'fruit': 'Please select one of your favorite fruit, this is an example of required with custom message.',
                  'email': 'Please input your email address',
                  'password': 'Please input your password',
                }, email: {
                  'email': 'Please input valid email address',
                }, min: {
                  'name': 'Name must be at least 5 characters',
                  'password': 'Password must be at least 6 characters'
                }),
                notifierType: FormValidateNotifier.text,
                singleNotifier: false);

            if (form.ok) {
              LzToast.show('Form is valid');
            }
          }).style(LzButtonStyle.shadow, spacing: 20),
    ));
  }
}

class MyController {
  static Future<List<Map<String, dynamic>>> getProvince() async {
    await Future.delayed(500.ms);
    return [
      {'id': 1, 'name': 'Bali'},
      {'id': 2, 'name': 'Jakarta'},
      {'id': 3, 'name': 'Bandung'},
      {'id': 4, 'name': 'Surabaya'},
      {'id': 5, 'name': 'Yogyakarta'},
    ];
  }
}
