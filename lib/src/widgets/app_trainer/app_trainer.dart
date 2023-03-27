import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AppTrainerController {
  void Function() open = () {};
}

class AppTrainer extends StatefulWidget {
  final Widget child;
  final List<Target> targets;
  final Function(AppTrainerController)? onInit;
  final AppTrainerController? controller;
  final Function(dynamic target)? onClickTarget;
  final Function()? onFinish, onSkip;
  final String? nextLabel, finishLabel, skipLabel;
  final bool showSectionLabel;
  const AppTrainer(
      {super.key,
      required this.child,
      this.targets = const [],
      this.onInit,
      this.controller,
      this.onClickTarget,
      this.onFinish,
      this.onSkip,
      this.nextLabel,
      this.finishLabel,
      this.skipLabel,
      this.showSectionLabel = false});

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
      Target e = widget.targets[i];

      targets.add(
        TargetFocus(
            identify: e.identify ?? i,
            keyTarget: e.key,
            radius: e.shape == ShapeLightFocus.RRect ? (e.radius ?? 5) : 250,
            shape: e.shape,
            contents: [
              TargetContent(
                  align: e.align,
                  builder: (context, controller) {
                    bool isLast = i >= length - 1;
                    String text = isLast ? (widget.finishLabel ?? 'Finish') : (widget.nextLabel ?? 'Next');

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
                            if (widget.showSectionLabel)
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
                                                    : (widget.skipLabel ?? 'Skip'),
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

    if (widget.onInit == null) {
      return showTutorial();
    }

    widget.onInit?.call(AppTrainerController()..open = showTutorial);
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
  Widget build(BuildContext context) {
    widget.controller?.open = showTutorial;
    initTrainer();

    return WillPopScope(onWillPop: () async => !isActive, child: widget.child);
  }
}

class Target {
  final GlobalKey key;
  final ContentAlign align;
  final List<Widget>? contents;
  final String? identify, title, description;
  final IconData? icon;
  final ShapeLightFocus? shape;
  final double? radius;
  final Function(TutorialCoachMarkController)? onNext;

  const Target(
      {required this.key,
      this.identify,
      this.align = ContentAlign.bottom,
      this.contents,
      this.title,
      this.description,
      this.icon,
      this.shape,
      this.radius,
      this.onNext});
}
