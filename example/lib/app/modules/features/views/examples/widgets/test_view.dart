import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Notifier extends ChangeNotifier {
  bool toggle = false;

  void doToggle() {
    toggle = !toggle;
    notifyListeners();
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(title: const Text('Test View'), actions: [
          Press(Ti.toggleLeft, () {}),
          Press(Ti.forbid, () {
            notifier.doToggle();
          }),
        ]),
        body: LzListView(
          children: [
            Column(
              children: [
                RippleAnimation(
                  repeat: true,
                  bordered: true,
                  color: Colors.blueAccent,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent, shape: BoxShape.circle),
                    child:
                        const Center(child: Icon(Ti.user, color: Colors.white)),
                  ),
                ),
              ],
            ),
            const Text('Typing')
                .lz
                .animate
                .typing(length: 5, duration: 2.s, character: '. '),
            notifier.watch((state) => ResizedSwitched(
                  show: state.toggle,
                  duration: 150.ms,
                  child: state.toggle
                      ? Text('First Wdiget', key: UniqueKey())
                      : Text('Second Widget', key: UniqueKey()),
                ))
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
