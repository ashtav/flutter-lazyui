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
      ),
      body: ListView(
        padding: Ei.all(20),
        physics: BounceScroll(),
        children: [
          Textr(
            Faker.random(),
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
          Slidebar(active: 1, spacing: 10, size: (int i) => [i == 1 ? 20 : 5, 5]),
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
          const Textml('Hello <b>World</b>, I am <b>Jhon</b>'),
          Container(
            decoration: BoxDecoration(border: Br.all()),
            padding: Ei.all(20),
            margin: Ei.only(t: 15),
            child: Text(
              'Hay',
              style: Gfont.bold,
            ),
          ).getChild(),
          Col(
            children: List.generate(1, (i) {
              String imgURL = 'https://master.saddannusantara.com//storagethumbnails//mnYKQoxZYYWJpEkgoxWkYUl7oml634fTxjTZFo3a.png';
              return LzImage(imgURL, size: 100);
            }),
          )
        ],
      ),
    );
  }
}

// This widget is to make simple html output (bold, italic, underline, etc)

class Textml extends StatelessWidget {
  final String text;
  const Textml(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: parseText(text),
      ),
    );
  }

  List<TextSpan> parseText(String text) {
    List<TextSpan> textSpans = [];

    TextStyle textStyle = const TextStyle(color: Colors.black);

    final regex = RegExp(r'<(\w+)[^>]*>(.*?)<\/\1>|(\S+\s*)');
    final matches = regex.allMatches(text);

    final result = matches.map((match) {
      final word = match.group(2) ?? match.group(3);
      final type = match.group(1) != null ? 'bold' : 'normal';
      return {'word': word, 'type': type};
    }).toList();

    for (Map map in result) {
      if (map['type'] == 'bold') {
        textSpans.add(TextSpan(text: map['word'], style: textStyle.copyWith(fontWeight: FontWeight.bold)));
      } else {
        textSpans.add(TextSpan(text: map['word'], style: textStyle));
      }
    }

    return textSpans;
  }
}

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
