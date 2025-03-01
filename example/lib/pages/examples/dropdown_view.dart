import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

final list = Faker.list.category(15, unique: true);

class DropdownView extends StatelessWidget {
  const DropdownView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final key3 = GlobalKey();
    final icons = [Hi.filterVertical, Hi.sortingAZ02, Hi.settings01];
    final options = DropOption.of(['Filter', 'Sort AZ', 'Settings'],
        icons: icons, separated: [2], focused: ['Settings']);

    final dummyOptions = ['Details', 'Edit', 'Delete', 'Settings'];

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dropdown'),
          actions: [
            Droplist(
                options: options,
                builder: (keyx, action) {
                  return IconButton(
                      key: keyx,
                      onPressed: () {
                        action.show((option) {});
                      },
                      icon: Icon(
                        Hi.setting06,
                      ));
                })
          ],
        ),
        body: LzListView(
          autoCache: true,
          padding: Ei.zero,
          children: [
            LzTabView(
              tabs: list,
              snapped: false,
              onTap: (key, i) {
                // Droplist.open(context, key, ['Filter', 'Sort AZ', 'Settings']);
                context.droplist(
                    key,
                    DropOption.of(dummyOptions,
                        separated: ['Settings'],
                        critical: ['Delete'],
                        icons: icons), onSelect: (value) {
                  logg(value.label);
                });
                // Droplist.option(options, [].list())
              },
            ),
            Column(
              children: [
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
                        ...DropOption.of(['Edit', 'Delete', 'View'],
                            icons: [Hi.edit01, Hi.delete01, Hi.view]),
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
                ).start,
                Column(
                  children: list.take(3).toList().generate((item, i) {
                    return Droplist(
                      options: DropOption.of(['Edit', 'Delete', 'View'],
                          icons: [Hi.edit01, Hi.delete01, Hi.view],
                          critical: [1]),
                      builder: (key, action) {
                        return DropWrap(
                          builder: (child) => child.lz.clip(all: 7),
                          child: InkTouch(
                            key: key,
                            onTap: () {
                              action.show((value) {
                                logg(value.label);
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
                ).start,
                LzButton(
                  key: key3,
                  onTap: () {
                    // Droplist.open(context, key3, dummyOptions);
                  },
                  text: 'Show Droplist',
                ),
                250.height
              ],
            ).start.gap(25).margin(all: 20)
          ],
        ),
      ),
    );
  }
}
