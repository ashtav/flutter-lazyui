import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class RefreshtorView extends StatelessWidget {
  const RefreshtorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Refreshtor'),
        actions: [LzThemeAction()],
      ),
      body: Refreshtor(
        onRefresh: () async {
          Toast.show('List view has been refreshed!');
        },
        child: ListView(
          padding: Ei.all(20),
          physics: Scrolics.bounce,
          children: [
            const ExampleLabel(
              description:
                  'Refreshtor is a custom widget that enables a pull-down gesture to refresh the content of a scrollable area. It simplifies adding refresh functionality with customizable behavior and styling, making it easy to integrate into your app.',
            ),
            Text('''Refreshtor(
      onRefresh: () async => {}, 
      child: ListView(
        physics: Scrolics.bounce
      )
)''', style: Gfont.fs14.orange)
          ],
        ),
      ),
    );
  }
}
