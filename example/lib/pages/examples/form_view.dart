import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';
import '../widgets/example_label_widget.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [],
      ),
      bottomNavigationBar: DarkModeWidget(),
    );
  }
}
