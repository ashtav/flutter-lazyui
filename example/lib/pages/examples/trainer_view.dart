import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';

class TrainerView extends StatelessWidget {
  const TrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Trainer'),
          actions: [DarkModeWidget.icon()],
        ),
        body: ListView(
          padding: Ei.all(20),
          children: [],
        ),
      ),
    );
  }
}
