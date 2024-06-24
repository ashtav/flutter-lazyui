import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'feature_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: Maa.center,
              children: [
                Stack(
                  alignment: Ad.center,
                  children: [
                    Container(margin: Ei.only(t: 110, r: 70), child: Text('Lz', style: Gfont.fsize(70))),
                    Text('4', style: Gfont.fsize(170)),
                  ],
                ),
                Container(
                  padding: Ei.sym(h: 35),
                  margin: Ei.only(b: 25),
                  child: const Text(
                      'LazyUi is a collection of widgets and utilities designed to simplify and speed up the app development process with Flutter.',
                      textAlign: Ta.center),
                ),
                Touch(
                  onTap: () {
                    context.lz.push(const FeatureView());
                  },
                  hoverable: true,
                  child: Container(
                      padding: Ei.sym(v: 15, h: 35),
                      decoration: BoxDecoration(border: Br.all(), borderRadius: Br.radius(7)),
                      child: Text('Explore More', style: Gfont.bold)),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
