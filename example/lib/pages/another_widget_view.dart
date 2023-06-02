import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AnotherWidgetView extends StatelessWidget {
  const AnotherWidgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Widgets'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(La.bars),
            onPressed: () {
              List<IconData> icons = [La.infoCircle, La.edit, La.trashAlt];

              LzOption.show(context, options: ['See Detail', 'Edit', 'Delete'].options(icons: icons), confirmOnTap: [2], onSelect: (value) {
                logg(value.option);
              });
            },
          ),
        ],
      ),
      body: ListView(
        padding: Ei.all(20),
        physics: BounceScroll(),
        children: [
          Textr(
            Faker.words(),
            icon: La.user,
          ),
          const Textr(
            '4,5',
            icon: La.star,
            iconStyle: IconStyle(asSuffix: true),
          ),
          const SizedBox(
            height: 33,
          ),
          const Col(
            children: [
              LzBadge(
                text: 'Welcome to LazyUi',
              ),
            ],
          ),
          const SizedBox(
            height: 33,
          ),
          LzSlidebar(active: 1, spacing: 10, size: (int i) => [i == 1 ? 20 : 5, 5]),
          const SizedBox(
            height: 33,
          ),
          const TextDivider(
            Text(
              'Text Line',
            ),
          ),
          const SizedBox(
            height: 33,
          ),
          Textml(
            'Hello <b>World</b>, I am <i>Jhon</i> from <b><u><i>Indonesia</i></u></b>',
            style: Gfont.muted,
          ),
          Container(
            decoration: BoxDecoration(border: Br.all()),
            padding: Ei.all(20),
            margin: Ei.only(t: 15),
            child: Text(
              'Hay',
              style: Gfont.bold,
            ),
          ).getChild(),
        ],
      ),
    );
  }
}

// This widget is to make simple html output (bold, italic, underline, etc)

extension WidgetExtension on Widget {
  Widget getChild<T extends Widget>() {
    // only widget that has child property
    List<Widget> allowed = [Container()];

    if (!allowed.contains(this)) {
      return (this as Container).child ?? Container();
    }

    return Container();
  }
}
