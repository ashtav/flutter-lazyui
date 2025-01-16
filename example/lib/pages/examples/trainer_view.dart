import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class TrainerView extends StatelessWidget {
  const TrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    final targets = [
      Target(content: Faker.words(20)),
      Target(content: Faker.words(20)),
      Target(content: Faker.words(20), align: ContentAlign.top),
      Target(
          content: Faker.words(20),
          align: ContentAlign.top,
          shape: ShapeLightFocus.rRect),
    ];

    final trainer = TrainerController();

    return Trainer(
      targets: targets,
      controller: trainer,
      builder: (keys) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Trainer'),
            actions: [
              LzThemeAction(),
              IconButton(
                  key: keys[1], onPressed: () {}, icon: Icon(Hi.archive)),
              IconButton(key: keys[0], onPressed: () {}, icon: Icon(Hi.gift))
            ],
          ),
          body: ListView(
            padding: Ei.all(20),
            children: [
              const ExampleLabel(
                description:
                    'Trainer is a versatile and interactive widget designed for guiding users through targeted onboarding or feature tours. It provides a highly customizable experience with support for defining steps, controlling navigation, and managing user interactions seamlessly.',
              ),
              Column(
                spacing: 15,
                children: [
                  LzButton(
                    text: 'Show Trainer',
                    icon: Hi.bookOpen02,
                    outlined: true,
                    onTap: () {
                      trainer.show();
                    },
                  ),
                  LzButton(
                    text: 'Show Specific Target',
                    icon: Hi.books02,
                    outlined: true,
                    onTap: () {
                      trainer.show(2);
                    },
                  )
                ],
              ).start
            ],
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Iconr(Hi.home01, key: keys[2], padding: Ei.all(20)),
                Textr('Bottom Nav', key: keys[3], padding: Ei.all(20))
              ],
            ),
          ),
        );
      },
    );
  }
}
