import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

final list = Faker.list.category(15, unique: true);

class DropdownView extends StatelessWidget {
  const DropdownView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final key1 = GlobalKey();
    final icons = [Hi.filterVertical, Hi.sortingAZ02, Hi.settings01];
    final options =
        DropOption.of(['Filter', 'Sort AZ', 'Settings'], icons: icons, separated: [2], focused: ['Settings']);

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dropdown'),
          actions: [
            IconButton(
                onPressed: () {
                  Droplist.open(context, key1, ['Filter', 'Sort AZ', 'Settings', 'Test']);
                },
                icon: Icon(Hi.setting06, key: key1))
          ],
        ),
        body: ListView(
          children: [
            LzTabView(
              tabs: list,
              snapped: false,
              onTap: (key, i) {
                Droplist.open(context, key, ['Filter', 'Sort AZ', 'Settings']);
              },
            ),
            LzTextField(hint: 'Example of input'),
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
                            action.show((value) {
                              logg(value);
                            });
                          });
                    }),

                // open dropdown with context
                LzButton(
                  text: 'Open from Context',
                  key: key,
                  onTap: () {
                    context.dropdown(key, options: options);
                  },
                )
              ],
            ),
            20.height,
            Column(
              children: Faker.list.category(5).generate((item, i) {
                return LzDropdown(
                  options: [
                    ...DropOption.of(['Edit', 'Delete', 'View'], icons: [Hi.edit01, Hi.delete01, Hi.view]),
                  ],
                  builder: (key, action) {
                    return DropWrap(
                      builder: (child) => child.lz.clip(all: 7),
                      child: InkTouch(
                        key: key,
                        onTap: () {
                          action.show((value) {
                            logg(value);
                          });
                        },
                        padding: Ei.all(20),
                        border: Br.all(),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Text(item),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ).start
          ],
        ),
      ),
    );
  }
}
