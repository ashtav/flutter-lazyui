import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FormView2 extends StatelessWidget {
  const FormView2({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController controller = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Form View'),
      ),
      body: ListView(
        physics: BounceScroll(),
        padding: Ei.all(20),
        controller: controller,
        children: [
          FormsGroup(children: [
            Forms.input(label: 'Email', hint: 'Input your email'),
            Forms.input(label: 'Password', hint: 'Input your password', obsecureToggle: true),
          ]),
          Forms.switches(
            label: 'Available|Not Available',
            onChanged: (value) {},
          ),
          Button(
            onTap: () {
              double space = context.height - controller.position.maxScrollExtent;
              logg(context.height);
              logg(controller.position.maxScrollExtent);
              logg(space);
            },
            text: 'Submit',
            margin: Ei.only(t: 424.73636363636365),
          )
        ],
      ),
    );
  }
}

class CustomListView extends StatefulWidget {
  const CustomListView({super.key});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView(physics: BounceScroll(), padding: Ei.all(20), controller: controller, children: []);
  }
}
