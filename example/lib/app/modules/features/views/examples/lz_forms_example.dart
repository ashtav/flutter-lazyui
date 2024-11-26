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
    'province',
    'city',
    'phone',
    'distance',
    'email',
    'password',
  ]);
}

class FormsView extends StatelessWidget {
  const FormsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FormController();
    final forms = controller.forms;

    Bindings.onRendered(() {
      forms.fill({
        'name': 'John Doe',
        'qty': 1,
        'distance': 29,
        'gender': 'Male',
        'hobby': ['Coding', 'Swimming'],
        'province': Option('Jakarta', value: 2)
      });

      // forms.setValue('province', Option('Jakarta', value: 2)); // or like this
    });

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

    List<Option> provinces =
        ['Bali', 'Jakarta', 'Yogyakarta'].option(values: [1, 2, 3]);
    Map<int, List<Option>> cities = {
      1: [
        'Denpasar',
        'Badung',
        'Tabanan',
        'Gianyar',
        'Bangli',
        'Karangasem',
        'Buleleng'
      ].option(),
      2: [
        'Jakarta Barat',
        'Jakarta Pusat',
        'Jakarta Selatan',
        'Jakarta Timur',
        'Jakarta Utara'
      ].option(),
    };

    final font = Gfont.style(context);
    return Wrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
          actions: [
            IconButton(
                onPressed: () {
                  // set focus to specific input
                  // forms.set('name').enable().focus();
                  // forms.focus('name');
                  // forms.set('birthdate').enable();
                },
                icon: const Icon(Ti.forms))
          ],
        ),
        body: LzListView(
          autoCache: true,
          gap: 20,
          children: [
            LzFormWrap(
              grouping: true,
              label: Textr(
                'Biodata',
                style: font.bold,
                icon: Ti.user,
              ),
              description: 'Please input your full name and gender.',
              style: FormStyle(radio: RadioStyle(activeColor: Colors.orange)),
              children: [
                LzForm.input(
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    model: forms.at(0),
                    indicator: true,
                    style: InputStyle(
                        suffix: const Icon(Ti.user).onTap(() {
                      logg('suffix has been tapped!');
                      forms.set('product').value(Option(''));
                    }, hoverable: true))),
                LzForm.radio(
                  label: 'Select Gender',
                  options: ['Male', 'Female'],
                  model: forms['gender'],
                  onChange: (value) {
                    forms.setValue('hobby', ['Coding', 'Reading']);
                    // forms['hobby']?.notifier;
                  },
                ),
              ],
            ),
            LzFormWrap(grouping: true, children: [
              LzForm.input(
                hint: 'Please input your birthdate',
                model: forms['birthdate'],
                style: InputStyle(suffixIcon: Ti.calendarEvent),
                onTap: (text) {
                  final now = DateTime.now();
                  LzPicker.date(context,
                      initDate: text.toDate(),
                      minDate: now.subtract(50.y),
                      maxDate: now, onSelect: (value) {
                    // forms.setValue('birthdate', value.format('dd/MM/yyyy'));
                    forms.at(2).value(value.format('dd/MM/yyyy'));
                  });
                },
              ),
              LzForm.checkbox(options: [
                'Football',
                'Cooking',
                'Coding',
                'Swimming',
                'Reading',
                'Writing'
              ], disabled: [
                0,
                1
              ], model: forms['hobby']),
            ]),

            // example of using switch, selecta and number
            Row(
              children: [
                Column(
                  children: [
                    Textr(
                      'Get a Gift',
                      style: font.bold,
                      icon: Ti.gift,
                      margin: Ei.only(b: 5),
                    ),
                    Text('Select product you want to achieved.',
                        style: font.fs14)
                  ],
                ).start,
                LzForm.switches(
                    label: 'On|Off',
                    reversed: true,
                    onChange: (value) async {
                      forms.enable('product', value);

                      if (value) {
                        LzToast.overlay('Getting products...', duration: 1.s,
                            then: (() {
                          forms.setSelectOption(
                              'product',
                              products.option(disabled: [
                                'Spaghetti',
                                'Cappuccino',
                                'Lasagna'
                              ]),
                              andShow: true);

                          // open select picker automatically
                          // forms.showSelectPicker('product');
                        }));
                      }
                    }),
              ],
            ).between.margin(b: 16, t: 25),
            LzFormWrap(
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

            LzFormWrap(
                label: Textr('Address', style: font.bold, icon: Ti.map2),
                description:
                    'Example of using a select input with dynamic options.',
                grouping: true,
                children: [
                  LzForm.select(
                      hint: 'Select province',
                      model: forms['province'],
                      style: FormStyle(prefixIcon: Ti.map2),
                      pickerStyle: const PickerStyle(
                          height: 500,
                          title: 'Select Province',
                          description:
                              'Please select the province where you are located.'),
                      onTap: () {
                        return LzToast.overlay('Getting province...',
                            duration: 1.s, then: (() async {
                          // if data we get from server is null, empty or error
                          // we can prevent the select to show by returning false

                          // LzToast.show('There is no data to show.', position: Position.center);
                          // return false;

                          forms.setSelectOption('province', provinces,
                              disabled: [3], onSelected: (option) {
                            forms.set('city').enable().value('');

                            // forms.enable('city').setValue('city', '');
                            forms.setExtra(
                                'province',
                                option
                                    .value); // in case we need to use the value to get the city
                          });

                          // forms.onSelected('province', (f) => f.enable('city'));
                        }));
                      }),
                  LzForm.select(
                      hint: 'Select city',
                      model: forms['city'],
                      disabled: true,
                      onTap: () {
                        // get the province id from the extra
                        dynamic provinceId = forms.getExtra('province');
                        logg('Province ID: $provinceId');

                        return LzToast.overlay('Getting city...',
                            duration: 500.ms, then: (() {
                          final id = forms.getSelect('province');
                          forms.setSelectOption('city', cities[id] ?? [],
                              onSelected: (option) {
                            // set focus to phone
                            forms.set('phone').value('').focus().maxLength(5);
                            forms.setExtra('city', 9);
                          });
                        }));
                      }),
                ]).margin(t: 25),

            // Example of using an input field with a prefix widget and slider.
            LzFormWrap(
                label: Textr('Contact & Distance',
                    style: font.bold, icon: Ti.gift),
                description:
                    'Example of using an input field with a prefix widget and input slider.',
                grouping: true,
                spacing: 5,
                children: [
                  LzForm.input(
                    hint: 'Type your phone number',
                    style: InputStyle(
                        radius: 8,
                        borderColor: Colors.black38,
                        prefix: const Textr('+62')),
                    keyboard: Tit.number,
                    maxLength: 13,
                    model: forms['phone'],
                  ),
                  LzForm.slider(
                      divisions: 7,
                      indicator: (double value) => Text('\$${value.toInt()}'),
                      model: forms['distance'],
                      onChange: (value) {}),
                ]).margin(t: 25, b: 0),

            Row(
              children: [
                Text('Your distance is 1 Km', style: font.fs14.muted),
              ],
            ).end,

            // example of using input (obsecureToggle)
            LzFormWrap(
              grouping: true,
              style: FormStyle(
                borderColor: Colors.black38,
              ),
              label: Textr('Account', style: font.bold, icon: Ti.lock),
              description:
                  'Example of using an input field with an obscure toggle, show or hide password value.',
              children: [
                LzForm.input(
                    hint: 'Enter your email',
                    model: forms['email'],
                    keyboard: Tit.emailAddress),
                LzForm.input(
                    hint: 'Enter your password',
                    model: forms['password'],
                    obsecureToggle: true),
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
                    'name':
                        'I am sory, we need to know your name, so please provide your valid information.'
                  }));

              final payload = form.value.currency(['phone']);
              forms.setFromExtra(payload, ['province', 'city']);

              logg('-- form value: $payload');
              logg('-- form extra: ${form.extra}');

              if (form.ok) {
                LzToast.overlay('Submitting...', duration: 2.s, then: () {
                  LzToast.success('Your form submitted successfully!',
                      placement: ToastPlacement.center);
                });
              }
            }).lz.shadowed(context).padding(blr: 20),
      ),
    );
  }
}
