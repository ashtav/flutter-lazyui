import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class BadgeView extends StatelessWidget {
  const BadgeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badge'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'LzBadge is a simple yet powerful widget for displaying notifications, status indicators, or labels in a visually appealing and customizable way.',
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              LzBadge(
                text: '3',
                color: Lz.color.blue,
                pill: true,
              ),
              LzBadge(
                text: '9+',
                color: Lz.color.green,
                pill: true,
              ),
              LzBadge(
                text: '999+',
                color: Lz.color.orange,
                radius: Br.radius(20),
              ),
              LzBadge(
                icon: Hi.gift,
                pill: true,
                color: Lz.color.lime,
              ),
              LzBadge(
                text: 'New',
                icon: Hi.notification01,
                color: Lz.color.red,
              ),
              LzBadge(
                text: 'Soft Color',
                icon: Hi.coins01,
                color: Lz.color.purple,
                soft: true,
              ),
              LzBadge(
                text: 'With Border',
                icon: Hi.coins01,
                color: Lz.color.azure,
                soft: true,
                border: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
