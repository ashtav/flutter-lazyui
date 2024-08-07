import 'package:example/app/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['name']);

    forms.fill({'name': 'John Doe'});

    List<String> labels = ['Text A', 'Text B', 'Text C'];
    final font = context.gfont;

    final key = GlobalKey();

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(title: const Text('Test View'), actions: [
          ...[Ti.swipe, Ti.photo].iconButton((i) {
            if (i == 0) {
              context.bottomSheet(const MyComment());
            } else {
              Pickers.show(context);
            }
          }),
          Icon(Ti.filter, key: key).onPressed(() {
            LzDrop.show(key,
                options: DropOption.list(['Latest', 'Most Liked']));
          })
        ]),
        body: LzListView(
          gap: 10,
          children: [
            Text('Hello World!', style: font.bold),
            Text(Faker.words(15), style: font.muted),
            const SizedBox(height: 15),
            LzForm.input(hint: 'Enter your name', model: forms['name']),
            LzDropItem(
              options:
                  DropOption.list(['Details', 'Edit', 'Delete', 'Archive']),
              style: DropStyle(separators: [3]),
              builder: (child) => Container(
                  padding: Ei.all(20), width: context.width, child: child),
              child: LzCard(
                stacked: true,
                stackAlign: StackAlign.top,
                children: [Text(Faker.words(25))],
              ),
            ),
            Intrinsic(
                gap: 3,
                children: labels.generate((item, i) {
                  return InkTouch(
                    onTap: () {},
                    border: Br.all(),
                    radius: Br.radius(5),
                    padding: Ei.sym(v: 13, h: 20),
                    child: Text(item),
                  );
                })),
          ],
        ),
        bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: (_) {},
        ).lz.shadowed(context).padding(blr: 20),
      ),
    );
  }
}

class MyComment extends StatelessWidget {
  const MyComment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: LzListView(
            children: [Text(Faker.words(10, 25))],
          )),
          const LzTextField(
            hint: 'Type your comment...',
            prefixIcon: Icon(Ti.message),
            borderRadius: Br.zero,
          ).bordered(),
        ],
      ),
    );
  }
}
