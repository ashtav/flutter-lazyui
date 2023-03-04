import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AnotherWidgetView extends StatelessWidget {
  const AnotherWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Widgets'),
        centerTitle: true,
      ),
      body: ListView(
        padding: Ei.all(20),
        physics: BounceScroll(),
        children: [
          Textr(
            Faker.random(),
            icon: La.user,
          ),
          const Textr(
            '4,5',
            icon: La.star,
            iconStyle: IconStyle(asSuffix: true),
          ),
          const SizedBox(
            height: 33,
          ),
          const Col(
            children: [
              Badgee(
                text: 'Welcome to LazyUi',
              ),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
          Slidebar(active: 1, size: (int i) => [i == 1 ? 20 : 5, 5]),
          const SizedBox(
            height: 33,
          ),
          const TextDivider(
            Text(
              'Text Line',
            ),
          ),
        ],
      ),
    );
  }
}
