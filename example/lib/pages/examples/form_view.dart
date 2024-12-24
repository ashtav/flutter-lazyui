import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/dark_mode_widget.dart';

class FormView extends StatelessWidget {
  const FormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Form'),
        ),
        body: ListView(
          padding: Ei.all(20),
          children: [
            LzTextField(
              hint: 'Enter your name',
            ),
            const SizedBox(height: 15),
            LzTextField(
              hint: 'Enter your address',
              prefixIcon: Icon(Hi.mapsLocation01),
            )
          ],
        ),
        bottomNavigationBar: DarkModeWidget(),
      ),
    );
  }
}
