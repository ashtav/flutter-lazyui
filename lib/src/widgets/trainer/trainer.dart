import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

export 'src/controller.dart';
export 'src/target.dart';
export 'src/trainer_style.dart';

class Trainer extends StatefulWidget {
  final Widget child;
  final List<Target> targets;
  final TrainerController? controller;
  final Function(TrainerController trainer)? onInit;
  final Function(String id)? onClickTarget;
  final Function()? onFinish, onSkip;
  final TrainerStyle? style;
  final BuildContext? context;

  const Trainer(
      {required this.child,
      this.targets = const [],
      this.controller,
      this.onInit,
      this.onClickTarget,
      this.onFinish,
      this.onSkip,
      this.style,
      this.context,
      super.key});

  @override
  State<Trainer> createState() => _TrainerState();
}

class _TrainerState extends State<Trainer> {
  List<TargetFocus> targetFocus = [];
  Function onNext = () {};
  bool isActive = false;

  String id(dynamic text) => text.toString().toLowerCase().replaceAll(' ', '_');

  // prepare targets for the trainer
  void initialized() {
    if (isActive) return;

    targetFocus = [];
    final targets = widget.targets;

    targets.generate((target, i) {
      targetFocus.add(TargetFocus(
          identify: id(target.title ?? 'target_$i'),
          keyTarget: target.key,
          shape: target.shape,
          radius: target.radius ?? LazyUi.radius,
          contents: [
            TargetContent(
                align: target.align,
                builder: (context, controller) {
                  // set onNext callback, so that we can call it anywhere
                  onNext = controller.next;

                  // get target properties and styles
                  bool hasTitle = target.title != null;
                  Color backgroundColor = target.backgroundColor ?? Colors.transparent;
                  Color textColor = target.textColor ?? Colors.white.withOpacity(.8);
                  double radius = target.radius ?? LazyUi.radius;

                  Widget targetWidget = SingleChildScrollView(
                    physics: BounceScroll(),
                    padding: Ei.all(20),
                    child: target.child ??
                        Column(
                          children: [
                            Iconr(target.icon ?? Ti.book, size: 50, color: textColor, margin: Ei.only(b: 25)),
                            if (hasTitle)
                              Textr(
                                target.title!,
                                style: Gfont.bold.fcolor(textColor),
                                margin: Ei.only(b: 8),
                              ),
                            Text(
                              target.description!,
                              style: Gfont.color(textColor),
                            )
                          ],
                        ).start,
                  );

                  return Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: 260, minWidth: 200, maxHeight: widget.style?.maxHeight ?? context.height / 2),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Br.all(color: Colors.white70),
                          borderRadius: Br.radius(radius),
                        ),
                        child: (widget.style?.backBlur ?? true)
                            ? BackdropFilter(filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), child: targetWidget)
                                .lz
                                .clip(all: radius)
                            : targetWidget,
                      ),

                      // action buttons
                      Row(
                        children: ['Skip', 'Next'].generate((label, i) {
                          double h = 20;
                          bool isSkip = i == 0;
                          bool disabled = false;

                          if (targets.length == 1 && i == 1) {
                            disabled = true;
                          }

                          return SlideLeft(
                            key: UniqueKey(),
                            delay: (i + 1) * 200,
                            child: Container(
                                    padding: Ei.only(v: 15, l: i == 0 ? h : h + 10, r: i == 0 ? h + 10 : h),
                                    decoration:
                                        BoxDecoration(border: Br.only(['l'], except: i == 0, color: Colors.white70)),
                                    child: Text(
                                      label,
                                      style: LazyUi.font.copyWith(color: Colors.white, letterSpacing: 2),
                                    ).lz.disabled(disabled, 0))
                                .onTap(
                              () {
                                if (!disabled) {
                                  if (isSkip) {
                                    for (var _ in targets) {
                                      controller.next();
                                    }

                                    widget.onSkip?.call();
                                  }

                                  // next target
                                  else {
                                    controller.next();
                                  }
                                }
                              },
                            ),
                          );
                        }),
                      )
                    ],
                  ).start;
                })
          ]));
    });

    if (widget.onInit == null && widget.controller == null) {
      Bindings.onRendered(() => showTrainer());
    }

    // initialize the trainer
    else {
      final controller = widget.controller ?? TrainerController();

      // set controller methods
      controller.show = showTrainer;
      controller.hide = () {
        for (var _ in targets) {
          onNext();
        }
      };

      // call onInit callback
      Bindings.onRendered(() => widget.onInit?.call(controller));
    }
  }

  // show the trainer
  void showTrainer() {
    if (!isActive) {
      isActive = true;
      final style = widget.style;

      TutorialCoachMark(
          targets: targetFocus,
          hideSkip: true,
          colorShadow: style?.shadowColor ?? Colors.black.withOpacity(.8),
          opacityShadow: style?.shadowOpacity ?? .8,
          onClickTarget: (target) => widget.onClickTarget?.call(target.identify.toString()),
          onFinish: () {
            widget.onFinish?.call();
            isActive = false;
          }).show(context: widget.context ?? context);
    }
  }

  @override
  void initState() {
    super.initState();
    initialized();
  }

  @override
  void didUpdateWidget(Trainer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.targets != widget.targets) {
      initialized();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async => !isActive, child: widget.child);
  }
}
