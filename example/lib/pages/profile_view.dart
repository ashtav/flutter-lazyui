part of page;

String imageUrl = 'https://raw.githubusercontent.com/ashtav/assets/master/avatar/11.jpg';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return LzProfile(
      snap: true,
      header: LzProfileHeader(
          avatar: imageUrl,
          name: 'Ashta',
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(La.qrcode, color: Colors.white)),
            IconButton(onPressed: () {}, icon: const Icon(La.cog, color: Colors.white)),
          ],
          floatingButton: LzProfileFloatingButton(
            onTap: () {},
          )),
      children: [
        Textr(
          'Account',
          icon: La.user,
          style: Gfont.bold,
          padding: Ei.all(20),
        ),
        Col(
          children: List.generate(3, (i) {
            List<String> labels = ['Tap to change your phone number', 'Username', 'Bio'],
                values = ['+62 8123 6000 000', '@ashta', 'As a Software Engineer, who needs a social life when you can debug alone all night? '];

            return InkW(
              onTap: () {},
              padding: Ei.all(20),
              border: Br.only(['t']),
              child: Row(
                children: [
                  Col(
                    children: [
                      Text(values[i]),
                      Text(
                        labels[i],
                        style: Gfont.muted,
                      ),
                    ],
                  ).flexible(),
                ],
              ),
            );
          }),
        ),
        Textr(
          'Photos (7)',
          icon: La.image,
          style: Gfont.bold,
          padding: Ei.all(20),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: Ei.sym(h: 20),
          physics: BounceScroll(),
          child: Row(
            children: List.generate(7, (i) {
              List<String> images = [
                'https://post.medicalnewstoday.com/wp-content/uploads/sites/3/2020/02/325466_1100-800x825.jpg',
                'https://desksguide.com/wp-content/uploads/2022/10/Best-Desk-Setup-for-Programming.png',
                'https://storage.googleapis.com/ekrutassets/blogs/images/000/007/026/original/H1_UIUX_Designer.jpg',
                'https://lirp.cdn-website.com/f7363214/dms3rep/multi/opt/ux-designer-640w.jpeg',
                'https://fz-wp-cdn.s3.amazonaws.com/wp-content/uploads/2018/12/26193321/Depositphotos_19526117_l-2015.jpg',
                'https://dayviolins.com/wp-content/uploads/Untitled-design-27.png',
                'https://media.istockphoto.com/id/1128444660/photo/young-successful-artist-in-art-workshop-studio.jpg?s=1024x1024&w=is&k=20&c=HypAfh0RwHsBnpX8LgAlNXx1hw6yQbkta7efMpPnPZI='
              ];

              return LzImage(
                images[i],
                size: 80,
              ).margin(l: i == 0 ? 0 : 8);
            }),
          ),
        ),
        Textr(
          Faker.words(40, 3),
          padding: Ei.all(20),
        ),
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final ProfileNotifier notifier;
  const ProfileHeader({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return notifier.watch((state) {
      bool hasMedium = state.position == 2 || state.position == 1;
      bool hasSmall = state.frameHeight < 120;

      Widget image = LzImage(
        state.header.avatar,
        radius: 0,
        width: context.width,
        height: state.frameHeight,
      );

      double f = state.frameHeight;

      // set image size based on scroll value
      // interpolasi linier dan normalisasi
      double inSizes([double defaultValue = 70, finalValue = 20, bool increase = false]) {
        if (f > 200) {
          return defaultValue;
        }

        double normalized = ((f <= 130 ? 130 : f) - 1) / (200 - 1);
        double sizeRange = defaultValue - finalValue;
        double inverse = 1 - normalized;

        // Menyesuaikan perhitungan berdasarkan parameter increase
        if (increase) {
          return defaultValue + (inverse * sizeRange);
        } else {
          return defaultValue - (inverse * sizeRange);
        }
      }

      return Stack(
        children: [
          GestureDetector(
            onVerticalDragUpdate: (details) => state.onImageDragUpdate(details),
            child: Container(
              color: LzColor.black,
              height: notifier.frameHeight,
              width: context.width,
              child: Stack(
                children: [
                  image.blur(context, sigmaX: 35, sigmaY: 35, show: hasMedium).clip(),
                  Positioned(
                      bottom: inSizes(20, -10),
                      left: f > 200 ? 20 : inSizes(20, 150),
                      child: Row(
                        mainAxisAlignment: Maa.center,
                        children: [
                          AnimatedContainer(
                            duration: 350.ms,
                            curve: Curves.linearToEaseOut,
                            width: hasMedium ? inSizes(70, 10) : 0,
                            height: hasMedium ? inSizes(70, 10) : 0,
                            margin: Ei.only(r: hasMedium ? 15 : 0),
                            child: LzImage(
                              state.header.avatar,
                              radius: 50,
                            ),
                          ),
                          Col(
                            children: [
                              Text(
                                state.header.name ?? '-',
                                style: Gfont.fs(inSizes(25, 10)).white.bold,
                              ),
                              ResizedSwitched(
                                show: !hasSmall,
                                child: Text('Online', style: Gfont.white),
                              ),
                            ],
                          ),
                        ],
                      ).ignore()),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

class ProfileNotifier extends ChangeNotifier {
  LzProfileHeader header = LzProfileHeader();
  final scrollController = ScrollController();

  void listenToScroll() {
    double pixels = scrollController.position.pixels;

    if (pixels < -70) {
      scrollController.animateTo(pixels, duration: 250.ms, curve: Curves.easeInBack);
      return;
    }

    if (pixels < 0) {
      updateImgHeight(defHeight + pixels.abs());
    } else {
      if (frameHeight <= 120 && position != 1) {
        position = 1;
      } else {
        if (pixels > (defHeight / 3) && position != 2) {
          position = 2;
          imgSize = 80;
        } else if (pixels < (defHeight / 3) && position != 3) {
          position = 3;
        }
      }

      updateImgHeight(defHeight - pixels);
    }
  }

  void onInit() {
    defHeight = header.height ?? 400;
    frameHeight = defHeight;
    imgSize = defHeight;

    notifyListeners();
  }

  ProfileNotifier() {
    scrollController.addListener(listenToScroll);
  }

  // data
  double defHeight = 0;
  double frameHeight = 0;
  double imgSize = 0;
  int position = 3; // available 1, 2, 3
  bool snap = false;

  void updateImgHeight(double value) {
    frameHeight = value < 0 ? 0 : value;

    if (frameHeight < 100) {
      frameHeight = 100;
    }

    // logg('$frameHeight | $position | ${(defHeight / 3)}');
    notifyListeners();
  }

  void onPointerUp() {
    if (snap) {
      if (position == 3 && frameHeight < defHeight) {
        scrollController.animateTo(
          0,
          duration: 120.ms,
          curve: Curves.easeInOut,
        );
      } else if (position == 2 && frameHeight > (defHeight / 3)) {
        // scrollController.animateTo(
        //   defHeight / 1.9,
        //   duration: 120.ms,
        //   curve: Curves.easeInOut,
        // );
      }
    }

    logg('---- on pointer up');
    notifyListeners();
  }

  void onImageDragUpdate(DragUpdateDetails details) {
    double delta = details.delta.dy;
    double newHeight = scrollController.offset - delta;
    double pixels = scrollController.position.pixels;

    if (pixels < -70) {
      scrollController.animateTo(0, duration: 250.ms, curve: Curves.easeInBack);
      return;
    }

    scrollController.jumpTo(newHeight);
  }

  void state(Function() action) {
    action();
    notifyListeners();
  }
}

extension BlurExtension on Widget {
  Widget blur(BuildContext context, {double sigmaX = 5, double sigmaY = 5, Duration? duration, bool show = true}) {
    return Stack(
      children: [
        this,
        AnimatedOpacity(
          duration: duration ?? 300.ms,
          opacity: show ? 1 : 0,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
            child: SizedBox(
              width: context.width,
              height: context.height,
            ),
          ),
        ),
      ],
    );
  }
}

class LzProfileFloatingButton extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  final Icon? icon;
  const LzProfileFloatingButton({super.key, this.onTap, this.color, this.icon});

  @override
  Widget build(BuildContext context) {
    return InkW(
      onTap: onTap,
      padding: Ei.all(20),
      color: color ?? Colors.white,
      radius: Br.circle,
      border: Br.all(),
      child: icon ?? const Icon(La.userEdit),
    );
  }
}

class LzProfileHeader {
  final String? avatar;
  final String? name;
  final Widget? leading;
  final List<Widget> actions;
  final double? height;
  final LzProfileFloatingButton? floatingButton;

  LzProfileHeader({this.avatar, this.name, this.leading, this.actions = const [], this.height, this.floatingButton});
}

class LzProfile extends StatelessWidget {
  final LzProfileHeader header;
  final List<Widget> children;
  final bool snap;
  const LzProfile({super.key, required this.header, this.children = const [], this.snap = false});

  @override
  Widget build(BuildContext context) {
    final notifier = ProfileNotifier();
    notifier.header = header;
    notifier.snap = snap;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifier.onInit();
    });

    return Scaffold(
      body: Listener(
        onPointerMove: (opm) {},
        onPointerUp: (event) {
          notifier.onPointerUp();
        },
        child: Stack(
          children: [
            ListView(
              controller: notifier.scrollController,
              physics: BounceScroll(),
              padding: Ei.only(t: header.height ?? 400),
              children: children,
            ),

            ProfileHeader(notifier: notifier),

            // addition widget
            notifier.watch((state) => Positioned(
                top: state.frameHeight - 30,
                right: 20,
                child: ScaleSwitched(
                    alignment: Alignment.center, child: state.frameHeight < 120 ? const None() : (state.header.floatingButton ?? const None())))),

            // appbar widget
            Positioned(
              top: context.padding.top + 10,
              left: 15,
              right: 15,
              child: Row(
                mainAxisAlignment: Maa.spaceBetween,
                children: [
                  notifier.header.leading ??
                      IconButton(
                          onPressed: () => context.pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                  Row(
                    children: notifier.header.actions,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ScaleSwitched extends StatelessWidget {
  final Widget? child;
  final Duration? duration;
  final Alignment? alignment;
  const ScaleSwitched({super.key, this.child, this.duration, this.alignment});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        duration: duration ?? 250.ms,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(
            scale: animation,
            alignment: alignment ?? Alignment.centerLeft,
            child: child,
          );
        },
        child: child);
  }
}

class ResizedSwitched extends StatelessWidget {
  final Widget? child;
  final Duration? duration;
  final bool show;
  final bool useOpacity;
  final Axis axis;
  const ResizedSwitched({Key? key, this.child, this.duration, required this.show, this.useOpacity = true, this.axis = Axis.vertical})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration ?? const Duration(milliseconds: 250),
      transitionBuilder: (Widget child, Animation<double> animation) {
        Widget resizedChild = Align(
          alignment: Alignment.centerLeft,
          child: SizeTransition(
            axisAlignment: -1.0,
            axis: axis,
            sizeFactor: animation,
            child: child,
          ),
        );

        return useOpacity ? FadeTransition(opacity: animation, child: resizedChild) : resizedChild;
      },
      child: show ? child : const SizedBox.shrink(),
    );
  }
}
