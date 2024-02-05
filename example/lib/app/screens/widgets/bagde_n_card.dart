import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class BadgeNCardView extends StatelessWidget {
  const BadgeNCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge and Card'),
      ),
      body: LzListView(
        children: [
          Column(
            children: [
              const Textml('<b>LzBadge</b> is a simple widget to create a badge with text and icon.').margin(b: 15),

              const LzBadge(
                'Hello World',
                color: Colors.orange,
                icon: Ti.message2,
              ).margin(b: 5),
              const LzBadge(
                'Verified',
                color: Colors.green,
                icon: Ti.checks,
                softColor: true,
              ),
              const SizedBox(height: 50),

              // see card example in tabler
              const Textml('<b>LzCard</b> is a simple widget to create a card with multiple children.').margin(b: 15),

              LzCard(
                gap: 5,
                children: [Text('Card Example', style: Gfont.bold), Text(Faker.words(13))],
              ),
              const SizedBox(height: 15),

              LzCard(
                gap: 5, stacked: true,
                children: [Text('Stacked Card', style: Gfont.bold), Text(Faker.words(13))],
              )
            ],
          ).start
        ],
      ),
    );
  }
}
