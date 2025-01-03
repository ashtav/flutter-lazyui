import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class ListViewView extends StatelessWidget {
  const ListViewView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ListView'),
          actions: [LzThemeAction()],
        ),
        body: LzListView(
          gap: 25,
          onScroll: notifier.onScroll,
          children: [
            const ExampleLabel(
              description:
                  'LzListView is a customizable list view widget with features like scroll limits, refresh support, and item spacing, tailored for dynamic and interactive layouts.',
            ),
            Text(Faker.words(15)),
            Text(Faker.words(25)),
            Text(
              'Monitor scroll position easily with LzListView by using the onScroll callback, e.g., LzListView(onScroll: (scroll) {})',
              style: Gfont.orange,
            ),
            notifier.watch((state) => Column(
                  children: [
                    Text('is scrolled : ${state.isScrolled}'),
                    Text('pixels : ${state.pixels}'),
                  ],
                ).start)
          ],
        ),
      ),
    );
  }
}

class Notifier extends ChangeNotifier {
  bool isScrolled = false;
  double pixels = 0;

  void onScroll(Scroller scroll) {
    isScrolled = scroll.pixels > 0 || scroll.pixels < 0;
    pixels = scroll.pixels;
    notifyListeners();
  }
}
