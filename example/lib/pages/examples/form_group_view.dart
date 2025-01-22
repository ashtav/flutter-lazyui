import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormGroupView extends StatelessWidget {
  const FormGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make([
      'email',
      'password',
      'confirm_password',
      'name',
      'ticket',
      'province',
      'city'
    ]);

    final obscure = Obscure(
      hide: Hi.lockPassword,
      show: Hi.squareUnlock01,
    );

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form Group'),
          actions: [LzThemeAction()],
        ),
        body: LzListView(
          padding: Ei.only(b: 100, others: 20),
          autoCache: true,
          gap: 25,
          children: [
            FormGroup(
              label: 'Email & Password',
              children: [
                LzForm.input(
                    label: 'Email',
                    hint: 'Input email address',
                    model: forms.key('email')),
                LzForm.input(
                  label: 'Password',
                  hint: 'Input password',
                  model: forms.key('password'),
                  suffix: obscure,
                ),
              ],
            ),
            LzForm.input(
              label: 'Confirm Password',
              hint: 'Type password confirmation',
              model: forms.key('confirm_password'),
              suffix: obscure,
            ),
            FormGroup(
              children: [
                LzForm.input(
                    label: 'Your Name',
                    hint: 'Type your name',
                    model: forms.key('name')),
                LzForm.number(
                    label: 'Ticket',
                    hint: 'Enter ticket number',
                    model: forms.key('ticket')),
              ],
            ),
            FormGroup(
              children: [
                LzForm.select(
                    label: 'Province',
                    hint: 'Select province',
                    model: forms.key('province'),
                    ),
                LzForm.select(
                    label: 'City',
                    hint: 'Select city',
                    model: forms.key('city'),
                    options: ['Denpasar', 'Tabanan']),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: Ei.only(h: 20, b: 20),
          child: LzButton(
            text: 'Submit',
            color: '212121'.hex,
            onTap: () {
              final form = forms.validate(required: [
                '*',
              ], email: [
                'email'
              ], match: [
                'password:confirm_password',
              ], message: {
                'confirm_password:match': 'Your password does not match, dude!',
              });

              if (form.ok) {
                logg(form.value);
              }
            },
          ).lz.shadowed(context),
        ),
      ),
    );
  }
}
