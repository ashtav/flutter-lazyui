import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TrainerView extends StatelessWidget {
  const TrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    final key1 = GlobalKey(), key2 = GlobalKey(), key3 = GlobalKey();
    TrainerController controller = TrainerController();

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

      targets: [key1].generate((key, i){
        List<String> titles = ['Search Icon', 'Calendar Icon', 'Floating Action Button'];
        return Target(key: key, title: titles[i], description: Faker.words(217));
      }),

      showSectionLabel: true,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('App Trainer'),
            actions: [La.search, La.calendar].generate((icon, i) =>
                Iconr(icon, flipX: true, key: [key1, key2][i])
                    .onPressed(() => {}))),
        body: LzListView(
          children: [
            // LzForm.input(
            //   label: 'Name',
            //   hint: 'Enter your name',
            //   model: forms['name'],
            // ),
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
