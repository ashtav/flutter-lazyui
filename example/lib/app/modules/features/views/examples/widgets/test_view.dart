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
