import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormController {
  final forms = LzForm.make([
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
          autoCache: true,
          children: [
            LzFormTheme(
              grouping: true,
              label: Textr(
                'Biodata',
                style: Gfont.bold,
                icon: Ti.user,
              ),
              description: 'Please input your full name and gender.',
              style: FormStyle(radio: RadioStyle(activeColor: Colors.orange)),
              children: [
                LzForm.input(label: 'Full Name', hint: 'Enter your full name', model: forms['name'], indicator: true),
                LzForm.radio(
                  label: 'Select Gender',
                  options: ['Male', 'Female'],
                  model: forms['gender'],
                  onChange: (value) {
                    forms.setValue('hobby', ['Coding', 'Reading']);
                  },
                ),
              ],
            ),
            LzFormTheme(grouping: true, children: [
              LzForm.input(
                hint: 'Please input your birthdate',
                model: forms['birthdate'],
                style: InputStyle(suffixIcon: Ti.calendarEvent),
                onTap: (control) {
                  LzPicker.datePicker(context, initialDate: control.text.toDate(), onSelect: (value) {
                    control.text = value.format('dd/MM/yyyy');
                  });
                },
              ),
              LzForm.checkbox(
                  options: ['Football', 'Cooking', 'Coding', 'Swimming', 'Reading', 'Writing'],
                  disabled: [0, 1],
                  model: forms['hobby']),
            ]),

            // example of using switch, selecta and number
            Row(
              children: [
                Column(
                  children: [
                    Textr(
                      'Get a Gift',
                      style: Gfont.bold,
                      icon: Ti.gift,
                      margin: Ei.only(b: 5),
                    ),
                    Text('Select product you want to achieved.', style: Gfont.fs14)
                  ],
                ).start,
                LzForm.switches(
                    label: 'On|Off',
                    reversed: true,
                    onChange: (value) async {
                      forms.enable('product', value);

                      if (value) {
                        LzToast.overlay('Getting products...', duration: 1.s).then((_) {
                          forms.setSelectOption(
                              'product', products.option(disabled: ['Spaghetti', 'Cappuccino', 'Lasagna']),
                              andShow: true);

                          // open select picker automatically
                          // forms.showSelectPicker('product');
                        });
                      }
                    }),
              ],
            ).between.margin(b: 16, t: 25),
            LzFormTheme(
              grouping: true,
              children: [
                LzForm.select(
                  hint: 'Please select product',
                  // The options will be added when the switch is on, so it can be dynamically changed.
                  // options: products.option(disabled: ['Spaghetti', 'Cappuccino', 'Lasagna']),
                  disabled: true,
                  model: forms['product'],
                ),
                LzForm.number(
                    hint: 'Input quantity',
                    style: FormStyle(radius: 8, borderColor: Colors.black38),
                    model: forms['qty'],
                    max: 50),
              ],
            ),

            LzFormTheme(
                label: Textr('Address', style: Gfont.bold, icon: Ti.map2),
                description: 'Example of using a select input with dynamic options.',
                grouping: true,
                children: [
                  LzForm.select(
                    hint: 'Select province',
                    model: forms['province'],
                  ),
                  LzForm.select(
                    hint: 'Select city',
                    model: forms['city'],
                  ),
                ]).margin(t: 25),

            // Example of using an input field with a prefix widget and slider.
            LzFormTheme(
                label: Textr('Contact & Distance', style: Gfont.bold, icon: Ti.gift),
                description: 'Example of using an input field with a prefix widget and input slider.',
                grouping: true,
                spacing: 5,
                children: [
                  LzForm.input(
                    hint: 'Type your phone number',
                    style: InputStyle(radius: 8, borderColor: Colors.black38, prefix: const Textr('+62')),
                    keyboard: Tit.number,
                    model: forms['phone'],
                  ),
                  LzForm.slider(
                      divisions: 7,
                      indicator: (double value) => Text('\$${value.toInt()}'),
                      onChange: (value) {
                        LzState.set('#distance', value);
                      }),
                ]).margin(t: 25, b: 0),

            LzState.watch(
                '#distance',
                0.0,
                (value) => Row(
                      children: [
                        Text('Your distance is $value Km', style: Gfont.fs14.muted),
                      ],
                    ).end),

            // example of using input (obsecureToggle)
            LzFormTheme(
              type: FormType.topInner,
              grouping: true,
              style: FormStyle(
                borderColor: Colors.black38,
              ),
              label: Textr('Account', style: Gfont.bold, icon: Ti.lock),
              description: 'Example of using an input field with an obscure toggle, show or hide password value.',
              children: [
                LzForm.input(hint: 'Enter your email', keyboard: Tit.emailAddress),
                LzForm.input(hint: 'Enter your password', obsecureToggle: true),
              ],
            ).margin(t: 25, b: 16), // end of account
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
