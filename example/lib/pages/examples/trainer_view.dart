import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';

class TrainerView extends StatelessWidget {
  const TrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    final targets = [
      Target(description: Faker.words(20)),
      Target(description: Faker.words(20)),
      Target(description: Faker.words(20), align: ContentAlign.top),
      Target(description: Faker.words(20), align: ContentAlign.top, shape: ShapeLightFocus.rRect),
    ];

    final controller = TrainerController();

    return Trainer(
      targets: targets,
      controller: controller,
      builder: (keys) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Trainer'),
            actions: [
              DarkModeWidget.icon(),
              IconButton(key: keys[1], onPressed: () {}, icon: Icon(Hi.archive)),
              IconButton(key: keys[0], onPressed: () {}, icon: Icon(Hi.gift))
            ],
          ),
          body: ListView(
            padding: Ei.all(20),
            children: [
              Column(
                spacing: 15,
                children: [
                  LzButton(
                    text: 'Show Trainer',
                    icon: Hi.bookOpen02,
                    onTap: () {
                      controller.show();
                    },
                  ),
                  LzButton(
                    text: 'Show Specific Target',
                    icon: Hi.books02,
                    onTap: () {
                      controller.show(3);
                    },
                  )
                ],
              ).start
            ],
          ),
          bottomNavigationBar: Row(
            children: [
              Iconr(Hi.home01, key: keys[2], padding: Ei.all(20)),
              Textr('Bottom Nav', key: keys[3], padding: Ei.all(20))
            ],
          ),
        );
      },
    );
  }
}
