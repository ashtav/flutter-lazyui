import 'package:example/pages/widgets/example_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TextCountView extends StatelessWidget {
  const TextCountView({super.key});

  @override
  Widget build(BuildContext context) {
    final end = now.microsecond.toDouble() * 3;

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TextCount'),
          actions: [LzThemeAction()],
        ),
        body: LzListView(
          padding: Ei.all(20),
          gap: 25,
          children: [
            const ExampleLabel(
              description:
                  'LzTextCount is an animated widget that visually counts numbers from a starting value to a target value, offering smooth transitions and customizable styles.',
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text('Count from 0 to $end = '),
                    TextCounter(
                      begin: 0,
                      end: end,
                      duration: 7.s,
                      separator: ',',
                      style: Gfont.bold.fs20,
                    )
                  ],
                ),
                Text('LzTextCount(begin: 0, end: $end, separator: \',\')',
                    style: Gfont.fs14.orange)
              ],
            ).start
          ],
        ),
      ),
    );
  }
}
