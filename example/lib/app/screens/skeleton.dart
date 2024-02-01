import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class SkeletonView extends StatefulWidget {
  const SkeletonView({super.key});

  @override
  State<SkeletonView> createState() => _SkeletonViewState();
}

class _SkeletonViewState extends State<SkeletonView> {
  bool isLoading = false;

  void setLoading() {
    setState(() {
      isLoading = !isLoading;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = !isLoading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Skeleton'),
        ),
        body: LzListView(children: [
          Column(
            children: [
              const Textml('Random size of skeleton, <p color="888">Dimen.range(w: [170, 290], h: [15, 50])</p>')
                  .margin(b: 15),
              Skeleton(size: Dimen.range(w: [170, 290], h: [15, 50])),
              const SizedBox(height: 20),
              const Textml('Color').margin(b: 15),
              Skeleton(
                  color: Colors.orange,
                  highlight: Colors.orange.withOpacity(.3),
                  size: Dimen.range(w: [170, context.width])).margin(b: 25),
              const Textml('Dark Mode, <p color="888">Skeleton.dark()</p>').margin(b: 15),
              Skeleton.dark(size: Dimen.range(w: [170, context.width])).iterate(2, gap: 5)
            ],
          ).start,
          const SizedBox(height: 20),
          const Textml('List widget extension, <p color="888">[].skeleton(true, [CustomSkeleton()])</p>').margin(b: 15),
          LzCard(
              onTap: () => setLoading(),
              gap: 5,
              children: [
                Row(
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      margin: Ei.only(r: 15),
                      decoration: BoxDecoration(color: Colors.black12, borderRadius: Br.radius(5)),
                      child: const Icon(Ti.settings, size: 25),
                    ),
                    Column(
                      children: [
                        Text('Custom Skeleton', style: Gfont.bold),
                        Text('Try to tap this text to show the skeleton with random size.', style: Gfont.muted),
                      ],
                    ).start.gap(5).lz.flexible()
                  ],
                )
              ].skeleton(isLoading, [
                Row(
                  children: [
                    Skeleton(size: Dimen.all(72)).margin(r: 15),
                    Column(
                      children: [
                        Skeleton(size: Dimen.range(w: [50, 150])),
                        Skeleton(size: Dimen.range(w: [180, context.width])).iterate(2, gap: 5),
                      ],
                    ).start.gap(5).lz.flexible()
                  ],
                )
              ])),
        ]));
  }
}
