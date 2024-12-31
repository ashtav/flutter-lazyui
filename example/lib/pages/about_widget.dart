import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../data/features.dart';

class AboutLazyUi extends StatelessWidget {
  const AboutLazyUi({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> featuress() {
      return features
          .expand((group) => group.features) // Flatten all features into a single iterable
          .map((feature) => feature.label) // Extract the labels
          .toList(); // Convert to a list
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 25,
            children: [
              Text(
                'LazyUi is a Flutter package created to simplify and speed up app development. It provides a collection of widgets, components, and utilities that help developers build apps quickly and efficiently.',
              ),
              Text(
                'The core idea of LazyUi is brevity. Widgets and utilities have short, intuitive names, reducing boilerplate code and making development smoother and easier to understand.',
              ),
              Text(
                'With LazyUi, you get ready-made components like buttons, cards, grids, and utilities for tasks like spacing and alignment. It’s designed to make development faster while maintaining flexibility.',
              ),
              Column(
                spacing: 15,
                children: [
                  Text('Features (${featuress().length})'),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: featuress().generate((e, i) {
                      return LzBadge(
                        text: e,
                        color: Colors.primaries[i % Colors.primaries.length],
                        soft: true,
                      );
                    }),
                  )
                ],
              ).start,
            ],
          )
        ],
      ),
    );
  }
}
