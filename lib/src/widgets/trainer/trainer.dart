import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

export 'src/controller.dart';
export 'src/target.dart';

class Trainer extends StatefulWidget {
  final Widget child;
  final List<Target> targets;
  final Function(TrainerController)? onInit;
  final TrainerController? controller;
  final Function(dynamic target)? onClickTarget;
  final Function()? onFinish, onSkip, onFinishOrSkip;
  final String? nextLabel, finishLabel, skipLabel;
  final bool showOnInit;
  final bool showSectionLabel;
  final Color shadowColor;
  final double shadowOpacity;
  final Widget Function(Target target)? targetBuilder;
  final BuildContext? context;

  const Trainer(
      {required this.child,
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
      this.targetBuilder,
      this.context,
      super.key});

  @override
  State<Trainer> createState() => _TrainerState();
}

class _TrainerState extends State<Trainer> {
  bool isActive = false;
  List<TargetFocus> targetFocus = [];

  // prepare targets for the trainer
  void onInitialized() {
    targetFocus = [];
    final targets = widget.targets;

    targets.generate((target, i) {
      targetFocus.add(TargetFocus(keyTarget: target.key, contents: [
        TargetContent(
            align: target.align,
            builder: (context, controller) {
              double radius = target.radius ?? LazyUi.radius;

              bool hasTitle = target.title != null;
              Color backgroundColor = target.backgroundColor ?? Colors.transparent;
              Color textColor = target.textColor ?? Colors.white70;

              return Column(
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 280, minWidth: 200, maxHeight: context.height / 2),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      border: Br.all(color: Colors.white70),
                      borderRadius: Br.radius(radius),
                    ),
                    child: SingleChildScrollView(
                      physics: BounceScroll(),
                      padding: Ei.all(20),
                      child: Column(
                        children: [
                          Iconr(target.icon ?? Ti.book, size: 50, color: textColor, margin: Ei.only(b: 25)),
                          if (hasTitle) Textr(target.title!, style: Gfont.bold.fcolor(textColor), margin: Ei.only(b: 8)),
                          Text(target.description!, style: Gfont.color(textColor))
                        ],
                      ).start,
                    ),
                  ),

                  // action buttons
                  Row(
                    children: ['Skip', 'Next'].generate((label, i) {
                      double h = 20;

                      return SlideLeft(
                        delay: (i + 1) * 200,
                        child: Textr(label,
                            style: Gfont.color(Colors.white),
                            padding: Ei.only(v: 15, l: i == 0 ? h : h + 10, r: i == 0 ? h + 10 : h),
                            border: Br.only(['l'], except: i == 0, color: Colors.white70)).onTap(() {
                              logg('clicked $label');
                            }),
                      );
                    }),
                  )
                ],
              ).start;
            })
      ]));
    });

    Bindings.onRendered(() => showTrainer());
  }

  // show the trainer
  void showTrainer() {
    TutorialCoachMark(
      targets: targetFocus,
      hideSkip: true,
      colorShadow: widget.shadowColor,
      opacityShadow: widget.shadowOpacity,
      onClickTarget: (target) {},
      onSkip: () {
        return false;
      },
      onFinish: () {},
    ).show(context: widget.context ?? context);
  }

  @override
  void initState() {
    super.initState();
    onInitialized();
  }

  @override
  void didUpdateWidget(Trainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    logg('trainer didUpdateWidget');
    onInitialized();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => !isActive, child: widget.child);
  }
}
