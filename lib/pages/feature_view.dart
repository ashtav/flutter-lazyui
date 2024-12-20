import 'package:example/data/features.dart';
import 'package:example/pages/examples/test_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'examples/button_view.dart';
import 'examples/text_view.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Features'),
        actions: [
          LzTheme.watch((theme) => IconButton(
              onPressed: () {
                LzTheme.toggle();
              },
              icon: Icon(theme.isDark ? Hi.sun03 : Hi.moon02))),
          ...[Hi.paintBrush04, Hi.informationCircle].iconButton((i) {}),
        ],
      ),
      body: ListView(
        children: [
          ...features.generate((e, i) {
            return Column(children: [
              // group label
              LzTheme.watch((theme) => Textr(e.label,
                  padding: Ei.all(20),
                  style: Gfont.green,
                  color: (theme.isDark ? '161616' : 'f5f5f5').hex,
                  width: context.width)),

              // features
              ...e.features.generate((f, j) {
                return Touch(
                  onTap: () => FeatureView.action(context, f.label),
                  padding: Ei.all(20),
                  child: Row(
                    children: [Textr(f.label, icon: f.icon), Icon(Hi.arrowRight01)],
                  ).between,
                );
              }),
            ]).start;
          })
        ],
      ),
    );
  }

  static void action(BuildContext context, String feature) {
    Map<String, Widget> pages = {
      'LzButton': const ButtonView(),
      'Textr': const TextView(),
    };

    context.lz.push(pages[feature] ?? const TestView());
  }
}
