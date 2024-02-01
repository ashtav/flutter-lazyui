import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzCard extends StatelessWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final BoxBorder? border;
  final BorderRadius? radius;
  final Function()? onTap;
  const LzCard({super.key, this.children = const [], this.padding, this.color, this.border, this.radius, this.onTap});

  @override
  Widget build(BuildContext context) {
    bool hasOnTap = onTap != null;

    Widget column = Column(
      children: children,
    ).start;

    return hasOnTap
        ? InkTouch(
            onTap: onTap,
            border: border ?? Br.all(),
            radius: radius ?? Br.radius(5),
            color: color ?? Colors.white,
            child: column,
          )
        : Container(
            padding: padding ?? Ei.all(LazyUi.space),
            decoration:
                BoxDecoration(color: Colors.white, border: border ?? Br.all(), borderRadius: radius ?? Br.radius(5)),
            child: column);
  }
}

class SkeletonView extends StatelessWidget {
  const SkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skeleton'),
      ),
      body: LzListView(
        children: [
          LzCard(
            children: [
              Textr('Custom Skeleton', style: Gfont.bold, margin: Ei.only(b: 5)),
              Text('Try to tap this text to show the skeleton with random size.'),
            ],
          ),

          Column(
            children: [const SizedBox(height: 20), Skeleton()],
          ).start

          // Text(Faker.words(25)),
          // Skeleton(
          //   size: [context.width, 50],
          //   radiusOnly: CustomRadius(tlr: 5),
          //   margin: Ei.only(t: 25),
          // ),
          // Skeleton(
          //   size: [context.width, 15],
          //   radiusOnly: CustomRadius(blr: 5),
          //   margin: Ei.only(t: 5, b: 25),
          // ),
          // const Text('Use skeleton with random size'),
          // Skeleton(
          //   size: [
          //     [50, context.width],
          //     15
          //   ],
          //   radius: 5,
          //   margin: Ei.only(t: 25),
          // ).iterate(3),
          // Container(
          //   padding: Ei.all(20),
          //   margin: Ei.only(t: 25),
          //   decoration: BoxDecoration(
          //       color: Utils.hex('0b1120'), borderRadius: Br.radius(5)),
          //   child: Column(
          //     children: [
          //       Text(
          //         'Use skeleton in the dark mode',
          //         style: Gfont.white,
          //       ).margin(b: 15),
          //       Row(
          //         children: [
          //           Skeleton(
          //             size: 80,
          //             radius: 5,
          //             darkColor: Utils.hex('0b1120'),
          //             margin: Ei.only(r: 15),
          //           ),
          //           Skeleton(
          //             size: [
          //               [50, context.width - 180],
          //               15
          //             ],
          //             radius: 5,
          //             margin: Ei.only(t: 5),
          //             darkColor: Utils.hex('0b1120'),
          //           ).iterate(3),
          //         ],
          //       ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
