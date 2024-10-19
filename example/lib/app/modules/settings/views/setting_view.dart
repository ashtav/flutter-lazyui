import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../notifiers/setting_notifier.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = LzTheme.get(context);
    Color borderColor = Colors.black12.invert(theme.isDarkMode);

    return ThemeSwitchingArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: LzListView(
          gap: 45,
          children: [
            Section(
              label: 'Theme',
              subLabel:
                  'Choose a light or dark theme and personalize the appearance of your app for optimal comfort and usability.',
              children: [
                Container(
                  padding: Ei.sym(h: 15),
                  decoration: BoxDecoration(
                      border: Br.all(color: borderColor),
                      borderRadius: Br.radius(5)),
                  child: Row(
                    children: [
                      const Text('Dark Mode'),
                      settingNotifier
                          .watch((state) => ThemeSwitcher(builder: (context) {
                                return LzForm.switches(
                                    initValue: state.isDarkMode,
                                    onChange: (value) {
                                      state.changeTheme(value);
                                      final theme =
                                          value ? LzTheme.dark : LzTheme.light;

                                      Utils.timer(() {
                                        ThemeSwitcher.of(context).changeTheme(
                                            theme: theme,
                                            isReversed: !state.isDarkMode);
                                        LzTheme.setTheme(value);
                                      }, 150.ms);
                                    });
                              }))
                    ],
                  ).between,
                )
              ],
            ),
            Section(
              label: 'Language',
              subLabel:
                  'Select your preferred language for a personalized and clear user experience.',
              children: [
                settingNotifier.watch((state) {
                  String code = state.language;

                  Map<String, dynamic> map = {
                    'id': 'Indonesia',
                    'en': 'English'
                  };

                  List<String> langs = List<String>.from(map.values);
                  List<String> langsCode = List<String>.from(map.keys);

                  String language = map[code];
                  final option = Option(language, value: code);

                  return Panel.picker(language, onTap: () {
                    LzPicker.option(context,
                        initialValue: option,
                        options: Option.list(langs, values: langsCode),
                        style: const PickerStyle(title: 'Select language'),
                        onSelect: (option) {
                      state.changeLanguage(Locale(option.value));
                    });
                  });
                }),
              ],
            ),
            Section(
              label: 'Notification',
              subLabel:
                  'Stay informed about important updates and activity within the app through notifications.',
              children: [
                Panel.switches('Push Notification', true),
                Panel.switches('Promo', false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  final String label, subLabel;
  final List<Widget> children;
  const Section(
      {super.key,
      required this.label,
      required this.subLabel,
      this.children = const []});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);

    return Column(children: [
      Text(label, style: font.bold),
      Text(subLabel, style: font.muted.fsize(14)),
      const SizedBox(height: 10),
      ...children
    ]).start.gap(5);
  }
}

class Panel {
  static Widget switches(String label, bool initValue,
      {Function(bool)? onChange}) {
    return Container(
      padding: Ei.sym(h: 15),
      decoration: BoxDecoration(border: Br.all(), borderRadius: Br.radius(5)),
      child: Row(
        children: [
          Text(label),
          LzForm.switches(initValue: initValue, onChange: onChange)
        ],
      ).between,
    );
  }

  static Widget picker(String label, {Function()? onTap, bool isDark = false}) {
    return Touch(
      onTap: () => onTap?.call(),
      hoverable: true,
      child: Container(
        padding: Ei.sym(h: 15, v: 10),
        decoration: BoxDecoration(border: Br.all(), borderRadius: Br.radius(5)),
        child: Row(
          children: [
            Text(label),
            Icon(Ti.chevronRight, color: Colors.black45.adaptWithTheme)
          ],
        ).between,
      ),
    );
  }
}
