import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'LzCard is a customizable widget for displaying content in a card-like layout with rounded corners, padding, and elevation for a clean, structured design.',
          ),
          LzCard(
            children: [
              Text('Simple Card', style: Gfont.bold),
              Text(Faker.words(10))
            ],
          ),
          const SizedBox(height: 15),
          LzCard(
            onTap: () {},
            style: LzCardStyle(stacked: true, stackAlign: StackAlign.top),
            children: [
              Text('Stacked Card', style: Gfont.bold),
              Text(Faker.words(10))
            ],
          ),
          const SizedBox(height: 15),
          LzCard(
            onTap: () {},
            style: LzCardStyle(
                stacked: true,
                stackAlign: StackAlign.top,
                icon: Icon(
                  Hi.gift,
                  color: context.isDarkMode ? Colors.white10 : Colors.black12,
                  size: 70,
                )),
            children: [
              Text('Background Icon', style: Gfont.bold),
              Text(Faker.words(10))
            ],
          )
        ],
      ),
    );
  }
}
