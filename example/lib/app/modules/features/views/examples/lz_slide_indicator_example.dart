import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class SlideIndicatorView extends StatelessWidget {
  const SlideIndicatorView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> names = 5.generate((i) => Faker.name());

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Textml(
                    'Make a simple slide indicator with <b>LzSlideIndicator</b> widget. <p color="09f">LzSlideIndicator(length: 5, active: false, size: (active) => [active ? 20 : 5, 5])</p>',
                    textAlign: Ta.center)
                .margin(all: 20),
            Column(
              children: [
                LzTextDivider(child: Text(names[1])).margin(b: 20),
                LzSlideIndicator(
                  length: names.length,
                  active: 1,
                  size: (active) => [active ? 20 : 5, 5],
                ),
              ],
            ).center,
          ],
        ).center,
      ),
      bottomNavigationBar: Intrinsic(
        children: [Ti.arrowLeft, Ti.arrowRight].generate((icon, i) {
          return InkTouch(
            onTap: () {
              // int active = LzState.get('#slide') ?? 0;
              // active += i == 0 ? -1 : 1;
              // active = active.clamp(0, names.length - 1);

              // LzState.set('#slide', active);
            },
            padding: Ei.all(20),
            border: Br.only(['l'], except: i == 0),
            color: Colors.white,
            child: Icon(icon, color: Colors.black54),
          );
        }),
      ),
    );
  }
}
