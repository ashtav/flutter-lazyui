import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzTransitionExample extends StatefulWidget {
  const LzTransitionExample({super.key});

  @override
  State<LzTransitionExample> createState() => _LzTransitionExampleState();
}

class _LzTransitionExampleState extends State<LzTransitionExample> {
  bool active = true;

  void toggle() {
    active = !active;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget child(String text) => Container(
          padding: Ei.sym(v: 13, h: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: Br.radius(4),
              border: Br.all()),
          child: Text(text),
        );

    return Scaffold(
        appBar: AppBar(
          title: const Text('Animate'),
          actions: [
            IconButton(
                onPressed: () {
                  toggle();
                },
                icon: Icon(active ? Ti.toggleRight : Ti.toggleLeft)),
            IconButton(
                onPressed: () {
                  context.bottomSheet(const Test());
                },
                icon: const Icon(Ti.gift))
          ],
        ),
        body: LzListView(
          gap: 10,
          children: [
            Textr('YourWidget().lz.animate.slideUp();',
                style: Gfont.fs15.white,
                color: Colors.black54,
                padding: Ei.sym(v: 10, h: 20),
                radius: Br.radius(5)),
            Textr('SlideAnimate(child: YourWidget());',
                style: Gfont.fs15.white,
                color: Colors.black54,
                padding: Ei.sym(v: 10, h: 20),
                radius: Br.radius(5)),
            15.height,
            child('Bottom to Top').lz.animate.slideUp(show: active, delay: 200),
            child('Top to Bottom')
                .lz
                .animate
                .slideDown(show: active, delay: 200),
            child('Left to Right')
                .lz
                .animate
                .slideRight(show: active, delay: 200),
            child('Right to Left')
                .lz
                .animate
                .slideLeft(show: active, delay: 200),
            25.height,
            Row(
              children: [
                RippleAnimation(
                  repeat: true,
                  bordered: true,
                  color: Colors.blueAccent,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent, shape: BoxShape.circle),
                    child:
                        const Center(child: Icon(Ti.user, color: Colors.white)),
                  ),
                ),
                const Text('Typing')
                    .lz
                    .animate
                    .typing(length: 5, duration: 2.s, character: '. '),
              ],
            ).gap(25),
            25.height,
          ],
        ));

    // Text('Hello').lz.animate.slideUp()
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 250,
      padding: Ei.all(20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Text(Faker.words(), style: Gfont.bold).lz.animate.slideUp(delay: 150),
          Text(Faker.words(35)).lz.animate.slideUp(delay: 250)
        ],
      ).gap(15).start,
    );
  }
}
