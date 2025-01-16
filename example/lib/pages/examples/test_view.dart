import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Notifier extends ChangeNotifier {
  int active = 0;

  void toggle() {
    active++;

    if (active >= 3) {
      active = 0;
    }

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
            LzTabView(
              tabs: Faker.list.category(15, unique: true),
            ),
            Expanded(
                child: LzListView(
              gap: 25,
              children: [Text(Faker.words(15))],
            ))
          ],
        ));
  }
}
