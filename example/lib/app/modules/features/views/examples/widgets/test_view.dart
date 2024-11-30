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

class DropBuilder extends StatelessWidget {
  final List<LzDropOption> options;
  const DropBuilder(this.options, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: options.generate((item, i) {
        return InkTouch(
          onTap: () {
            context.lz.pop(LzDropValue(item.label, i));
          },
          padding: Ei.sym(v: 13, h: 20),
          border: Br.only(['l'], except: i == 0),
          color: Colors.white,
          child: Icon(item.icon),
        );
      }),
    ).lz.clip(all: 7);
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [Hi.filterVertical, Hi.sortingAZ02, Hi.settings01];
    final options = LzDropdown.of(['Filter', 'Sort AZ', 'Settings'],
        icons: icons, separated: [2], focused: ['Settings']);

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Test View'),
          actions: [
            LzDropdown(
                options: options,
                builder: (key, action) {
                  return IconButton(
                      onPressed: () => action.show().then((value) {
                            logg(value?.index == 0);
                          }),
                      icon: Icon(Hi.menu02, key: key));
                },
                child: const Icon(Hi.menu02, color: Colors.white)),
          ],
        ),
        body: Column(
          children: [
            LzTabView(
              tabs: 15.generate((i) => Faker.category()),
              onTap: (key, i) {},
              builder: (label, i) {
                return Textr(label,
                    padding: Ei.sym(v: 13, h: 25),
                    border: Br.only(['b'],
                        color: i == 0 ? Colors.black87 : Colors.white));
              },
            ),
            Expanded(
              child: LzListView(
                children: [
                  LzDropdown(
                      options: LzDropdown.of([
                        'Details',
                        'Edit',
                        'Delete'
                      ], icons: [
                        Hi.informationCircle,
                        Hi.pencil,
                        Hi.delete01
                      ]),
                      dropBuilder: (options) => DropBuilder(options),
                      builder: (key, action) {
                        return Touch(
                          key: key,
                          onTap: () {
                            action.show();
                          },
                          child: const Column(
                            children: [
                              SizedBox(
                                  width: 230,
                                  child: Text(
                                      'Programmer is the person who write code to solve problem!')),
                            ],
                          ).start,
                        );
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
