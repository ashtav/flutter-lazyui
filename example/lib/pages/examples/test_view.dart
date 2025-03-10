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

  double opacity = 1;

  void setValue(double value) {
    opacity = value;
    notifyListeners();
  }

  final forms = LzForm.make(['name', 'email', 'gender']);
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();
    final forms = notifier.forms;

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Labs'),
          actions: [
            LzThemeAction(),
            IconButton(
                onPressed: () {
                  // notifier.toggle();
                  // forms.fill({'name': Faker.name(), 'email': 'test@gmail.com'});

                  LzPicker.option(context,
                      options:
                          Option.list(Faker.list.category(10, unique: true)));
                },
                icon: Icon(Hi.gift))
          ],
        ),
        body: LzListView(
          autoCache: true,
          gap: 25,
          children: [
            LzCard(
              style: LzCardStyle(stacked: true),
              onTap: () {
                LzPicker.date(context);
              },
              children: [Text(Faker.name()), Text(Faker.email())],
            )
          ],
        ),
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
