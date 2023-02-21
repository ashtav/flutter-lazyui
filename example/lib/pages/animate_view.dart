import 'package:example/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lazyui/lazyui.dart';

class AnimateView extends StatelessWidget {
  const AnimateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
        centerTitle: true,
      ),
      body: ListView(
        physics: BounceScroll(),
        padding: Ei.all(20),
        children: [
          Animate(
            effects: const [FadeEffect(), ScaleEffect()],
            child: Text("Hello World!"),
          ),
          Text("Hello World!").animate().fade().scale(),

          Text("Hello").animate().fade(duration: 500.ms).scale(delay: 500.ms), // runs after fade.

          Text("Hello World!")
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms) // runs after the above w/new duration
              .blurXY(), // inherits the delay & duration from move

          Text("Hello")
              .animate(
                delay: 1000.ms, // this delay only happens once at the very start
                onPlay: (controller) => controller.repeat(), // loop
              )
              .fadeIn(delay: 500.ms),

          // an opacity of 1 is "neutral"
          Text("Hello").animate().fade(), // begin=0, end=1
          Text("Hello").animate().fade(begin: 0.5), // end=1
          Text("Hello").animate().fade(end: 0.5), // begin=1
          Text('Hello').animate().tint(color: Colors.purple),

          Text("Hello")
              .animate()
              .fadeIn(duration: 600.ms)
              .then(delay: 200.ms) // baseline=800ms
              .slide(),

          Column(
              children: AnimateList(
            interval: 400.ms,
            effects: [FadeEffect(duration: 300.ms)],
            children: [Text("Hello"), Text("World"), Text("Goodbye")],
          )),

// or shorthand:
          Column(
            children: [Text("Hello"), Text("World"), Text("Goodbye")].animate(interval: 400.ms).fade(duration: 300.ms),
          ),

// then:
          Text("Hello World").animate().custom(
              duration: 500.ms,
              builder: (context, value, child) => Container(
                    color: Color.lerp(Colors.red, Colors.blue, value),
                    padding: EdgeInsets.all(8),
                    child: child, // child is the Text widget being animated
                  )),

          Animate()
              .custom(
                duration: 10.seconds,
                begin: 10,
                end: 0,
                builder: (_, value, __) => Text(value.round().toString()),
              )
              .fadeOut(),

          Animate().toggle(
            duration: 2.seconds,
            builder: (_, value, __) => Text(value ? "Before" : "After"),
          ),

          Text("Before").animate().swap(duration: 900.ms, builder: (_, child) => Text("After")),

          Text("Hello").animate().fadeIn(duration: 600.ms).callback(duration: 1300.ms, callback: (_) => logg('halfway')),

          InkW(
              onTap: () {},
              padding: Ei.sym(v: 15, h: 20),
              color: Colors.blueAccent,
              margin: Ei.only(t: 10),
              radius: Br.radius(5),
              child: Text(
                'Tap Me',
                style: Gfont.color(Colors.white),
              )).animate().shake(duration: Duration(seconds: 12))
        ],
      ),
    );
  }
}
