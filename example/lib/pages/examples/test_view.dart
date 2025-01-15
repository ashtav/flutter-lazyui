import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class Notifier extends ChangeNotifier {
  int active = 0;

  void toggle() {
    active++;

    if (active >= 3) {
      active = 0;
    }

    notifyListeners();
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();

    dynamic a = '0';

    void foo() async {
      try {
        5.s.timer(() {
          logg('ok');
        });
      } catch (e, s) {
        Errors.check(e, s);
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Labs'),
          actions: [
            LzThemeAction(),
            IconButton(
                onPressed: () {
                  notifier.toggle();
                },
                icon: Icon(Hi.gift))
          ],
        ),
        body: notifier.watch((state) => Center(
              child: SlideIndicator(
                active: state.active,
                // size: [5, 5, 5, 15]
                // size: [[5, 5],[5, 15]]
              ),
            )));
  }
}

class SlideIndicator extends StatefulWidget {
  final int length;
  final int active;
  final List<double> Function(bool active)? size;
  const SlideIndicator({super.key, this.length = 3, this.active = 0, this.size});

  @override
  State<SlideIndicator> createState() => _SlideIndicatorState();
}

class _SlideIndicatorState extends State<SlideIndicator> {
  double width = 10;
  double height = 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: Mas.min,
      spacing: 5,
      children: widget.length.generate((index) {
        bool isActive = index == widget.active;

        if (widget.size != null) {
          List<double> size = widget.size!(isActive);
          width = size.isNotEmpty ? size[0] : 10;
          height = size.length > 1 ? size[1] : 10;
        }

        return AnimatedContainer(
          duration: 250.ms,
          height: 5,
          width: isActive ? 15 : 5,
          decoration: BoxDecoration(color: Colors.black26, borderRadius: Br.radius(10)),
        );
      }),
    );
  }
}
