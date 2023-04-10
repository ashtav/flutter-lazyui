part of page;

class AppTrainerView extends StatelessWidget {
  const AppTrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    final key1 = GlobalKey(), key2 = GlobalKey(), key3 = GlobalKey();
    AppTrainerController controller = AppTrainerController();

    final forms = LzForm.make(['name']);

    return AppTrainer(
      controller: controller,
      onClickTarget: (target) {
        logg(target);
      },
      onInit: (control) {
        Utils.timer(() {
          control.open(keys: [forms['name']!.key], orderByKey: true);
        }, 2.s);

        // Utils.timer(() {
        //   LzPopupPositioned.show(key1.context,
        //       child: Col(
        //         children: [
        //           Text(
        //             Faker.words(25),
        //             style: Gfont.black,
        //           )
        //         ],
        //       ),
        //       builder: (child) => SlideUp(child: child.animate(onPlay: (c) => c.repeat(reverse: true)).moveY(begin: -5)));
        // }, 1.s);
      },
      targets: [
        Target(
          key: key1,
          title: 'Search Icon',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
        ),
        Target(
          key: key2,
          identify: 'calendar',
          title: 'Calendar Icon',
          onNext: (control) {
            // control.skip();
            control.next();
          },
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
        ),
        Target(
            key: key3,
            identify: 'fab',
            title: 'Floating Action Button',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
            align: ContentAlign.top),
        Target(
            key: forms['name']!.key,
            title: 'Button Square',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
            align: ContentAlign.bottom,
            shape: ShapeLightFocus.RRect),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('App Trainer'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Iconr(
                  La.search,
                  key: key1,
                  flipX: true,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  La.calendar,
                  key: key2,
                ))
          ],
        ),
        body: ListView(
          padding: Ei.all(20),
          physics: BounceScroll(),
          children: [
            Col(
              children: [
                LzFormGroup(
                  label: 'Biodata',
                  prefixIcon: La.user,
                  children: [
                    LzForm.input(
                      label: 'Name',
                      hint: 'Enter your name',
                      model: forms['name'],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          key: key3,
          onPressed: () {
            controller.open();
          },
          child: const Icon(La.plus),
        ),
      ),
    );
  }
}
