import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Notifier extends ChangeNotifier {
  int active = 0;
  bool show = false;

  void toggle() {
    active++;

    if (active >= 3) {
      active = 0;
    }

    show = !show;
    notifyListeners();
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Labs'),
          actions: [
            LzThemeAction(),
            IconButton(
                onPressed: () {
                  notifier.toggle();
                },
                icon: Icon(Hi.gift))
          ],
        ),
        body: Column(
          children: [
            Text(
              'Headlines',
              style: Gfont.bold,
            ),
            // Text(Faker.words(15), style: context.font.muted), // context.font.muted
            Text(
              Faker.words(15),
              style: Gfont.muted,
            ),
            Text(Faker.words(15)),
          ],
        ).start.gap(15).margin(all: 20));
  }
}
