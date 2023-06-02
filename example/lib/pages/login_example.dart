part of page;

class LoginExampleView extends StatelessWidget {
  const LoginExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Column(
        mainAxisAlignment: Maa.center,
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                width: context.width,
                height: context.height,
                color: Colors.white,
              ),
              Stack(
                children: [
                  LzImage(
                    'https://thumbs.dreamstime.com/b/plastic-trash-can-kitchen-cabinet-bottles-metal-cans-bin-garbage-waste-180787080.jpg',
                    width: context.width,
                    height: context.height,
                    radius: 0,
                  ),
                  Container(
                    width: context.width,
                    height: context.height,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ],
              ).margin(b: 25),
              Poslign(
                alignment: Alignment.bottomLeft,
                child: Col(
                  children: [
                    Textr(
                      'Welcome to LazyUi',
                      style: Gfont.fs(24).bold.white,
                      margin: Ei.only(b: 5),
                    ),
                    Text(
                      Faker.words(20),
                      style: Gfont.white,
                    ).margin(b: 100),
                  ],
                ).padding(all: 20),
              ),
              Poslign(
                alignment: Alignment.bottomCenter,
                child: Col(
                  children: [
                    LzSlidebar(color: Colors.white, activeColor: Colors.white, size: (int i) => [i == 0 ? 20 : 5, 5]).margin(b: 15, t: 25),
                    LzButton(
                      text: 'Continue with phone number',
                      icon: La.mobileAlt,
                      onTap: (state) {},
                    ).border(LzColors.dark).sized(context.width - 40),
                  ],
                ),
              )
            ],
          )),
          Column(
            children: [
              const TextDivider(
                Text(
                  'Or login with',
                ),
                backgroundColor: Colors.white,
              ),
              IntrinsicButton(
                withBorder: false,
                padding: Ei.all(5),
                children: List.generate(
                    2,
                    (i) => LzButton(
                          text: ['Google', 'Facebook'][i],
                          icon: [La.google, La.facebookF][i],
                          onTap: (state) {},
                        )),
              ).margin(all: 15),
            ],
          ).margin(t: 25),
        ],
      )),
    );
  }
}
