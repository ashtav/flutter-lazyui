part of page;

class AnimationView extends StatelessWidget {
  const AnimationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Animate.restartOnHotReload = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: ListView(
        physics: BounceScroll(),
        padding: Ei.all(20),
        children: [
          Textr(
            'Blink Text',
            padding: Ei.only(v: 20),
          ).animate(onPlay: (controller) => controller.repeat(reverse: true)).fade(delay: 100.ms),

          LzBox(
            padding: Ei.zero,
            children: List.generate(3, (i) {
              return InkW(
                onTap: () {},
                padding: Ei.all(20),
                border: Br.only(['t'], except: i == 0),
                child: Row(
                  children: [
                    Text('Slide Text $i'),
                  ],
                ),
              ).animate().fadeIn(duration: 500.ms).slideY(duration: 400.ms, delay: (i * 100).ms, begin: 1);
            }),
          ),

          Container(
                  margin: Ei.only(t: 25),
                  child: LzPopover(
                    color: Colors.black.withOpacity(.8),
                    child: Text(
                      Faker.words(15),
                      style: Gfont.white,
                    ),
                  ))
              .ignore()
              .animate(onPlay: (c) => c.repeat(reverse: true), onComplete: (c) {})
              .moveY(begin: -10, duration: 700.ms, curve: Curves.easeInOutSine),

          Text(
            "Blur Text!",
            style: Gfont.fs20.bold,
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .fadeIn() // uses `Animate.defaultDuration`
              .scale() // inherits duration from fadeIn
              .move(delay: 300.ms, duration: 600.ms) // runs after the above w/new duration
              .blurXY(), // inherits the delay & duration from move

          Text(
            'Text Color',
            style: Gfont.bold,
          ).animate(onPlay: (o) => o.repeat(reverse: true)).tint(color: Colors.purple, delay: 1.s, duration: 1.s),

          Row(
              children:
                  const [Text("This "), Text("Is An "), Text("Animated List")].animate().fadeIn(duration: 500.ms).slideX(duration: 500.ms, begin: 2)),

          Animate(
            onPlay: (o) => o.repeat(reverse: true),
          )
              .custom(
                duration: 10.seconds,
                begin: 10,
                end: 0,
                builder: (_, value, __) => Text(
                  value.round().toString(),
                  style: Gfont.fs(50).bold,
                ),
              )
              .fadeOut(),
        ],
      ),
    );
  }
}
