import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AppTrainerView extends StatelessWidget {
  const AppTrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    final key1 = GlobalKey(), key2 = GlobalKey(), key3 = GlobalKey();
    TrainerController controller = TrainerController();

    final forms = LzForm.make(['name']);

    return Trainer(
      controller: controller,
      onClickTarget: (target) {
        logg(target);
      },
      onInit: (control) {
        Utils.timer(() {
          // control.show(keys: [forms['name']!.key], orderByKey: true);
          controller.show();
        }, 300.ms);
      },
      targets: [
        Target(key: key1, title: 'Search Icon', description: Faker.words(15)),
        Target(
          key: key2,
          title: 'Calendar Icon',
          onNext: (control) {
            control.next(); // or control.skip();
          },
          description: Faker.words(15),
        ),
        Target(
            key: key3,
            title: 'Floating Action Button',
            description: Faker.words(15),
            align: ContentAlign.top),
        Target(
            key: forms['name']!.key,
            title: 'Widget Square',
            description: Faker.words(15),
            align: ContentAlign.bottom,
            shape: ShapeLightFocus.RRect),
      ],
      child: Scaffold(
        appBar: AppBar(
            title: const Text('App Trainer'),
            actions: [La.search, La.calendar].generate((icon, i) =>
                Iconr(icon, flipX: true, key: [key1, key2][i])
                    .onPressed(() => {}))),
        body: LzListView(
          children: [
            LzForm.input(
              label: 'Name',
              hint: 'Enter your name',
              model: forms['name'],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: key3,
          onPressed: () => controller.show(),
          child: const Icon(La.info),
        ),
      ),
    );
  }
}
