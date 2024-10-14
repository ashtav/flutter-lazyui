import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class PopoverView extends StatelessWidget {
  const PopoverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Popover'),
            actions: [Ti.userCircle, Ti.infoCircle].generate((icon, i) {
              return LzPopover(
                  content: const Content(),
                  builder: (_) => Iconr(icon,
                      color: Colors.white, padding: Ei.sym(v: 10, h: 20)),
                  child: Iconr(icon, padding: Ei.sym(v: 10, h: 20)));
            })),
        body: LzListView(
          children: [
            Column(
              children: [
                LzPopover(
                  content: Row(
                    mainAxisSize: Mas.min,
                    children: [Ti.pencil, Ti.trash, Ti.share2, Ti.books]
                        .generate((icon, i) {
                      return SlideAnimate(
                          delay: i * 100,
                          child: Iconr(
                            icon,
                            padding: Ei.all(20),
                          ));
                    }),
                  ),
                  backBlur: true,
                  // isDefaultOpen: true,
                  child: Container(
                    padding: Ei.all(20),
                    width: 200,
                    color: Colors.white,
                    child: const Textml(
                        '<b>Example of Textml</b> <br><br>Hello this is example of Textml usage, <b>bold</b> and <strong>strong</strong> with <u><i>italic i</i></u> and <em>italic em</em>, <del>strike</del> also <mark>mark</mark> <br><br>Break your sentences using br tag.'),
                  ),
                ),
              ],
            ).start,
            Container(
                padding: Ei.sym(h: 20, v: 150),
                child: Row(
                  mainAxisAlignment: Maa.center,
                  children: [
                    LzPopover(
                      content: const Content(),
                      offset: const Offset(55, 25),
                      child: Iconr(
                        Ti.feather,
                        padding: Ei.all(15),
                      ),
                    ),
                    LzPopover(
                      content: const Content(),
                      offset: const Offset(55, 25),
                      child: Iconr(
                        Ti.archive,
                        padding: Ei.all(15),
                      ),
                    ),
                    LzPopover(
                      content: const Content(),
                      builder: (child) {
                        return Iconr(
                          Ti.gift,
                          padding: Ei.all(15),
                          color: Colors.white,
                        );
                      },
                      child: Iconr(
                        Ti.gift,
                        padding: Ei.all(15),
                      ),
                    ),
                  ],
                ).gap(5)),
            550.height
          ],
        ));
  }
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Ei.all(20),
      child: Column(
        children: [Text(Faker.words(15), style: Gfont.black)],
      ),
    );
  }
}
