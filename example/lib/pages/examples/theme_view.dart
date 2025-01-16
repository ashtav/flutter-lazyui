import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        actions: [LzThemeAction()],
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'LzTheme is a flexible theming solution that allows switching between light, dark, or system-defined themes, ensuring a seamless and adaptive user experience.',
          ),
          Column(
            spacing: 15,
            children: [
              LzForm.switches(
                  label: context.isDarkMode ? 'Dark Mode' : 'Light Mode',
                  initValue: context.isDarkMode,
                  onChange: (value) {
                    LzTheme.toggle();
                  }),
              Text(
                  'Use LzTheme.toggle(); to switch between light and dark themes dynamically.',
                  style: Gfont.fs14),
            ],
          ).start,
          35.height,
          Column(
            spacing: 5,
            children: [
              Text('LzThemeAction()', style: Gfont.orange),
              Text(
                  'Use LzThemeAction() to display the icon widget toggle in the app bar actions.',
                  style: Gfont.fs14),
            ],
          ).start,
        ],
      ),
    );
  }
}
