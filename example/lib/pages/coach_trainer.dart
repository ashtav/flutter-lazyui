// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class CoachTrainerView extends StatelessWidget {
  const CoachTrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    final key1 = GlobalKey(), key2 = GlobalKey(), key3 = GlobalKey(), key4 = GlobalKey();
    AppTrainerController controller = AppTrainerController();

    return AppTrainer(
      controller: controller,
      showOnInit: false,
      onClickTarget: (target) {
        logg(target);
      },
      targets: [
        TrainerTarget(
          key: key1,
          title: 'Search Icon',
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
        ),
        TrainerTarget(
          key: key2,
          identify: 'calendar',
          title: 'Calendar Icon',
          onNext: (control) {
            // control.skip();
            control.next();
          },
          description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
        ),
        TrainerTarget(
            key: key3,
            identify: 'fab',
            title: 'Floating Action Button',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
            align: ContentAlign.top),
        TrainerTarget(
            key: key4,
            title: 'Button Square',
            description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pulvinar tortor eget maximus iaculis.',
            align: ContentAlign.bottom),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Coach Trainer'),
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
              children: [LzButton(key: key4, text: 'Hello World!', onTap: (_) {})],
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

class AppTrainerController {
  void Function() open = () {};
}

class AppTrainer extends StatefulWidget {
  final Widget child;
  final List<TrainerTarget> targets;
  final bool showOnInit;
  final AppTrainerController? controller;
  final Function(dynamic target)? onClickTarget;
  final Function()? onFinish, onSkip;
  const AppTrainer(
      {super.key,
      required this.child,
      this.targets = const [],
      this.showOnInit = true,
      this.controller,
      this.onClickTarget,
      this.onFinish,
      this.onSkip});

  @override
  State<AppTrainer> createState() => _AppTrainerState();
}

class _AppTrainerState extends State<AppTrainer> {
  bool isActive = false;
  List<TargetFocus> targets = [];

  void initTrainer() {
    targets = [];
    int length = widget.targets.length;

    for (var i = 0; i < widget.targets.length; i++) {
      TrainerTarget e = widget.targets[i];

      targets.add(
        TargetFocus(identify: e.identify ?? i, keyTarget: e.key, radius: 250, contents: [
          TargetContent(
              align: e.align,
              builder: (context, controller) {
                bool isLast = i >= length - 1;
                String text = isLast ? 'Finish' : 'Next';

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: e.contents ??
                      [
                        Container(
                          padding: Ei.all(20),
                          constraints: BoxConstraints(maxWidth: context.width * .6),
                          decoration: BoxDecoration(borderRadius: Br.radius(5), border: Br.all(color: Colors.white)),
                          child: Col(
                            children: [
                              Iconr(
                                e.icon ?? La.bookOpen,
                                color: Colors.white,
                                margin: Ei.only(b: 35),
                                size: 30,
                              ),
                              Textr(
                                e.title ?? "Titulo lorem ipsum",
                                style: Gfont.bold.white,
                                margin: Ei.only(b: 15),
                              ),
                              Text(e.description ?? 'Your description here', style: Gfont.white)
                            ],
                          ),
                        ),
                        Row(
                          children: List.generate(3, (j) {
                            return j == 1
                                ? Container(
                                    height: 20,
                                    width: 1,
                                    color: isLast ? Colors.transparent : Colors.white,
                                  )
                                : InkW(
                                    padding: Ei.sym(v: 15, h: 22),
                                    onTap: isLast && j == 2
                                        ? null
                                        : () {
                                            if (j == 2) {
                                              controller.skip();
                                              return;
                                            }

                                            if (e.onNext == null) {
                                              controller.next();
                                            } else {
                                              e.onNext?.call(controller);
                                            }
                                          },
                                    child: Text(
                                      j == 0
                                          ? text
                                          : isLast && j == 2
                                              ? ''
                                              : 'Skip',
                                      style: Gfont.white,
                                    ),
                                  );
                          }),
                        ).margin(t: 15),
                      ],
                );
              })
        ]),
      );
    }

    if (widget.showOnInit) {
      showTutorial();
    }
  }

  void showTutorial() {
    isActive = true;

    TutorialCoachMark(
      targets: targets,
      hideSkip: true,
      onClickTarget: (target) {
        widget.onClickTarget?.call(target.identify);
      },
      onSkip: () {
        isActive = false;
        widget.onSkip?.call();
      },
      onFinish: () {
        isActive = false;
        widget.onFinish?.call();
      },
    ).show(context: context);
  }

  @override
  void initState() {
    super.initState();
    initTrainer();
  }

  @override
  Widget build(BuildContext context) {
    widget.controller?.open = showTutorial;
    initTrainer();

    return WillPopScope(onWillPop: () async => !isActive, child: widget.child);
  }
}

class TrainerTarget {
  final GlobalKey key;
  final ContentAlign align;
  final List<Widget>? contents;
  final String? identify, title, description;
  final IconData? icon;
  final Function(TutorialCoachMarkController)? onNext;

  const TrainerTarget(
      {required this.key, this.identify, this.align = ContentAlign.bottom, this.contents, this.title, this.description, this.icon, this.onNext});
}
