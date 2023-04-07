import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class CoachTrainerView extends StatelessWidget {
  const CoachTrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    final key1 = GlobalKey(), key2 = GlobalKey(), key3 = GlobalKey(), key4 = GlobalKey();
    AppTrainerController controller = AppTrainerController();

    return AppTrainer(
      controller: controller,
      onClickTarget: (target) {
        logg(target);
      },
      onInit: (control) {
        Utils.timer(() {
          control.open(keys: [key3, key1], orderByKey: true);
        }, 2.s);
      },
      targets: [
        Target(
          key: key1,
          title: 'Search Icon',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
        ),
        Target(
          key: key2,
          identify: 'calendar',
          title: 'Calendar Icon',
          onNext: (control) {
            // control.skip();
            control.next();
          },
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
        ),
        Target(
            key: key3,
            identify: 'fab',
            title: 'Floating Action Button',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
            align: ContentAlign.top),
        Target(
            key: key4,
            title: 'Button Square',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
            align: ContentAlign.bottom,
            shape: ShapeLightFocus.RRect),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coach Trainer'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Iconr(
                  La.search,
                  key: key1,
                  flipX: true,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  La.calendar,
                  key: key2,
                ))
          ],
        ),
        body: ListView(
          padding: Ei.all(20),
          physics: BounceScroll(),
          children: [
            Col(
              children: [LzButton(key: key4, text: 'Hello World!', onTap: (_) {})],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: key3,
          onPressed: () {
            controller.open();
          },
          child: const Icon(La.plus),
        ),
      ),
    );
  }
}
