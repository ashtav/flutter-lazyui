import 'package:flutter/material.dart';
import 'package:lazyui/src/extensions/extension.dart';

final Color scaffoldBackgroundColor = 'FAFAFA'.hex;
final Color backgroundColor = 'FFFFFF'.hex;
final Color darkBackgroundColor = '121212'.hex;
final Color darkAppbarColor = '161616'.hex;
final Color surfaceColor = '1E1E1E'.hex;

final Color iconColor = '333333'.hex; // when system is light
final Color darkIconColor = '999999'.hex; // when system is dark

class ThemeColor {
  final BuildContext context;
  const ThemeColor(this.context);

  Color get icon => context.isDarkMode ? darkIconColor : iconColor;
}
