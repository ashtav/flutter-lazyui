import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ExampleLabel extends StatelessWidget {
  const ExampleLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Textr('Example',
            style: Gfont.green,
            icon: Hi.file01,
            width: context.width,
            padding: Ei.sym(v: 5, h: 10),
            color: Colors.green.applyOpacity(.1)),
        const SizedBox(height: 15),
      ],
    ).start;
  }
}
