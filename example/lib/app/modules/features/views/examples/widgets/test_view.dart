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

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Scaffold(
        appBar: AppBar(title: const Text('Test View'), actions: [
          Press(Ti.toggleLeft, () {}),
          Press(Ti.forbid, () {}),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
