import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

final list = Faker.list.category(15, unique: true);

class DropdownView extends StatelessWidget {
  const DropdownView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();
    final icons = [Hi.informationCircle, Hi.edit01, Hi.delete01, Hi.settings01];
    final options = DropOption.of(['Details', 'Edit', 'Delete', 'Settings'],
        separated: ['Settings'], critical: ['Delete'], icons: icons);

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Droplist'),
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
            Column(
              children: [
                const ExampleLabel(
                  description:
                      'Droplist is a customizable widget for selecting options from a dropdown list, supporting icons, labels, and flexible styling for various use cases.',
                ),
                Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: [
                    Droplist(
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
                        context.droplist(key, options);
                      },
                    )
                  ],
                ),
                // Column(
                //   children: Faker.list.category(5).generate((item, i) {
                //     return LzDropdown(
                //       align: DropAlign.right,
                //       position: DropPosition.bottom,
                //       options: [
                //         ...DropOption.of(['Edit', 'Delete', 'View'],
                //             icons: [Hi.edit01, Hi.delete01, Hi.view]),
                //       ],
                //       builder: (key, action) {
                //         return DropWrap(
                //           builder: (child) => child.lz.clip(all: 7),
                //           child: InkTouch(
                //             key: key,
                //             onTap: () {
                //               action.show((value) {
                //                 logg(value);
                //               });
                //             },
                //             padding: Ei.all(20),
                //             border: Br.all(),
                //             color: Colors.white,
                //             child: Row(
                //               children: [
                //                 Text(item),
                //               ],
                //             ),
                //           ),
                //         );
                //       },
                //     );
                //   }),
                // ).start,
                Column(
                  children: list.take(3).toList().generate((item, i) {
                    return Droplist(
                      // align: DropAlign.right,
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
                            border: Br.only(['t'], except: i),
                            // border: Br.only(['t']),
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
                ).start.lz.clip(all: 7),
                550.height
              ],
            ).start.gap(25).margin(all: 20)
          ],
        ),
      ),
    );
  }
}
