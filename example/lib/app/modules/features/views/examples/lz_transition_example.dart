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
                icon: Icon(active ? Ti.toggleRight : Ti.toggleLeft))
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
            child('Bottom to Top').lz.animate.slideUp(show: active),
            child('Top to Bottom').lz.animate.slideDown(show: active),
            child('Left to Right').lz.animate.slideRight(show: active),
            child('Right to Left').lz.animate.slideLeft(show: active),
          ],
        ));

    // Text('Hello').lz.animate.slideUp()
  }
}
