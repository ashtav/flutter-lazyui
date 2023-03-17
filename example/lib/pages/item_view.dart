import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item View'),
      ),
      body: ListView(
        physics: BounceScroll(),
        children: [
          Col(
            children: List.generate(25, (i) => Item(i)),
          )
        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  final int index;
  const Item(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkW(
      onTap: () {
        // make options
        final icons = [La.infoCircle, La.archive, La.pen, La.trashAlt];
        final options = ['Details', 'Archive', 'Edit', 'Delete'].make((data, i) => Option(option: data[i], icon: icons[i], disabled: i == 1));

        // quick way to make options, icons and values
        // final options = ['Details', 'Archive', 'Edit', 'Delete'].makeOptions(icons: icons);

        // show dropdown
        LzDropdown.show(context,
            options: options,
            offset: const Offset(20, 0),
            style: LzDropdownStyle(useBorder: true, separators: [2], dangers: [3], separatorHeight: 5), onSelect: (option) {
          logg(option.toMap());
        });
      },
      color: Colors.white,
      padding: Ei.all(20),
      border: Br.only(['t'], except: index == 0),
      child: Row(
        mainAxisAlignment: Maa.spaceBetween,
        children: [Textr(Faker.random(3).ucwords), const Icon(La.ellipsisV)],
      ),
    );
  }
}
