import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Notifier extends ChangeNotifier {
  bool show = false;

  void toggle() {
    show = !show;
    notifyListeners();
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Labs'),
        actions: [
          IconButton(
              onPressed: () {
                notifier.toggle();
              },
              icon: Icon(Hi.gift))
        ],
      ),
      body: LzListView(
        gap: 25,
        children: [
          Text('This is an example about how to use multi-language in flutter.'),
          LzForm.radio(label: 'Select Language', options: ['English', 'Indonesia'], onChange: (value) {})
        ],
      ),
    );
  }
}
