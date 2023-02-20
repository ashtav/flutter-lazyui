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
    GlobalKey key = GlobalKey();

    return InkW(
      key: key,
      onTap: () {
        DropdownDialog.open(key.currentContext!,
            offset: const Offset(20, 0), options: List.generate(4, (index) => 'Option $index'), disableds: [2], dangers: [1], onSelect: (o, i) {
          logg(o);
        });
      },
      color: Colors.white,
      padding: Ei.all(20),
      border: Br.only(['t'], except: index == 0),
      child: Row(
        mainAxisAlignment: Maa.spaceBetween,
        children: [Textr('Item $index'), const Icon(Icons.more_vert)],
      ),
    );
  }
}
