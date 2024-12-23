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
            Text('Welcome to LazyUi', style: Gfont.bold),
            Text(
                'LazyUi is a collection of widgets and utilities designed to simplify and speed up the app development process with Flutter.',
                textAlign: Ta.center),
            Touch(
              onTap: () {
                context.lz.push(const FeatureView());
              },
              padding: Ei.sym(v: 15, h: 30),
              borderRadius: Br.radius(7),
              border: Br.all(),
              child: Textr('See Example', icon: Hi.bookOpen02),
            )
          ],
        ).gap(25, except: [0]).center,
      ),
    );
  }
}

extension CustomColumnExtension on Column {
  Center get center {
    return Center(
      child: Column(
        mainAxisAlignment: Maa.center,
        children: children,
      ),
    );
  }
}
