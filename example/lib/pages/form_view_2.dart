import 'package:example/theme/theme.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: StackedListView(
          stacked: Button(
            onTap: () {
              context.dialog(CustomDialog(
                tapClose: true,
                alignment: Caa.start,
                children: [
                  Text('Dialog Title', style: Gfont.fs20.bold),
                  Textr(
                    Lipsum.createWord(15),
                    margin: Ei.only(t: 10, b: 15),
                  ),
                  Col(
                    children: List.generate(5, (i) {
                      return Container(
                        padding: Ei.sym(v: 20),
                        decoration: BoxDecoration(border: Br.only(['t'])),
                        child: Row(
                          children: [
                            Text(Lipsum.createWord(3)),
                          ],
                        ),
                      );
                    }),
                  ),
                  const TextInputTransparent(
                    hint: 'Type something...',
                  ),
                ],
              ));
            },
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
    );
  }
}
