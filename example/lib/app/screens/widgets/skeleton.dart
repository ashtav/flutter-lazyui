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
  void initState() {
    super.initState();
    setLoading();
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
              const Textml(
                      'Random size of skeleton, <p color="888">[[170, 290], [15, 50]]</p>')
                  .margin(b: 15),
              const Skeleton(size: [
                [170, 290],
                [15, 50]
              ]),
              const SizedBox(height: 45),
              const Textml(
                      'Color & Dark Mode, <p color="888">Skeleton.dark()</p>')
                  .margin(b: 15),
              Skeleton(
                  color: Colors.orange,
                  highlight: Colors.orange.withOpacity(.3),
                  size: [
                    [170, context.width]
                  ]).margin(b: 5),
              Skeleton.dark(size: [
                [170, context.width]
              ]).iterate(2, gap: 5)
            ],
          ).start,
          const SizedBox(height: 45),
          const Textml(
                  'List widget extension, <p color="888">[].skeleton(true, [CustomSkeleton()])</p>')
              .margin(b: 15),
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
                      decoration: BoxDecoration(
                          color: Colors.black12, borderRadius: Br.radius(5)),
                      child: const Icon(Ti.settings, size: 25),
                    ),
                    Column(
                      children: [
                        Text('Custom Skeleton', style: Gfont.bold),
                        Text(
                            'Tap this text to show the skeleton with random size.',
                            style: Gfont.muted),
                      ],
                    ).start.gap(5).lz.flexible()
                  ],
                )
              ].skeleton(isLoading, [
                Row(
                  children: [
                    const Skeleton(size: 72).margin(r: 15),
                    Column(
                      children: [
                        const Skeleton(size: [
                          [50, 150]
                        ]),
                        Skeleton(size: [
                          [180, context.width]
                        ]).iterate(2, gap: 5),
                      ],
                    ).start.gap(5).lz.flexible()
                  ],
                )
              ])),
          const SizedBox(height: 45),
          const Textml(
                  'Widget extension, <p color="888">MyWidget().lz.skeleton(true)</p>')
              .margin(b: 15),
          Textr(Faker.words(13), icon: Ti.infoCircle).lz.skeleton(
              isLoading,
              Skeleton(size: [
                [180, context.width]
              ]).iterate(2, gap: 5))
        ]));
  }
}
