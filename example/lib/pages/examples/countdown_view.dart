import 'package:example/pages/widgets/example_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class CountdownView extends StatelessWidget {
  const CountdownView({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CountDown'),
          actions: [LzThemeAction()],
        ),
        body: LzListView(
          padding: Ei.all(20),
          gap: 25,
          children: [
            const ExampleLabel(
              description:
                  'LzCountDown is a customizable countdown timer that displays the remaining time (days, hours, minutes, seconds) until a specified expiration time, with real-time updates.',
            ),
            LzCountDown(now.add(3.d), builder: (d, h, m, s) {
              return Row(
                children: [d, h, m, s].generate((time, i) {
                  final times = ['D', 'H', 'M', 'S'];
                  return Text('$time ${times[i]}');
                }),
              ).gap(35).center;
            })
          ],
        ),
      ),
    );
  }
}
