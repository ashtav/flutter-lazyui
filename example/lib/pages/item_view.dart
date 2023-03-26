import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ItemView extends StatelessWidget {
  const ItemView({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = List.generate(3, (i) => GlobalKey());
    final key = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item View'),
        actions: [
          IconButton(
              key: key,
              onPressed: () {
                final icons = [La.pen, La.trash, La.bell, La.checkCircle, La.sortAmountDown, La.share];
                LzDropdown.show(key.currentContext!,
                    offset: const Offset(20, 0),
                    options: ['Edit', 'Delete', 'Reminder', 'Uncheck All', 'Sort', 'Share'].options(icons: icons),
                    style: const LzDropdownStyle(separators: [1], separatorHeight: 3));

                Utils.timer(() {
                  context.focus();
                });
              },
              icon: const Icon(La.bars))
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white, border: Br.only(['b'])),
            child: SingleChildScrollView(
              physics: BounceScroll(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(15, (i) {
                  GlobalKey key = GlobalKey();

                  return InkW(
                    key: key,
                    onTap: () {
                      final options = ['Edit', 'Delete'].options(icons: [La.pen, La.trash], dangers: [1]);

                      final subOptions = {
                        1: ['Cancel', 'Confirm'].options(
                            icons: [La.times, La.checkCircle],
                            styles: (i) {
                              return {1: const OptionStyle(bold: true, color: Colors.redAccent)};
                            }),
                      };

                      // final options = ['Edit', {'Delete': ['Cancel', 'Confirm']}].options2(icons: [La.pen, La.trash], subIcons: {1: [La.times, La.checkCircle]});

                      LzDropdown.show(key.context, options: options, subOptions: subOptions, dismissOnSelect: false, onSelect: (control) {
                        logg(control.option.toMap());

                        switch (control.option.option) {
                          case 'Cancel':
                            control.back();

                            break;

                          case 'Confirm':
                            logg('Deleted!');

                            break;
                          default:
                            context.pop();
                        }

                        /* Or you can use this
                        
                        if (control.option.option == 'Cancel') {
                          control.back();
                        } else {
                          context.pop();
                        }

                        Then use switch case for other options

                        */
                      });
                    },
                    padding: Ei.sym(v: 15, h: 20),
                    border: Br.only(['l'], except: i == 0),
                    child: Text(Faker.random(2).ucwords),
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              physics: BounceScroll(),
              children: [
                Intrinsic(
                    children: ['Item 1', 'Item 2', 'Item 3'].make((data, i) {
                  return Expanded(
                    // flex: i == 0 ? 2 : 1,
                    child: LzButton(
                      key: keys[i],
                      text: data[i],
                      onTap: (_) {
                        final options = ['Details', 'Archive', 'Edit', 'Delete'].make((data, i) => Option(option: data[i], disabled: i == 1));

                        LzDropdown.show(keys[i].currentContext!,
                            options: options,
                            offset: const Offset(20, 0),
                            style: const LzDropdownStyle(useBorder: true, separators: [2], separatorHeight: 5),
                            onSelect: (option) {});
                      },
                    ),
                  );
                })).padding(others: 20),
                Col(
                  children: List.generate(25, (i) => Item(i)),
                )
              ],
            ),
          ),
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
        // final options = ['Details', 'Archive', 'Edit', 'Delete'].make((data, i) => Option(option: data[i], icon: icons[i], disabled: i == 1));

        // quick way to make options, icons and values
        final options = ['Details', 'Archive', 'Edit', 'Delete'].options(icons: icons);

        // show dropdown
        LzDropdown.show(context,
            options: options,
            offset: const Offset(20, 0),
            style: const LzDropdownStyle(useBorder: true, separators: [2], separatorHeight: 5),
            onSelect: (option) {});
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
