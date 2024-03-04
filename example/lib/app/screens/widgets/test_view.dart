import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

final key1 = GlobalKey(),
    key2 = GlobalKey(),
    key3 = GlobalKey(),
    key4 = GlobalKey();
final controller = TrainerController();
List<String> titles = [
  'Search Icon',
  'Calendar Icon',
  'Floating Action Button',
  'Button'
];

double progress = 90;

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Touch(
        onTap: () {
          LzToast.overlayProgress('Loading...',
              progress: () => progress, percentage: true);
        },
        child: const Text('Tap me!'),
      ),
    ));
  }
}
