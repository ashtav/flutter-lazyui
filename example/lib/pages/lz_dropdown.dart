part of page;

class LzDropdownView extends StatelessWidget {
  const LzDropdownView({super.key});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey(), bottomKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown'),
        actions: [
          IconButton(
              key: key,
              onPressed: () {
                final icons = [
                  La.pen,
                  La.trash,
                  La.bell,
                  La.checkCircle,
                  La.sortAmountDown,
                  La.share
                ];
                LzDropdownOption.show(key.currentContext,
                    options: [
                      'Edit',
                      'Delete',
                      'Reminder',
                      'Uncheck All',
                      'Sort',
                      'Share'
                    ].options(icons: icons),
                    style: const LzDropdownStyle(
                        separators: [1], separatorHeight: 3));
              },
              icon: const Icon(La.bars))
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BounceScroll(),
            child: Row(
              children: List.generate(10, (i) {
                final gkey = GlobalKey();

                return InkW(
                  key: gkey,
                  onTap: () {
                    final options = ['Details', 'Archive', 'Edit', 'Delete']
                        .options(disableds: [1]);
                    LzDropdownOption.show(gkey.currentContext,
                        options: options, onSelect: (option) {});
                  },
                  padding: Ei.sym(h: 20, v: 15),
                  color: Colors.white,
                  border: Br.only(['l'], except: i == 0),
                  child: Text(Faker.words().ucwords),
                );
              }),
            ),
          ),
          Expanded(
            child: LzListView(
              children: [
                Col(
                  children: List.generate(15, (i) {
                    return ProductItem(
                      border: Br.only(['t'], except: i == 0),
                    );
                  }),
                )
              ],
            ),
          ),
          Container(
            padding: Ei.all(10),
            decoration:
                BoxDecoration(color: Colors.white, border: Br.only(['t'])),
            child: Row(
              children: [
                Icon(Ti.settings, key: bottomKey).onPressed(() {
                  LzDropdownOption.show(bottomKey.context,
                      options: [
                        'Edit',
                        'Delete',
                        'Reminder',
                        'Uncheck All',
                        'Sort',
                        'Share'
                      ].options(),
                      style: const LzDropdownStyle(
                          separators: [1], separatorHeight: 3));
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final BoxBorder? border;
  const ProductItem({super.key, this.border});

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey();

    return InkW(
      onTap: () {
        final options =
            ['Edit', 'Delete'].options(icons: [La.pen, La.trash], dangers: [1]);

        final subOptions = {
          1: ['Cancel', 'Confirm'].options(
              icons: [La.times, La.checkCircle],
              styles: (i) {
                return {
                  1: const OptionStyle(bold: true, color: Colors.redAccent)
                };
              }),
        };

        LzDropdownOption.show(key.context,
            options: options,
            subOptions: subOptions,
            offset: const CustomOffset(by: 43), onSelect: (state) {
          logg(state.option.toMap());

          switch (state.option.option) {
            case 'Cancel':
              state.back();

              break;

            case 'Confirm':
              logg('Deleted!');

              break;
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
      padding: Ei.all(20),
      border: border,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: Maa.spaceBetween,
        children: [
          Text(Faker.words().ucwords),
          Icon(
            La.ellipsisV,
            key: key,
          )
        ],
      ),
    );
  }
}
