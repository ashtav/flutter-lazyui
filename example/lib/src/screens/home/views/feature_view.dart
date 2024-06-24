import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class FeatureView extends StatelessWidget {
  const FeatureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Features'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [],
      ),
    );
  }
}
