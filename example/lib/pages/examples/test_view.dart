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

  final forms = LzForm.make(['old_pass', 'new_pass', 'confirm_pass']);
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
                  notifier.toggle();
                },
                icon: Icon(Hi.gift))
          ],
        ),
        body: LzListView(
          autoCache: true,
          gap: 35,
          children: [
            // LzForm.input(
            //   label: 'Old Password *',
            //   hint: 'Type your old password',
            //   model: forms.key('old_pass'),
            //   suffix: Obscure()
            // ),

            // LzForm.input(
            //   label: 'New Password *',
            //   hint: 'Type your new password',
            //   model: forms.key('new_pass'),
            //   suffix: Obscure()
            // ),

            // LzForm.input(
            //   label: 'Confirm Password *',
            //   hint: 'Type your password confirmation',
            //   model: forms.key('confirm_pass'),
            //   suffix: Obscure()
            // ),

            forms.generate(labels: [
              'Old Password *',
              'New Password *',
              'Confirm Password *'
            ], hints: [
              'Type your old password',
              'Type your new password',
              'Type password confirmation'
            ], suffixs: 3.generate((i) => Obscure()))
          ],
        ),
        bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: () {
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
