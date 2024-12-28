import 'package:example/pages/feature_view.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: Ei.sym(h: 20),
        child: Column(
          children: [
            Textr(
              'LazyUi 4.3',
              style: Gfont.fs20.bold,
              padding: Ei.sym(v: 5),
            ),
            Text(
                'LazyUi is a collection of widgets and utilities designed to simplify and speed up the app development process with Flutter.',
                textAlign: Ta.center),

            // go to example
            LzButton(
              onTap: () => context.lz.push(const FeatureView()),
              text: 'See Example',
              icon: Hi.bookOpen02,
              outlined: true,
              padding: Ei.sym(v: 15, h: 30),
            )
          ],
        ).gap(35, except: [0]).centered,
      ),
    );
  }
}
