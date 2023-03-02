import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

final forms = {
  'email': TextEditingController(),
  'password': TextEditingController(),
};

class FormView2 extends StatelessWidget {
  const FormView2({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form View'),
        ),
        body: StackedListView(
            stacked: Button(
              onTap: () {},
              text: 'Submit',
            ),
            children: [
              FormsGroup(children: [
                Forms.input(label: 'Email', hint: 'Input your email', controller: forms['email']),
                Forms.input(label: 'Password', hint: 'Input your password', obsecureToggle: true, controller: forms['password']),
              ]),
              Forms.switches(
                label: 'Available|Not Available',
                onChanged: (value) {},
              ),
            ]),
      ),
    );
  }
}
