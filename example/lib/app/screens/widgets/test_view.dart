import 'package:example/app/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['name']);

    forms.fill({'name': 'John Doe'});

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Pickers.show(context);
                },
                icon: const Icon(Ti.photo))
          ],
        ),
        body: LzListView(
          children: [
            LzForm.input(hint: 'Enter your name', model: forms['name']),
            LzDropItem(
              options: DropOption.list(['Details', 'Edit', 'Delete', 'Archive']),
              style: DropStyle(separators: [3]),
              builder: (child) => Container(padding: Ei.all(20), width: context.width, child: child),
              child: LzCard(
                stacked: true,
                stackAlign: StackAlign.top,
                children: [Text(Faker.words(25))],
              ),
            )
          ],
        ),
      ),
    );
  }
}
