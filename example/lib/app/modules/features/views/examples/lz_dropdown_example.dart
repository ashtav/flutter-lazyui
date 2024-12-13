import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class LzDropdownExample extends StatelessWidget {
  const LzDropdownExample({super.key});

  @override
  Widget build(BuildContext context) {
    final key1 = GlobalKey();
    final key2 = GlobalKey();

    final icons = [Hi.filterVertical, Hi.sortingAZ02, Hi.settings01];
    final options = LzDropdown.of(['Filter', 'Sort AZ', 'Settings'],
        icons: icons, separated: [2]);

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(title: const Text('Test View'), actions: [
          // show dropdown using context
          IconButton(
              onPressed: () => context.dropdown(key1, options: options),
              icon: Icon(Hi.settings01, key: key1)),

          // show dropdown using context with overlay
          IconButton(
              onPressed: () {
                context.dropdown(key2,
                    options: options,
                    overlay:
                        const Icon(Hi.notification01, color: Colors.white));
              },
              icon: Icon(Hi.notification01, key: key2)),

          // show dropdown using LzDropdown widget
          LzDropdown(
              options: options,
              builder: (key, action) {
                return IconButton(
                    onPressed: () => action.show(),
                    icon: Icon(Hi.menu02, key: key));
              },
              child: const Icon(Hi.menu02, color: Colors.white)),
        ]),
        body: Column(
          children: [
            // using dropdown in tab view
            LzTabView(
              onTap: (key, i) => context.dropdown(key, options: options),
              tabs: [...15.generate((o) => Faker.category())],
            ),

            // another example and implementation
            Expanded(
              child: LzListView(
                padding: Ei.zero,
                children: [
                  // list view
                  Container(
                    padding: Ei.all(20),
                    child: Column(
                      children: 10.generate((i) {
                        String title = Faker.category();
                        String content = Faker.words(10);
                        return LzDropdown(
                            options: options,
                            builder: (key, action) {
                              return InkTouch(
                                onTap: () {
                                  action.show();
                                },
                                key: key,
                                padding: Ei.all(20),
                                color: Colors.white,
                                border: Br.only(['t'], except: i == 0),
                                child: Column(
                                  children: [
                                    Text(title, style: Gfont.bold),
                                    Text(content),
                                  ],
                                ).gap(5).start,
                              );
                            });
                      }),
                    ),
                  ),

                  // show dropdown in top position only
                  Container(
                    padding: Ei.sym(h: 20),
                    child: LzDropdown(
                        options: options,
                        position: LzDropPosition.top,
                        builder: (key, drop) {
                          return Touch(
                              key: key,
                              onTap: () {
                                drop.show();
                              },
                              child: Textr(
                                'Show Dropdown - Top Position.',
                                style: Gfont.orange,
                                padding: Ei.sym(v: 13),
                                border: Br.only(['t', 'b']),
                              ));
                        }),
                  ),

                  // show dropdown in bottom position only
                  Container(
                    padding: Ei.sym(h: 20),
                    child: LzDropdown(
                        options: options,
                        position: LzDropPosition.bottom,
                        builder: (key, drop) {
                          return Touch(
                              key: key,
                              onTap: () {
                                drop.show();
                              },
                              child: Textr(
                                'Show Dropdown - Bottom Position.',
                                style: Gfont.orange,
                                padding: Ei.sym(v: 13),
                                border: Br.only(['t', 'b']),
                              ));
                        }),
                  ),

                  // rows
                  Row(
                    mainAxisAlignment: Maa.spaceEvenly,
                    children: [
                      LzDropdown(
                          options: options,
                          child: Iconr(Hi.user,
                              padding: Ei.all(20), color: Colors.white),
                          builder: (key, action) {
                            return Touch(
                                key: key,
                                onTap: () {
                                  action.show();
                                },
                                child: Iconr(Hi.user, padding: Ei.all(20)));
                          }),
                      Touch(
                          onTap: () {},
                          child: Iconr(Hi.gift, padding: Ei.all(20)))
                    ],
                  ),

                  // intrinsic
                  Intrinsic(
                    spacer:
                        Container(width: 1, height: 30, color: Colors.black12),
                    children:
                        [Hi.pencil, Hi.eraser, Hi.scissor].generate((icon, i) {
                      return LzDropdown(
                          options: options,
                          builder: (key, action) {
                            return Touch(
                                key: key,
                                onTap: () {
                                  action.show();
                                },
                                child: Iconr(icon, padding: Ei.all(20)));
                          });
                    }),
                  ),

                  LzDropdown(
                      options: options,
                      builder: (key, action) {
                        return Column(
                          children: [
                            Touch(
                                key: key,
                                onTap: () {
                                  action.show();
                                },
                                child: Container(
                                  width: 200,
                                  padding: Ei.all(20),
                                  decoration: BoxDecoration(border: Br.all()),
                                  child: const Text(
                                      'Show dropdown with some texts as its overlay!',
                                      textAlign: Ta.end),
                                )),
                          ],
                        ).end;
                      }),

                  25.height,
                  Textr('# Example dropdown with LzDropWrap',
                      padding: Ei.all(20), style: Gfont.muted),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: Ei.sym(h: 20),
                    physics: BounceScroll(),
                    child: Row(
                      children: [
                        'Transportation',
                        'Photography',
                        'Illustration',
                        'Reading',
                        'Sport Games',
                        'Editing'
                      ].generate((item, i) {
                        return LzDropdown(
                            options: options,
                            align: LzDropAlign.right,
                            builder: (key, action) {
                              return LzDropWrap(
                                builder: (child) {
                                  return child.lz.clip(all: 7);
                                },
                                child: InkTouch(
                                  key: key,
                                  onTap: () {
                                    action.show();
                                  },
                                  color: Colors.white,
                                  padding: Ei.sym(v: 13, h: 20),
                                  border: Br.only(['l'], except: i == 0),
                                  child: Text(item),
                                ),
                              );
                            });
                      }),
                    ),
                  ),

                  300.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
