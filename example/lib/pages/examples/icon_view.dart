import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class IconView extends StatelessWidget {
  const IconView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iconr'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'Iconr is a combination of Icon and Container widgets, allowing you to easily customize icons with spacing, borders, background color, and alignment. It supports three types of icons: La (Line Awesome), Ti (Tabler Icons), and Hi (Huge Icons), accessed with La.iconName, Ti.iconName, and Hi.iconName respectively.',
          ),
          Row(
            spacing: 20,
            children: [
              Iconr(La.gift,
                  border: Br.all(),
                  padding: Ei.all(15),
                  backgroundColor: Colors.green.applyOpacity(.1),
                  radius: Br.radius(10)),
              Iconr(La.mapMarked,
                  border: Br.all(), padding: Ei.all(15), radius: Br.radius(10)),
              Iconr(La.user),
              Iconr(La.search, flipX: true),
              Iconr(La.search, rotate: .8)
            ],
          ),
          20.height,
          Row(
            spacing: 20,
            children: [
              Iconr(Ti.gift,
                  border: Br.all(),
                  padding: Ei.all(15),
                  backgroundColor: Colors.blue.applyOpacity(.1),
                  radius: Br.radius(10)),
              Iconr(Ti.map2,
                  border: Br.all(), padding: Ei.all(15), radius: Br.radius(10)),
              Iconr(Ti.user),
              Iconr(Ti.search, flipX: true),
              Iconr(Ti.search, rotate: .8)
            ],
          ),
          20.height,
          Row(
            spacing: 20,
            children: [
              Iconr(Hi.gift,
                  border: Br.all(),
                  padding: Ei.all(15),
                  backgroundColor: Colors.orange.applyOpacity(.1),
                  radius: Br.radius(10)),
              Iconr(Hi.mapsLocation01,
                  border: Br.all(), padding: Ei.all(15), radius: Br.radius(10)),
              Iconr(Hi.user),
              Iconr(Hi.search01, flipX: true),
              Iconr(Hi.search01, rotate: .8)
            ],
          ),
        ],
      ),
    );
  }
}
