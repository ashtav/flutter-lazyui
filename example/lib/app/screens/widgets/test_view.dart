import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse('2023-10-11T04:34:19.000000Z');


    return Scaffold(
        appBar: AppBar(
          title: const Text('Test View'),
          actions: [
            const Icon(Ti.arrowUp).onPressed(() {
              context.bottomSheet(const MyWidget(),
                  draggable: true, safeArea: false, backBlur: true);
              // context.dialog(const MyWidget(), backBlur: true);
            })
          ],
        ),

        body: LzListView(
          children: [
            LxForm.select(hint: 'Select something', style: FormStyle(
              suffixIcon: La.angleDown
            ))
          ],
        ),
        );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      color: Colors.white,
      padding: Ei.all(20),
      child: Column(
        children: [Text(Faker.words(25)), const SizedBox(height: 150)],
      ).start.min,
    ).lz.clip(tlr: 8);
  }
}

class TestNotifier extends ChangeNotifier {
  final name = 'John'.tec;
  final forms = TEC.make(['name']);
}
