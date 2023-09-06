import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LoaderView extends StatelessWidget {
  const LoaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loader'),
      ),

      body: LzLoader.bar(message: 'Loading...'),
    );
  }
}