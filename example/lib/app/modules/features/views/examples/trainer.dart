import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TrainerView extends StatelessWidget {
  const TrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    final key1 = GlobalKey(),
        key2 = GlobalKey(),
        key3 = GlobalKey(),
        key4 = GlobalKey();
    final controller = TrainerController();
    final font = Gfont.style(context);

    return Trainer(
      controller: controller,
      targets: [key1, key2, key3, key4].generate((key, i) {
        List<String> titles = [
          'Search Icon',
          'Calendar Icon',
          'Floating Action Button',
          'Button'
        ];
        return Target(
            key: key,
            title: titles[i],
            description: Faker.words(17),
            shape: i == 3 ? ShapeLightFocus.RRect : null,
            align: i == 2 ? ContentAlign.top : ContentAlign.bottom);
      }),
      // onInit: (trainer) async {
      //   // trainer.show();
      //   // controller.show();

      //   // await Future.delayed(3.s);
      //   // controller.hide();
      // },
      style: TrainerStyle(content: (icon, title, description) {
        return Container(
          constraints: const BoxConstraints(maxWidth: 290, minWidth: 200),
          child: Column(
            children: [
              Text(title, style: font.bold.white),
              Text(description, style: font.white)
            ],
          ).start.gap(10),
        );
      }, control: (skip, next, isLast) {
        return Container(
          margin: Ei.only(t: 30),
          decoration: BoxDecoration(
              border: Br.all(color: Colors.white), borderRadius: Br.radius(7)),
          child: Row(
            children:
                (isLast ? ['Done'] : ['Skip', 'Next']).generate((item, i) {
              return Touch(
                onTap: () {
                  if (i == 0 || isLast) {
                    skip();
                  } else {
                    next();
                  }
                },
                hoverable: true,
                child: Textr(item,
                    style: font.white,
                    padding: Ei.sym(h: 30, v: 10),
                    border:
                        Br.only(['l'], except: i == 0, color: Colors.white70)),
              );
            }),
          ).min,
        );
      }),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Trainer'),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [La.search, La.calendar].generate((icon, i) =>
                Iconr(icon, flipX: true, key: [key1, key2][i])
                    .onPressed(() => {}))),
        body: LzListView(
          children: [
            const Textml(
                'This trainer is created using the <b>tutorial_coach_mark: ^1.2.11</b> package, which has been customized with unique styles and features to ensure it can be utilized easily and flexibly.'),
            Column(
              children: [
                LzButton(
                  key: key4,
                  text: 'Tap to show trainer',
                  icon: Ti.books,
                  onTap: (_) {
                    controller.show();
                  },
                )
              ],
            ).start.margin(t: 25)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: key3,
          onPressed: () => controller.show(),
          backgroundColor: Colors.white,
          child: const Icon(La.info, color: Colors.black54),
        ),
      ),
    );
  }
}
