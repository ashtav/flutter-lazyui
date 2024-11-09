import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

extension GroupAnimate on Column {
  Column animateGroup() {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children.generate((child, i) {
        if (child is SizedBox) {
          return child;
        }

        return child.lz.animate.slideUp(delay: (i + 1) * 100);
      }).toList(),
    );
  }
}

class Notifier extends ChangeNotifier {}

class Press extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  const Press(this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: Icon(icon));
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final key1 = GlobalKey();
    final key3 = GlobalKey();

    final icons = [Hi.strokeRoundedFilterVertical, Hi.strokeRoundedSortingAZ02, Hi.strokeRoundedSettings01];
    final options = LzDropdown.of(['Filter', 'Sort AZ', 'Settings'], icons: icons, separated: [2]);

    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        double dy = details.globalPosition.dy;
        double dx = details.globalPosition.dx;

        logg(Offset(dx, dy));
      },
      child: Wrapper(
        child: Scaffold(
          appBar: AppBar(title: const Text('Test View'), actions: [
            Press(Ti.toggleLeft, () {
              context.dropdown(key1, options: options);
            }, key: key1),
            LzDropdown(
                options: options,
                builder: (action) {
                  return IconButton(onPressed: () => action.show(), icon: const Icon(Ti.forbid));
                },
                child: Iconr(Ti.forbid, color: Colors.white, padding: Ei.all(14))),
          ]),
          body: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BounceScroll(),
                child: Row(
                  children: 15.generate((i) {
                    final ikey = GlobalKey();

                    return Center(
                      key: ikey,
                      child: InkTouch(
                        onTap: () {
                          context.dropdown(ikey, options: options);
                        },
                        padding: Ei.sym(v: 13, h: 20),
                        border: Br.only(['l'], except: i == 0),
                        child: Text(Faker.category()),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: LzListView(
                  children: [
                    Column(
                      children: [
                        const Text('Hello world!'),
                        Text('Lorem ipsum dolor sit amet', style: Gfont.bold),
                        10.height,
                        Text(Faker.words(25)),
                        50.height,
                      ],
                    ).start.gap(5).animateGroup(),

                    // sections
                    // if we want to show child when dropdown is opened, we should wrap it
                    LzDropdown(
                        options: LzDropdown.of(['Edit', 'Delete', 'Approve'], disabled: [2]),
                        builder: (drop) {
                          return Touch(
                              onTap: () {
                                drop.show();
                              },
                              child: Textr(
                                'Show Something!',
                                style: Gfont.orange,
                                padding: Ei.sym(v: 13),
                                border: Br.only(['t', 'b']),
                              ));
                        }),

                    // text
                    LzDropdown(
                        options: options,
                        builder: (action) {
                          return Touch(
                              onTap: () {
                                action.show();
                              },
                              child: Column(
                                children: [
                                  Textr(
                                      'This is an example about how to use custom dropdown widget in flutter. Feel free to fork or request addional features!',
                                      padding: Ei.sym(v: 20),
                                      width: 200),
                                ],
                              ).start);
                        }),

                    // rows
                    Row(
                      children: [
                        LzDropdown(
                            options: options,
                            child: Iconr(Hi.strokeRoundedUser, padding: Ei.all(20), color: Colors.white),
                            builder: (action) {
                              return Touch(
                                  onTap: () {
                                    action.show(space: const Offset(20, 30));
                                  },
                                  child: Iconr(Hi.strokeRoundedUser, padding: Ei.all(20)));
                            }),
                        Touch(onTap: () {}, child: Iconr(Hi.strokeRoundedGift, padding: Ei.all(20)))
                      ],
                    ),

                    // intrinsic
                    Intrinsic(
                      spacer: Container(width: 1, height: 30, color: Colors.black12),
                      children:
                          [Hi.strokeRoundedPencil, Hi.strokeRoundedEraser, Hi.strokeRoundedScissor].generate((icon, i) {
                        return LzDropdown(
                            options: options,
                            builder: (action) {
                              return Touch(
                                  onTap: () {
                                    action.show();
                                  },
                                  child: Iconr(icon, padding: Ei.all(20)));
                            });
                      }),
                    ),

                    LzDropdown(
                        options: options,
                        builder: (action) {
                          return Column(
                            children: [
                              Touch(
                                  onTap: () {
                                    action.show();
                                  },
                                  child: Container(
                                    width: 200,
                                    padding: Ei.all(20),
                                    decoration: BoxDecoration(border: Br.all()),
                                    child: const Text(
                                        'This is an example about how to use custom dropdown widget in flutter. Feel free to fork or request addional features!',
                                        textAlign: Ta.end),
                                  )),
                            ],
                          ).end;
                        }),

        25.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BounceScroll(),
                      child: Row(
                        children: ['Transportation', 'Photography', 'Illustration', 'Reading', 'Sport Games', 'Editing'].generate((item, i) {
                          return LzDropdown(
                              options: options,
                              builder: (action) {
                                return InkTouch(
                                  onTap: () {
                                    action.show();
                                  },
                                  color: Colors.white,
                                  padding: Ei.sym(v: 13, h: 20),
                                  border: Br.only(['l'], except: i == 0),
                                  child: Text(item),
                                );
                              });
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
              padding: Ei.all(20),
              child: Touch(
                  onTap: () {
                    final icons = [Hi.strokeRoundedPencil, Hi.strokeRoundedDelete02, Hi.strokeRoundedCheckmarkSquare01];
                    context.dropdown(key3,
                        options: LzDropdown.of(['Edit', 'Delete', 'Approve'],
                            icons: icons,
                            asPrefix: true,
                            separated: ['Approve'],
                            critical: ['Delete']), onSelect: (value) {
                      logg(value);
                    });
                  },
                  child: Text('Show Something!', style: Gfont.orange, key: key3))),
        ),
      ),
    );
  }
}
