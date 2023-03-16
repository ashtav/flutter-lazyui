import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lazyui/lazyui.dart';

class AnimateView extends StatelessWidget {
  const AnimateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
        centerTitle: true,
      ),
      body: ListView(
        physics: BounceScroll(),
        padding: Ei.all(20),
        children: [
          // Blink
          const Text("Blink Text")
              .animate(
                onPlay: (controller) => controller.repeat(), // loop
              )
              .fade(delay: 500.ms),

          Container(
            margin: Ei.sym(v: 20),
            decoration: BoxDecoration(borderRadius: Br.radius(5), color: Colors.white, border: Br.all()),
            child: Col(
              children: List.generate(3, (i) {
                return Textr(
                  Lipsum.createWord(5).ucwords,
                  border: Br.only(['t'], except: i == 0),
                  padding: Ei.sym(v: 20, h: 20),
                  width: context.width,
                ).animate(delay: ((i + 1) * 100).ms).slideY(duration: 400.ms);
              }),
            ),
          ),

          Text(
            "Hello World!",
            style: Gfont.fs20.bold,
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms) // runs after the above w/new duration
              .blurXY(), // inherits the delay & duration from move

          // an opacity of 1 is "neutral"
          const Text("Hello").animate().fade(), // begin=0, end=1
          const Text("Hello").animate().fade(begin: 0.5), // end=1
          const Text("Hello").animate().fade(end: 0.5), // begin=1
          const Text('Hello').animate().tint(color: Colors.purple),

          const Text("Hello")
              .animate()
              .fadeIn(duration: 600.ms)
              .then(delay: 200.ms) // baseline=800ms
              .slide(),

          Column(
              children: AnimateList(
            interval: 400.ms,
            effects: [FadeEffect(duration: 300.ms)],
            children: const [Text("Hello"), Text("World"), Text("Goodbye")],
          )),

// or shorthand:
          Column(
            children: const [Text("Hello"), Text("World"), Text("Goodbye")].animate(interval: 400.ms).fade(duration: 300.ms),
          ),

// then:
          const Text("Hello World").animate().custom(
              duration: 500.ms,
              builder: (context, value, child) => Container(
                    color: Color.lerp(Colors.red, Colors.blue, value),
                    padding: const EdgeInsets.all(8),
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

          const Text("Before").animate().swap(duration: 900.ms, builder: (_, child) => const Text("After")),

          const Text("Hello").animate().fadeIn(duration: 600.ms).callback(duration: 1300.ms, callback: (_) => logg('halfway')),

          InkW(
              onTap: () {},
              padding: Ei.sym(v: 15, h: 20),
              color: Colors.blueAccent,
              margin: Ei.only(t: 10),
              radius: Br.radius(5),
              child: Text(
                'Tap Me',
                style: Gfont.color(Colors.white),
              )).animate().shake(duration: const Duration(seconds: 12))
        ],
      ),
    );
  }
}
