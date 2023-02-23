import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LaziconView extends StatelessWidget {
  const LaziconView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lazicon'),
        centerTitle: true,
      ),
      body: ListView(
        physics: BounceScroll(),
        children: [
          Wrap(
            children: List.generate(16, (i) {
              return Container(
                width: (context.width / 4),
                decoration: BoxDecoration(border: Br.only([i < 4 ? '' : 't', 'r'])),
                padding: Ei.all(15),
                height: 160,
                child: Center(
                    child: Column(children: [
                  Lazicon.get(LaziconType.nodata),
                  Textr(
                    'LaziconType.nodata',
                    style: Gfont.fs14.muted,
                    margin: Ei.only(t: 10),
                  )
                ])),
              );
            }),
          )
        ],
      ),
    );
  }
}
