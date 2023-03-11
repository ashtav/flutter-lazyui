import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzFormGroup extends StatelessWidget {
  final List<Widget> children;
  const LzFormGroup({super.key, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Ei.only(b: 10),
      decoration: BoxDecoration(border: Br.all(), color: Colors.white, borderRadius: Br.radius(5)),
      child: ClipRRect(
        borderRadius: Br.radius(5),
        child: Col(
          children: children,
        ),
      ),
    );
  }
}
