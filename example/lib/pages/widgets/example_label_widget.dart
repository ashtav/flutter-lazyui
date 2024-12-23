import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ExampleLabel extends StatelessWidget {
  final String? description;
  const ExampleLabel({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          description ?? '',
          style: Gfont.muted.theme(context, '777'.hex),
        ),
        const SizedBox(height: 30),
        Textr('Overview',
            style: Gfont.green, icon: Hi.file01, border: Br.only(['b']), width: context.width, padding: Ei.sym(v: 10)),
        const SizedBox(height: 25),
      ],
    ).start;
  }
}
