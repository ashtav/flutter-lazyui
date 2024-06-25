import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class DropdownView extends StatelessWidget {
  const DropdownView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey(), key2 = GlobalKey();

    List<String> tabs = 10.generate((i) => Faker.category());

    final icons = [Ti.pencil, Ti.trash, null, Ti.map2, Ti.filter];
    final subOptions = {
      'Share to': DropOption.list(['Facebook', 'Instagram', 'Tiktok']),
      'Filters': DropOption.list(
          ['Price', 'Rating', 'Distance', 'Category', 'Open now', 'Sort by'])
    };

    void showDropdown(GlobalKey key) {
      LzDrop.show(key,
          options: DropOption.list(
              ['Edit', 'Delete', 'Share to', 'Location', 'Filters'],
              disabled: [3], subOptions: subOptions),
          style: DropStyle(
              icons: icons,
              separators: ['Filters'],
              criticals: [1],
              alignment: DropAlignment.right), onSelect: (value) {
        logg(value.toMap());
      });
    }

    final font = Gfont.style(context);
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
                return LzDropItem(
                  options: DropOption.list(
                      ['Edit', 'Delete', 'Share to', 'Location', 'Filters'],
                      disabled: [3], subOptions: subOptions),
                  style: DropStyle(
                      icons: icons,
                      backBlur: true,
                      separators: ['Filters'],
                      criticals: [1]),
                  onSelect: (value) {
                    logg(value.toMap());
                  },
                  child: LzCard(
                    stacked: true,
                    children: [
                      Text(
                        item,
                        style: font.bold,
                      ),
                      Textr(Faker.words(15), margin: Ei.only(t: 5))
                    ],
                  ),
                ).margin(b: 15);
              }),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white30.adaptWithTheme, border: Br.only(['t', 'b'])),
        padding: Ei.sym(h: 20),
        child: Row(
          children: [
            Iconr(
              Ti.menu2,
              key: key2,
              padding: Ei.sym(v: 15),
            ).onTap(() {
              showDropdown(key2);
            })
          ],
        ),
      ),
    );
  }
}
