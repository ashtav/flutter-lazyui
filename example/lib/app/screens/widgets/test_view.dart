import 'package:example/app/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

final key1 = GlobalKey(),
    key2 = GlobalKey(),
    key3 = GlobalKey(),
    key4 = GlobalKey();
final controller = TrainerController();
List<String> titles = [
  'Search Icon',
  'Calendar Icon',
  'Floating Action Button',
  'Button'
];

double progress = 90;

class User {
  final int? id;
  final String? name;

  User({this.id, this.name});
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['name']);

    Bindings.onRendered(() {
      forms.fill({'name': 'John Doe'});
    });

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              Pickers.show(context);
            }, icon: const Icon(Ti.photo))
          ],
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
                  LzForm.input(
                      label: 'Full Name',
                      hint: 'Enter your full name',
                      model: forms['name'],
                      indicator: true,
                      style: InputStyle(
                          suffix: const Icon(Ti.user).onTap(() {
                        logg('suffix has been tapped!');
                      }, hoverable: true))),
                ])
          ],
        ),
      ),
    );
  }
}
