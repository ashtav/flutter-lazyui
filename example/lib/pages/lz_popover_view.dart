part of page;

class PopoverView extends StatelessWidget {
  const PopoverView({super.key});

  @override
  Widget build(BuildContext context) {
    final gkey = GlobalKey(), gkey2 = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popover'),
        actions: [IconButton(key: gkey, onPressed: () {}, icon: const Icon(La.user))],
      ),
      body: LzListView(
        children: [
          Textr(
            'Display the popup based on the widget\'s position, but you can control the position of the caret.',
            margin: Ei.only(b: 25),
          ),
          LzButton(
            text: 'Open Popover',
            onTap: (_) {
              LzPopover(
                color: Colors.black.withOpacity(.8),
                caretAlign: Position.top,
                child: Text(
                  Faker.words(15),
                  style: Gfont.white,
                ),
              ).show(gkey.context!,
                  builder: (child) => child
                      .ignore()
                      .animate(onPlay: (c) => c.repeat(reverse: true), onComplete: (c) {})
                      .moveY(begin: -10, duration: 700.ms, curve: Curves.easeInOutSine));
            },
          ),
          LzImage(
            'https://miro.medium.com/v2/resize:fit:1200/1*pAJ0dPkq_t6q11WLcZ7alg.jpeg',
            key: gkey2,
          ).margin(t: 15).onTap(() {
            LzPopover(
              color: Colors.black.withOpacity(.8),
              caretAlign: Position.top,
              child: Text(
                Faker.words(15),
                style: Gfont.white,
              ),
            ).show(gkey2.context!,
                isAtBottom: true,
                builder: (child) => child
                    .ignore()
                    .animate(onPlay: (c) => c.repeat(reverse: true), onComplete: (c) {})
                    .moveY(begin: -10, duration: 700.ms, curve: Curves.easeInOutSine));
          }),
        ],
      ),
    );
  }
}
