import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Notifier extends ChangeNotifier {
  int active = 0;
  bool show = false;

  void toggle() {
    active++;

    if (active >= 3) {
      active = 0;
    }

    show = !show;
    notifyListeners();
  }

  int length = 0;

  void setValue(int value) {
    length = value;
    notifyListeners();
  }

  final forms = LzForm.make(['bank', 'bank_account']);
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();
    final forms = notifier.forms;

    final banks = [
      {"bank_name": "Bank Central Asia (BCA)", "max_length": 10},
      {"bank_name": "Bank Rakyat Indonesia (BRI)", "max_length": 15},
      {"bank_name": "Bank Negara Indonesia (BNI)", "max_length": 16},
      {"bank_name": "Bank Mandiri", "max_length": 13},
      {"bank_name": "Bank Tabungan Negara (BTN)", "max_length": 16},
      {"bank_name": "CIMB Niaga", "max_length": 13},
      {"bank_name": "Bank Danamon", "max_length": 10},
      {"bank_name": "Bank Syariah Indonesia (BSI)", "max_length": 10},
      {"bank_name": "Bank Permata", "max_length": 16},
      {"bank_name": "Bank Mega", "max_length": 16}
    ];

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Labs'),
          actions: [
            LzThemeAction(),
            IconButton(
                onPressed: () {
                  // notifier.toggle();
                  // forms.fill({'old_pass': 'Lorem1234sdf', 'email': 'test@gmail.com'});
                },
                icon: Icon(Hi.gift))
          ],
        ),
        body: notifier.watch((state) => LzListView(
              autoCache: true,
              gap: 25,
              children: [
                LzForm.select(
                    label: 'Select Bank *',
                    hint: 'Select your bank',
                    model: forms.key('bank'),
                    onTap: () async {
                      forms.set('bank').options(banks.labelValue('bank_name', 'max_length'));
                    },
                    onChange: (option) {
                      forms.set('bank_account', '').maxLength(forms.extra('bank')).focus();
                      state.setValue(forms.extra('bank'));
                      logg('max length: ${forms.extra('bank')}');
                    }),
                LzForm.input(
                    label: 'Account *',
                    hint: 'Type bank account',
                    keyboard: Tit.number,
                    model: forms.key('bank_account'),
                    suffix: Center(widthFactor: 1, child: LzBadge(text: '${state.length}', color: Colors.orange)))
              ],
            )),
        bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: () {
            forms.set('name', Faker.words());
            // final form = forms.validate(required: [
            //   '*'
            // ], match: [
            //   'new_pass:confirm_pass'
            // ], min: [
            //   'old_pass:5'
            // ], message: {
            //   'old_pass': 'Old pass please!',
            //   'old_pass:min': 'Wait! min',
            //   'new_pass': 'New pass please!',
            //   'confirm_pass': 'Ey! confirm your pass!',
            //   'confirm_pass:match': 'Not same!'
            // });
          },
        ).margin(blr: 20).lz.shadowed(context),
      ),
    );
  }
}
