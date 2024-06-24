import 'package:example/src/screens/home/views/feature_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

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
                    Textr('Lz', style: Gfont.fsize(70), margin: Ei.only(t: 110, r: 70)),
                    const T4(),
                    Textr(
                        'LazyUi is a collection of widgets and utilities designed to simplify and speed up the app development process with Flutter.',
                        textAlign: Ta.center,
                        padding: Ei.only(h: 35, t: 300)),
                  ],
                ),
                Touch.button('Explore More', onTap: () {
                  context.lz.push(const FeatureView());
                })
              ],
            ).gap(25),
          ),
        ],
      ),
    ));
  }
}

class T4 extends StatelessWidget {
  const T4({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Ad.center,
      children: [
        Text('4', style: Gfont.fsize(170)),
        Textr('.0.0', style: Gfont.fsize(14), margin: Ei.only(l: 100, t: 100),),
      ],
    );
  }
}
