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

class Notifier extends ChangeNotifier {
  List<String> users = ['@yohanes', '@gunawan'];
  final comment = TextEditingController();

  void addUser(String name) {
    users.add('@$name');
    notifyListeners();
  }

  void removeLast() {
    users.removeLast();
    logg('remove last');

    notifyListeners();
  }
}

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
            Overlay.open(context, key1);
          }, key: key1),
          Press(Ti.forbid, () {
            Overlay.open(context, key2);
          }, key: key2),
        ]),
        body: Column(
          children: [
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
                  Touch(
                      onTap: () {
                        Overlay.open(context, key);
                      },
                      child: Text('Show Something!', style: Gfont.orange, key: key))
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Container(
            padding: Ei.all(20),
            child: Touch(
                onTap: () {
                  Overlay.open(context, key3);
                },
                child: Text('Show Something!', style: Gfont.orange, key: key3))),
      ),
    );
  }
}

class Overlay extends StatelessWidget {
  final Offset target;
  const Overlay({super.key, required this.target});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: target.dx,
          top: target.dy,
          child: Container(
            width: 270,
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
        )
      ],
    );
  }

  static open(BuildContext context, GlobalKey key) {
    final box = key.context!.findRenderObject() as RenderBox?;
    final o = box?.localToGlobal(Offset.zero);
    Offset target = o ?? Offset.zero;

    logg(target);

    context.dialog(Overlay(target: target));
  }
}
