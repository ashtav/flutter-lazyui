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
          onScroll: (scroller) {
            double pixels = scroller.position.pixels;
            LzState.set('#pixel', pixels);

            bool isMaxScrolled = (pixels + 150) >= scroller.position.maxScrollExtent;
            if (isMaxScrolled) {
              // Load more data
            }
          },
          scrollLimit: const [50, 100],
          onRefresh: () => LzToast.show('List refreshed successfully!'),
          refreshType: RefrehtorType.curve,
          children: [
            const Textml(
                    '<b>LzListView</b> is a versatile Flutter widget that simplifies the creation of scrollable lists with various features such as scroll limits, custom scroll controllers, and automatic caching. It allows you to quickly create scrollable lists of child widgets and provides options for customizing the scrolling behavior and appearance.')
                .margin(b: 25),

            const Text('Scroll limit, top: 50, bottom: 100'),
            LzState.watch('#pixel', 0.0, (value) => Text('Scroll pixels: $value')), // watch scroll pixels
          ],
        ));
  }
}
