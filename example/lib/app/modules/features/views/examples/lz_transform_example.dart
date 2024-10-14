import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzTransformExample extends StatefulWidget {
  const LzTransformExample({super.key});

  @override
  State<LzTransformExample> createState() => _LzTransformExampleState();
}

class _LzTransformExampleState extends State<LzTransformExample> {
  double flip = 0;
  double angle = 0;
  double scale = 1;
  Offset offset = const Offset(0, 0);

  @override
  void initState() {
    Utils.timer(() {
      setState(() {
        flip = 1;
        angle = .2;
        scale = .7;
        offset = const Offset(-15, -15);
      });
    }, 500.ms);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      width: 80,
      height: 80,
      decoration:
          BoxDecoration(color: Colors.green, borderRadius: Br.radius(5)),
      child: Center(child: Text('Hai!', style: Gfont.white)),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Transform'),
        ),
        body: LzListView(
          gap: 70,
          padding: Ei.all(35),
          children: [
            Row(
              mainAxisAlignment: Maa.spaceBetween,
              children: [
                Column(
                  children: [
                    LzTransform.flip(flipX: flip, child: child),
                    const Text('LzTransform.flip')
                  ],
                ).gap(15),
                Column(
                  children: [
                    LzTransform.rotate(angle: angle, child: child),
                    const Text('LzTransform.rotate')
                  ],
                ).gap(15),
              ],
            ),
            Row(
              mainAxisAlignment: Maa.spaceBetween,
              children: [
                Column(
                  children: [
                    LzTransform.scale(scale: scale, child: child),
                    const Text('LzTransform.scale')
                  ],
                ).gap(15),
                Column(
                  children: [
                    LzTransform.translate(offset: offset, child: child),
                    const Text('LzTransform.translate')
                  ],
                ).gap(15)
              ],
            ),
          ],
        ));
  }
}
