import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class TextView extends StatelessWidget {
  const TextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Textr'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          Text(
            'Textr is combination of Text and Container widgets, allowing you to easily add text with icon, spacing, border, etc.',
            style: Gfont.muted.theme(context, '777'.hex),
          ),
          const ExampleLabel(),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              Textr('Text with icon', icon: Hi.user),
              Textr(
                'Bordered Text',
                icon: Hi.archive,
                border: Br.all(),
                padding: Ei.sym(v: 10, h: 20),
              ),
              Textr(Faker.words(10),
                  width: 250, icon: Hi.alertSquare, color: Colors.blue.applyOpacity(.1), padding: Ei.all(20)),
              Textr(Faker.words(30), color: Colors.orange.applyOpacity(.1), padding: Ei.all(20))
            ],
          ),
        ],
      ),
    );
  }
}
