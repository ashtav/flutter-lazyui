part of page;

class AppIntroNotifier extends ChangeNotifier {
  int index = 0;
  CarouselController carouselController = CarouselController();

  void onChange(int value) {
    index = value;
    notifyListeners();
  }

  // line bar progress
  double width = 0;
  int duration = 5;
  Timer? timer;

  void startTimer(double screenWidth) {
    timer?.cancel();

    try {
      width = 0;
      if (index >= 2) {
        index = 0;
        carouselController.animateToPage(0);
      }

      timer = Timer.periodic(150.ms, (timer) {
        width = (duration * 1000) / screenWidth * timer.tick;
        notifyListeners();

        if (width >= (screenWidth + 20)) {
          carouselController.nextPage();

          timer.cancel();
          startTimer(screenWidth);
        }

        logg(width);
      });
    } catch (e) {
      logg(e);
    }
  }

  void onDispose() {
    timer?.cancel();
    timer = null;
    dispose();
  }
}

/* --------------------------------------------------------------------------
| Example of App Intro
| */

class AppIntro extends StatelessWidget {
  const AppIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AppIntro2());
  }
}

class AppIntro1 extends StatelessWidget {
  const AppIntro1({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = AppIntroNotifier();

    return Center(
      child: Column(
        mainAxisAlignment: Maa.center,
        children: [
          CarouselSlider(
              carouselController: notifier.carouselController,
              options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlayInterval: 5.s,
                  enableInfiniteScroll: false,
                  autoPlay: true,
                  height: 300,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, _) {
                    notifier.onChange(index);
                  },
                  scrollPhysics: BounceScroll()),
              items: List.generate(3, (i) {
                return const LzImage(
                  'https://www.pngarts.com/files/18/Illustration-PNG-HQ-Pic.png',
                  height: 300,
                );
              })),
          Text('Get Organized', style: Gfont.fs20.bold),
          Text(
            Faker.words(15),
            textAlign: Ta.center,
            style: Gfont.muted,
          ).margin(t: 10, b: 25),
          notifier.watch((s) => LzSlidebar(
                active: s.index,
                size: (i) => [i == s.index ? 13 : 7, 7],
              ).margin(b: 45)),
          LzButton(
              radius: 100,
              text: 'Get Started',
              icon: La.arrowRight,
              onTap: (_) {
                _.submit(abortOn: 3.s);
              })
        ],
      ),
    ).padding(all: 25);
  }
}

/* --------------------------------------------------------------------------
| Example of App Intro 2
| */

class AppIntro2 extends StatelessWidget {
  const AppIntro2({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      'https://i.pinimg.com/originals/9a/75/4c/9a754c984978d5778ed7086c780dff0b.jpg',
      'https://craftsonfire.com/wp-content/uploads/2019/10/home-office-1867761_960_720.jpg',
      'https://miro.medium.com/v2/resize:fit:1200/1*pAJ0dPkq_t6q11WLcZ7alg.jpeg'
    ];

    CarouselController carouselController = CarouselController();

    return Col(
      children: [
        Expanded(
          child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlayInterval: 5.s,
                  enableInfiniteScroll: true,
                  height: context.height,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, _) {},
                  scrollPhysics: BounceScroll()),
              items: List.generate(images.length, (i) {
                return LzImage(
                  images[i],
                  width: context.width,
                  radius: 0,
                );
              })),
        ),
        LineProgressIndicator(
          repeat: true,
          duration: 5.s,
          onComplete: () {},
        ),
        Container(
          padding: Ei.all(25),
          child: Col(
            children: [
              Text('Get Organized', style: Gfont.fs20.bold),
              Text(
                Faker.words(15),
                style: Gfont.muted,
              ).margin(t: 10, b: 35),
              Row(
                mainAxisAlignment: Maa.spaceBetween,
                children: [
                  LzSlidebar(
                    active: 0,
                    activeColor: LzColors.orange,
                    size: (i) => [i == 0 ? 13 : 7, 7],
                  ),
                  LzButton(
                      radius: 100,
                      text: 'Get Started',
                      icon: La.arrowRight,
                      onTap: (_) {
                        context.push(const FeaturesView());
                      })
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

/* --------------------------------------------------------------------------
| Example of App Intro 3
| */

class AppIntro3 extends StatelessWidget {
  const AppIntro3({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = AppIntroNotifier();

    return Center(
      child: Column(
        mainAxisAlignment: Maa.center,
        children: [
          const LzImage(
            'https://i.pinimg.com/originals/a4/1d/43/a41d43c058fb7fb526b725980f4a8ea4.gif',
          ).margin(b: 25),
          Text('Get Organized', style: Gfont.fs20.bold),
          Text(
            Faker.words(15),
            textAlign: Ta.center,
            style: Gfont.muted,
          ).margin(t: 10, b: 50),
          Stack(
            children: [
              notifier.watch((s) {
                double value = s.index / 5;
                return CircularValueWidget(
                    value: value,
                    size: 70,
                    backgroundColor: Colors.transparent);
              }),
              Poslign(
                alignment: Alignment.center,
                margin: Ei.all(5),
                child: notifier.watch((s) => InkTouch(
                      onTap: () {
                        int value = notifier.index + 1;
                        notifier.onChange(value >= 6 ? 0 : value);
                      },
                      radius: Br.circle,
                      border: Br.all(
                          color:
                              s.index >= 5 ? Colors.blue : Colors.transparent),
                      color: s.index >= 5 ? Colors.white : Colors.black12,
                      child: Center(
                          child: Icon(
                        s.index >= 5 ? La.check : La.arrowRight,
                      )),
                    )),
              )
            ],
          )
        ],
      ),
    ).padding(all: 25);
  }
}

class CircularValueWidget extends StatefulWidget {
  final double value;
  final double size;
  final Color backgroundColor;
  final Color fillColor;
  final Duration duration;

  const CircularValueWidget({
    Key? key,
    required this.value,
    this.size = 100,
    this.backgroundColor = Colors.grey,
    this.fillColor = Colors.blue,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  State<CircularValueWidget> createState() => _CircularValueWidgetState();
}

class _CircularValueWidgetState extends State<CircularValueWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(begin: widget.value, end: widget.value).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CircularValueWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.reset();
      _controller.forward();
      _animation =
          Tween<double>(begin: oldWidget.value, end: widget.value).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return CustomPaint(
            painter: _CircularValuePainter(
              value: _animation.value,
              backgroundColor: widget.backgroundColor,
              fillColor: widget.fillColor,
            ),
          );
        },
      ),
    );
  }
}

class _CircularValuePainter extends CustomPainter {
  final double value;
  final Color backgroundColor;
  final Color fillColor;

  _CircularValuePainter({
    required this.value,
    required this.backgroundColor,
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;
    const strokeWidth = 5.0;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final fillPaint = Paint()
      ..color = fillColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw fill arc
    const startAngle = -math.pi / 2;
    final sweepAngle = value * 2 * math.pi;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularValuePainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.fillColor != fillColor;
  }
}
