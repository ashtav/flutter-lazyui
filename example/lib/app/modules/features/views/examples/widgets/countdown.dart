import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzCountDownExample extends StatelessWidget {
  const LzCountDownExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Count Down Example'),
        ),
        body: Center(
          child: LzCountDown(
            DateTime.now().add(5.d),
            builder: (d, h, m, s) {
              return Row(
                children: [d, h, m, s].generate((time, i) {
                  final times = ['D', 'H', 'M', 'S'];
                  return Text('$time ${times[i]}');
                }),
              ).gap(35).center;
            },
          ),
        ));
  }
}
