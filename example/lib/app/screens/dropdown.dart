import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class DropdownView extends StatelessWidget {
  const DropdownView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();

    List<String> tabs = 10.generate((i) => Faker.category());

    void showDropdown(GlobalKey key) {
      final icons = [Ti.pencil, Ti.trash, Ti.share, Ti.map2, Ti.filter];

      LzDrop.show(key,
          options: DropOption.list(['Edit', 'Delete', 'Share', 'Location', 'Filters'], disabled: [3]),
          style: DropStyle(icons: icons, separators: ['Filters'], criticals: [1]));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown'),
        actions: [
          IconButton(
              key: key,
              onPressed: () {
                showDropdown(key);
              },
              icon: const Icon(La.bars))
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            physics: BounceScroll(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: tabs.generate((item, i) {
                GlobalKey ikey = GlobalKey();

                return InkTouch(
                  key: ikey,
                  onTap: () => showDropdown(ikey),
                  padding: Ei.sym(v: 13, h: 20),
                  border: Br.only(['l'], except: i == 0),
                  child: Textr(
                    item,
                    icon: Ti.chevronDown,
                  ),
                );
              }),
            ),
          ).lz.border(Br.only(['b'])),
          Expanded(
            child: LzListView(
              children: tabs.generate((item, i) {
                GlobalKey ikey = GlobalKey();

                return InkTouch(
                  key: ikey,
                  onTap: () => showDropdown(ikey),
                  padding: Ei.all(20),
                  border: Br.only(['t'], except: i == 0),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        item,
                        style: Gfont.bold,
                      ),
                      Textr(Faker.words(15), margin: Ei.only(t: 5))
                    ],
                  ).start,
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
