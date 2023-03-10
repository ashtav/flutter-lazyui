import 'package:example/codelabs/lazyform/lazyform.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart' hide FormMessages;

class FormView3 extends StatelessWidget {
  const FormView3({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['email', 'password']);

    return Wrapper(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: BounceListView(
        children: [
          LzForm.input(label: 'Email *', hint: 'Input your email address', model: forms['email']),
          LzForm.input(label: 'Password *', hint: 'Input your password', model: forms['password']),
        ],
      ),
      bottomNavigationBar: Forms.button(
          text: 'Submit',
          onTap: () {
            LzForm form = LzForm.validate(forms,
                required: ['*'],
                messages: FormMessages(required: {
                  'email': 'Please input your email address',
                  'password': 'Please input your password',
                }));

            logg(form.ok);
          }),
    ));
  }
}

class BounceListView extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final List<Widget> children;
  const BounceListView({super.key, this.padding, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BounceScroll(),
      padding: padding ?? Ei.all(20),
      children: children,
    );
  }
}
