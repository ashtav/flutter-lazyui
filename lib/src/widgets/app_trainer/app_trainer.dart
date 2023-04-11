import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AppTrainerController {
  void Function({List<GlobalKey> keys, bool orderByKey}) open = ({keys = const [], orderByKey = false}) {};
}

class AppTrainer extends StatefulWidget {
  final Widget child;
  final List<Target> targets;
  final Function(AppTrainerController)? onInit;
  final AppTrainerController? controller;
  final Function(dynamic target)? onClickTarget;
  final Function()? onFinish, onSkip, onFinishOrSkip;
  final String? nextLabel, finishLabel, skipLabel;
  final bool showOnInit, showSectionLabel;
  final Color shadowColor;
  final double shadowOpacity;
  final Widget Function(Target target)? targetBuilder;

  const AppTrainer(
      {super.key,
      required this.child,
      this.targets = const [],
      this.onInit,
      this.controller,
      this.onClickTarget,
      this.onFinish,
      this.onSkip,
      this.onFinishOrSkip,
      this.nextLabel,
      this.finishLabel,
      this.skipLabel,
      this.showOnInit = true,
      this.showSectionLabel = false,
      this.shadowColor = Colors.black,
      this.shadowOpacity = .8,
      this.targetBuilder});

  @override
  State<AppTrainer> createState() => _AppTrainerState();
}

class _AppTrainerState extends State<AppTrainer> {
  bool isActive = false;
  List<TargetFocus> targets = [], specificTargets = [];

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
                            widget.targetBuilder?.call(e) ??
                                Container(
                                  padding: Ei.all(20),
                                  constraints: BoxConstraints(maxWidth: context.width * .6),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [Colors.black.withOpacity(.3), Colors.transparent],
                                      ),
                                      borderRadius: Br.radius(5),
                                      border: Br.all(color: Colors.white)),
                                  child: Col(
                                    children: [
                                      Iconr(
                                        e.icon ?? La.bookOpen,
                                        color: Colors.white,
                                        margin: Ei.only(b: 35),
                                        size: 30,
                                      ),
                                      if (e.title != null)
                                        Textr(
                                          e.title ?? "Titulo lorem ipsum",
                                          style: Gfont.bold.white,
                                          margin: Ei.only(b: 15),
                                        ),
                                      Text(e.description ?? '', style: Gfont.white)
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
                                          color: isLast ? Colors.transparent : Colors.white60,
                                        )
                                      : InkW(
                                          padding: Ei.sym(v: 15, h: 30),
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
                                          child: SlideUp(
                                            key: ValueKey(e.key),
                                            delay: (j * 100),
                                            child: Text(
                                              j == 0
                                                  ? text
                                                  : isLast && j == 2
                                                      ? ''
                                                      : (widget.skipLabel ?? 'Skip'),
                                              style: Gfont.white,
                                            ),
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

    if (widget.onInit == null && widget.showOnInit) {
      return showTutorial();
    }

    widget.onInit?.call(AppTrainerController()..open = showTutorial);
  }

  void showTutorial({List<GlobalKey> keys = const [], bool orderByKey = false}) {
    if (isActive) return;

    isActive = true;
    specificTargets = targets.where((e) => keys.contains(e.keyTarget)).toList();

    if (orderByKey) {
      specificTargets.sort((a, b) => keys.indexOf(a.keyTarget!) - keys.indexOf(b.keyTarget!));
    }

    TutorialCoachMark(
      targets: keys.isEmpty ? targets : specificTargets,
      hideSkip: true,
      colorShadow: widget.shadowColor,
      opacityShadow: widget.shadowOpacity,
      onClickTarget: (target) {
        widget.onClickTarget?.call(target.identify);
      },
      onSkip: () {
        isActive = false;
        widget.onSkip?.call();
        widget.onFinishOrSkip?.call();
      },
      onFinish: () {
        isActive = false;
        widget.onFinish?.call();
        widget.onFinishOrSkip?.call();
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
