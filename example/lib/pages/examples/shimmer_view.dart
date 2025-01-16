import 'package:example/pages/widgets/example_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ShimmerView extends StatelessWidget {
  const ShimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shimmer'),
          actions: [LzThemeAction()],
        ),
        body: LzListView(
          padding: Ei.all(20),
          gap: 25,
          children: [
            const ExampleLabel(
              description:
                  'Shimmer is a versatile widget for creating loading placeholders with a smooth gradient shimmer effect, enhancing user experience while content is being loaded.',
            ),
            Column(
              spacing: 50,
              children: [
                Column(
                  children: [
                    Text('Shimmer()', style: Gfont.fs14.orange),
                    Shimmer(),
                  ],
                ).start.gap(15),

                //
                Column(
                  children: [
                    Text('Shimmer with width and height set to 100',
                        style: Gfont.fs14),
                    Text('Shimmer(size: 100)', style: Gfont.fs14.orange),
                    Shimmer(size: 100),
                  ],
                ).start.gap(15, except: [0]),

                //
                Column(
                  children: [
                    Text(
                        'Shimmer with width set to 100, height is default (15)',
                        style: Gfont.fs14),
                    Text('Shimmer(size: [100])', style: Gfont.fs14.orange),
                    Shimmer(size: [100]),
                  ],
                ).start.gap(15, except: [0]),

                //
                Column(
                  children: [
                    Text('Shimmer with width 100 and height 35',
                        style: Gfont.fs14),
                    Text('Shimmer(size: [100, 35])', style: Gfont.fs14.orange),
                    Shimmer(size: [100, 35]),
                  ],
                ).start.gap(15, except: [0]),

                //
                Column(
                  children: [
                    Text(
                        'Shimmer with width randomized between 50 and 300, height is default (15)',
                        style: Gfont.fs14),
                    Text('Shimmer(size: [[50, 300]])',
                        style: Gfont.fs14.orange),
                    Shimmer(size: [
                      [50, 300]
                    ]),
                  ],
                ).start.gap(15, except: [0])
              ],
            ).start
          ],
        ),
      ),
    );
  }
}
