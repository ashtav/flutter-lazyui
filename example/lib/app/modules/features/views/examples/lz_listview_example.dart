import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzListViewExample extends StatelessWidget {
  const LzListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('LzListView Example'),
        ),
        body: LzListView(
          onScroll: (scroll) {
            double pixels = scroll.pixels;

            bool isMaxScrolled = (pixels + 150) >= scroll.max;
            if (isMaxScrolled) {
              // Load more data
            }

            // detect scroll direction
            // logg(scroll.direction);

            // or use the built-in atBottom method
            // bool isMaxScrolled = scroll.atBottom(150);
            // if (isMaxScrolled) {
            //   LzToast.show('Loading more data...');
            // }
          },
          scrollLimit: const [70, 130],
          onRefresh: () => LzToast.show('List refreshed successfully!'),
          refreshType: RefrehtorType.curve,
          children: [
            const Textml(
                    '<b>LzListView</b> is a versatile Flutter widget that simplifies the creation of scrollable lists with various features such as scroll limits, custom scroll controllers, and automatic caching. It allows you to quickly create scrollable lists of child widgets and provides options for customizing the scrolling behavior and appearance.')
                .margin(b: 25),

            const Text('Scroll limit, top: 50, bottom: 100'),

            const Text('Scroll pixels: 1'), // watch scroll pixels

            Textr(Faker.words(25, 10),
                border: Br.only(['t']),
                padding: Ei.only(t: 50),
                margin: Ei.only(t: 20))
          ],
        ));
  }
}
