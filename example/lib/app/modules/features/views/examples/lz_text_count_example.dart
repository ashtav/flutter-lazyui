import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzTextCountExample extends StatelessWidget {
  const LzTextCountExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Text Count'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: Maa.center,
            crossAxisAlignment: Caa.end,
            children: [
              LzTextCount(
                end: 25790,
                separator: ',',
                duration: 10.s,
                style: Gfont.fsize(35),
              ),
              Textr(' / 25,790', margin: Ei.only(b: 7))
            ],
          ),
        ));
  }
}
