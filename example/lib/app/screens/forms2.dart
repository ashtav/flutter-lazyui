import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormController {
  final forms = LxForm.make([
    'name',
    'gender',
    'birthdate',
    'hobby',
    'product',
    'qty',
    'price',
    'province',
    'city',
    'email',
    'address',
    'phone'
  ]);
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

    List<String> products = [
      'Spaghetti',
      'Cappuccino',
      'Cheesecake',
      'Hamburger',
      'Lasagna',
      'Espresso',
      'Croissant',
      'Milkshake',
      'Macaroni',
      'Sandwich',
      'Chocolate',
      'Cocktail',
      'Pancakes',
      'Smoothie',
      'Lemonade'
    ];

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
                style: InputStyle(suffixIcon: Ti.calendarEvent),
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
            Row(
              children: [
                Column(
                  children: [
                    Text('Product Section', style: Gfont.bold),
                    Text('Select product you want to achieved.', style: Gfont.fs14)
                  ],
                ).start,
                LxForm.switches(
                    label: 'On|Off',
                    reversed: true,
                    onChange: (value) {
                      forms.enable('product', value);
                    }),
              ],
            ).between.margin(b: 16),
            LxFormTheme(
              grouping: true,
              children: [
                LxForm.select(
                  hint: 'Please select product',
                  options: products.option(disabled: ['Spaghetti', 'Cappuccino', 'Lasagna']),
                  disabled: true,
                  model: forms['product'],
                ),
                LxForm.number(
                    hint: 'Input quantity',
                    style: FormStyle(radius: 8, borderColor: Colors.black38),
                    model: forms['qty'],
                    max: 10),
              ],
            ),
            LxFormTheme(grouping: true, children: [
              LxForm.input(
                label: 'Phone Number',
                hint: 'Type your phone number',
                style: InputStyle(radius: 8, borderColor: Colors.black38, prefix: const Textr('+62')),
                type: FormType.topInner,
                keyboard: Tit.number,
                model: forms['phone'],
              ),
              LxForm.slider(
                label: 'Range Salary',
                divisions: 7,
                indicator: (double value) => Text('\$${value.toInt()}'),
              ),
            ]),
            LxFormTheme(
              type: FormType.topInner,
              grouping: true,
              style: FormStyle(
                borderColor: Colors.black38,
              ),
              label: Text('Account', style: Gfont.bold),
              description: Faker.words(15),
              children: [
                LxForm.input(
                  hint: 'Enter your email',
                ),
                LxForm.input(
                    hint: 'Enter your password',
                    obsecureToggle: true,
                    style: InputStyle(
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
