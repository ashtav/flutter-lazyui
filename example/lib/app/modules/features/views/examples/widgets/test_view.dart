import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

extension GroupAnimate on Column {
  Column animateGroup() {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children.generate((child, i) {
        if (child is SizedBox) {
          return child;
        }

        return child.lz.animate.slideUp(delay: (i + 1) * 100);
      }).toList(),
    );
  }
}

class Notifier extends ChangeNotifier {}

class Press extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  const Press(this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: Icon(icon));
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final key1 = GlobalKey();
    final key2 = GlobalKey();
    final key3 = GlobalKey();

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(title: const Text('Test View'), actions: [
          Press(Ti.toggleLeft, () {
            context.dropdown(key1, child: Iconr(Ti.toggleLeft, padding: Ei.all(14), color: Colors.white));
          }, key: key1),
          Dropdown(builder: (context) {
            return Press(Ti.forbid, () {
              context.show();
            });
          }),
        ]),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BounceScroll(),
              child: Row(
                children: 15.generate((i) {
                  final ikey = GlobalKey();

                  return Center(
                    key: ikey,
                    child: InkTouch(
                      onTap: () {
                        context.dropdown(ikey);
                      },
                      padding: Ei.sym(v: 13, h: 20),
                      border: Br.only(['l'], except: i == 0),
                      child: Text(Faker.category()),
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: LzListView(
                children: [
                  Column(
                    children: [
                      const Text('Hello world!'),
                      Text('Lorem ipsum dolor sit amet', style: Gfont.bold),
                      10.height,
                      Text(Faker.words(25)),
                      50.height,
                    ],
                  ).start.gap(5).animateGroup(),

                  // sections
                  // if we want to show child when dropdown is opened, we should wrap it
                  Dropdown(builder: (drop) {
                    return Touch(
                        onTap: () {
                          drop.show();
                        },
                        child: Textr(
                          'Show Something!',
                          style: Gfont.orange,
                          padding: Ei.sym(v: 13),
                          border: Br.only(['t', 'b']),
                        ));
                  })
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            padding: Ei.all(20),
            child: Touch(
                onTap: () {
                  context.dropdown(key3);
                },
                child: Text('Show Something!', style: Gfont.orange, key: key3))),
      ),
    );
  }
}

class DropdownController {
  final BuildContext context;
  final GlobalKey key;
  final Widget child;

  DropdownController(this.context, this.key, this.child);

  void show() {
    context.dropdown(key, child: child.lz.ignore());
  }
}

class Dropdown extends StatelessWidget {
  final Widget Function(DropdownController) builder;
  const Dropdown({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    Widget child = builder(DropdownController(context, key, const None()));

    return SizedBox(key: key, child: builder(DropdownController(context, key, child)));
  }
}

class DropWrap extends StatelessWidget {
  final Widget child;
  const DropWrap({super.key, required this.child});

  @override
  Widget build(BuildContext context) => child;
}

class Overlay extends StatelessWidget {
  final Target target;
  final Offset? space;
  final Widget? targetWidget;
  const Overlay({super.key, required this.target, this.space, this.targetWidget});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final notifier = DropdownNotifier(context, target, key, space);

    return Stack(
      children: [
        // target widget position
        if (targetWidget != null)
          Positioned(left: target.offset.dx, top: target.offset.dy - context.windowPadding.top, child: targetWidget!),

        // dropdown position
        notifier.watch((state) => Positioned(
              left: notifier.offset.dx,
              top: notifier.offset.dy,
              child: SizedBox(
                key: key,
                width: 250,
                child: Column(
                  children: ['Edit', 'Delete', 'Approve'].generate((label, i) {
                    final icons = [Hi.strokeRoundedPencil, Hi.strokeRoundedDelete02, Hi.strokeRoundedCheckmarkSquare01];

                    return InkTouch(
                      onTap: () {},
                      color: Colors.white,
                      padding: Ei.sym(v: 13, h: 20),
                      border: Br.only(['t'], except: i == 0),
                      child: Row(
                        children: [Text(label), Icon(icons[i])],
                      ).between,
                    );
                  }),
                ),
              ).lz.clip(all: 7),
            ))
      ],
    );
  }

  static open(BuildContext context, GlobalKey key, {Widget? child}) {
    try {
      final box = key.context!.findRenderObject() as RenderBox?;
      final offset = box?.localToGlobal(Offset.zero);

      Widget? targetWidget;

      if (key.currentWidget is DropWrap) {
        targetWidget = (key.currentWidget as DropWrap).child;
      }

      if (offset != null) {
        context.dialog(Overlay(target: Target(offset, box?.size ?? Size.zero), targetWidget: child ?? targetWidget),
            backBlur: true);
      }
    } catch (e, s) {
      Errors.check(e, s);
    }
  }
}

extension BuildContextExtension on BuildContext {
  void dropdown(GlobalKey key, {Widget? child}) {
    Overlay.open(this, key, child: child);
  }
}

class Target {
  final Offset offset;
  final Size size;

  Target(this.offset, this.size);
}

class DropdownNotifier extends ChangeNotifier {
  final BuildContext context;
  final GlobalKey key;
  final Target target;
  final Offset? space;

  Offset offset = Offset.zero;

  DropdownNotifier(this.context, this.target, this.key, this.space) {
    offset = target.offset;

    double dx = offset.dx;
    double dy = offset.dy + (context.windowPadding.top / 2);

    // read dropdown size and position
    Bindings.onRendered(() {
      final box = key.context!.findRenderObject() as RenderBox?;
      final o = box?.localToGlobal(Offset.zero);

      // dropdown position
      Offset dropdown = o ?? Offset.zero;

      // dropdown size
      Size size = box?.size ?? Size.zero;

      // screen size
      Size screen = Size(context.width, context.height);

      // check if dropdown x position is out of the screen
      double dropX = dropdown.dx + size.width;

      if (dropX > screen.width) {
        dx = screen.width - size.width - (space?.dx ?? 20);
      } else if (dropdown.dx < (space?.dx ?? 20)) {
        dx = 0 + (space?.dx ?? 20);
      }

      // check if dropdown y position is out of the screen
      double dropY = dropdown.dy + size.height;

      if (dropY > screen.height) {
        dy = target.offset.dy - (size.height + (target.size.height * 2));
      }

      offset = Offset(dx, dy);

      notifyListeners();

      //
      logg(
          'dropdown pos: $dropdown, dropdown size: $size, screen: $screen, drop-x: $dropX, target pos: ${target.offset}, target size: ${target.size} final pos: $offset');
    });

    // logg('dropdown notifier has been initialized');
  }
}
