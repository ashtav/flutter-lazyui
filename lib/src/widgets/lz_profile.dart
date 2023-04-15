import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzProfile extends StatelessWidget {
  final LzProfileHeader header;
  final List<Widget> children;
  final bool snap;
  const LzProfile({super.key, required this.header, this.children = const [], this.snap = false});

  @override
  Widget build(BuildContext context) {
    final notifier = _ProfileNotifier();
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

            _ProfileHeader(notifier: notifier),

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

class LzProfileHeader {
  final String? image;
  final String? label, subLabel;
  final Widget? leading;
  final List<Widget> actions;
  final double? height;
  final LzProfileFloatingButton? floatingButton;

  LzProfileHeader({this.image, this.label, this.subLabel, this.leading, this.actions = const [], this.height, this.floatingButton});
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

class _ProfileHeader extends StatelessWidget {
  final _ProfileNotifier notifier;
  const _ProfileHeader({required this.notifier});

  @override
  Widget build(BuildContext context) {
    return notifier.watch((state) {
      bool hasMedium = state.position == 2 || state.position == 1;
      bool hasSmall = state.frameHeight < 120;

      Widget image = LzImage(
        state.header.image,
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
                  image.lzBlur(context, sigmaX: 35, sigmaY: 35, show: hasMedium).clip(),
                  Positioned(
                      bottom: inSizes(20, -15),
                      left: f > 200 ? 20 : inSizes(20, 150),
                      right: hasSmall ? (60 * state.header.actions.length).toDouble() : 20,
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
                              state.header.image,
                              radius: 50,
                            ),
                          ),
                          Flexible(
                            child: Col(
                              children: [
                                Text(
                                  state.header.label ?? '-',
                                  style: Gfont.fs(inSizes(25, 10)).white.bold,
                                  overflow: Tof.ellipsis,
                                ),
                                if (state.header.subLabel != null)
                                  ResizedSwitched(
                                    show: !hasSmall,
                                    child: Text(
                                      state.header.subLabel ?? '',
                                      style: Gfont.white,
                                      overflow: Tof.ellipsis,
                                    ),
                                  ),
                              ],
                            ),
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

class _ProfileNotifier extends ChangeNotifier {
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
      if (frameHeight <= 120) {
        position = 1;
      } else {
        if (pixels > (defHeight / 3) && position != 2) {
          position = 2;
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

    notifyListeners();
  }

  _ProfileNotifier() {
    scrollController.addListener(listenToScroll);
  }

  // data
  double defHeight = 0;
  double frameHeight = 0;
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
    double pixels = scrollController.position.pixels;

    logg('---- on pointer up | $pixels | $position | $frameHeight | ${defHeight / 3}');

    if (snap) {
      if (position == 3 && frameHeight < defHeight) {
        scrollController.animateTo(
          0,
          duration: 120.ms,
          curve: Curves.easeInOut,
        );
      } else if (position == 2) {
        double to = frameHeight < 150 ? defHeight - 100 : defHeight - 200;

        scrollController.animateTo(
          to,
          duration: 120.ms,
          curve: Curves.easeInOut,
        );

        if (frameHeight < 130) {
          position = 1;
        }
      }
    }

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
