import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class DarkModeWidget extends StatelessWidget {
  const DarkModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Ei.all(15),
      child: LzTheme.watch((theme) {
        bool isDarkMode = theme == ThemeMode.dark;

        return Row(
          spacing: 10,
          children: [
            Transform.scale(
                scale: 0.8, alignment: Alignment.center, child: Switch(value: isDarkMode, onChanged: (value) {
                  LzTheme.set(value ? ThemeMode.dark : ThemeMode.light);
                })),
            Text('Switch to ${isDarkMode ? 'Light' : 'Dark'} Mode'),
          ],
        );
      }),
    );
  }
}
