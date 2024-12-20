import 'package:example/pages/widgets/dark_mode_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

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
          Text(
            'LzButton simplifies button creation, allowing you to easily add text, icons, or both, making it versatile for building interactive and customizable buttons.',
            style: Gfont.muted.theme(context, '777'.hex),
          ),
          const SizedBox(height: 30),
          Textr('Example', style: Gfont.green, icon: Hi.file01),
          const SizedBox(height: 15),
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
      bottomNavigationBar: DarkModeWidget(),
    );
  }
}
