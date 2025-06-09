import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class ButtonView extends StatelessWidget {
  const ButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LzButton'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'LzButton simplifies button creation, allowing you to easily add text, icons, or both, making it versatile for building interactive and customizable buttons.',
          ),
          Row(
            spacing: 15,
            children: [
              LzButton(
                text: 'Basic',
                onTap: () {},
              ),
              LzButton(
                text: 'With Icon',
                icon: Hi.gift,
                onTap: () {},
              ),
              LzButton(
                icon: Hi.paintBucket,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            spacing: 15,
            children: [
              LzButton(
                text: 'Icon as Suffix',
                icon: Hi.acceleration,
                iconStyle: IconStyle(asSuffix: true),
                onTap: () {},
              ),
              LzButton(
                text: 'Primary',
                color: Colors.blue,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            spacing: 15,
            children: [
              LzButton(
                text: 'Warning',
                color: Colors.orange,
                icon: Hi.alert01,
                onTap: () {},
              ),
              LzButton(
                text: 'Bordered',
                border: Br.all(color: Colors.black54),
                textStyle: Gfont.bold,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar:
          LzButton(text: 'Submit', icon: Hi.files01, onTap: () {})
              .margin(blr: 20),
    );
  }
}
