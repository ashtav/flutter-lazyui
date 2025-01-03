import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class DropdownView extends StatelessWidget {
  const DropdownView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final icons = [Hi.filterVertical, Hi.sortingAZ02, Hi.settings01];
    final options =
        DropOption.of(['Filter', 'Sort AZ', 'Settings'], icons: icons, separated: [2], focused: ['Settings']);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'LzDropdown is a customizable widget for selecting options from a dropdown list, supporting icons, labels, and flexible styling for various use cases.',
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: [
              LzDropdown(
                options: options,
                builder: (key, action) {
                  return LzButton(
                    key: key,
                    text: 'Open!',
                    icon: Hi.menu02,
                    outlined: true,
                    onTap: () {
                      action.show().then((value) {
                        logg(value);
                      });
                    }
                  );
                }
              ),

              // open dropdown with context
              LzButton(
                text: 'Open from Context',
                key: key,
                onTap: () {
                  context.dropdown(key, options: options);
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
