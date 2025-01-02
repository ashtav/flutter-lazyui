import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'tutorial_coach_mark.dart';

export 'controller.dart';
export 'enums.dart';
export 'target.dart';

class Trainer extends StatefulWidget {
  final Widget Function(List<GlobalKey> keys) builder;
  final List<Target> targets;
  final TrainerController? controller;
  final Duration duration;
  const Trainer(
      {super.key,
      required this.builder,
      this.targets = const [],
      this.controller,
      this.duration = const Duration(milliseconds: 600)});

  @override
  State<Trainer> createState() => _TrainerState();
}

class _TrainerState extends State<Trainer> {
  List<TargetFocus> targets = [];
  List<GlobalKey> keys = [];
  TutorialCoachMarkController? _controller;

  void showTrainer([int? index]) {
    final trainer = TutorialCoachMark(
        targets: targets,
        opacityShadow: .5,
        duration: widget.duration,
        imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7));

    if (index != null) {
      trainer.goTo(index);
      return;
    }

    trainer.show(context);
  }

  void initialized() {
    _controller?.skip();

    targets = [];
    keys = [];

    int length = widget.targets.length;

    widget.targets.generate((target, i) {
      final key = GlobalKey();
      keys.add(key);

      targets.add(TargetFocus(keyTarget: key, shape: target.shape, contents: [
        TargetContent(
            align: target.align,
            padding: target.padding ?? Ei.all(50),
            builder: (_, controller) {
              _controller = controller;

              return _TargetContent(controller, target, i, ['Skip', i == length - 1 ? 'Finish' : 'Next'], (action) {
                if (action == 0) {
                  controller.skip();
                } else {
                  controller.next();
                }
              });
            })
      ]));
    });

    // fill the controller
    if (widget.controller != null) {
      widget.controller!.showTrainer = showTrainer;
    } else {
      // toggle the trainer
      Bindings.onRendered(() {
        showTrainer();
      });
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
    return widget.builder(keys);
  }
}

class _TargetContent extends StatelessWidget {
  final TutorialCoachMarkController controller;
  final Target target;
  final int index;
  final List<String> actions;
  final Function(int action) onTap;

  const _TargetContent(this.controller, this.target, this.index, this.actions, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: Caa.start,
      spacing: 25,
      children: [
        Text(
          target.description ?? '',
          style: Gfont.white,
        ),

        // trainer controls
        Row(
            spacing: 35,
            children: actions.generate((label, i) {
              return Touch(
                  type: TouchType.fade,
                  onTap: () => onTap(i),
                  child: Textr(label, style: Gfont.white, padding: Ei.sym(v: 13)));
            }))
      ],
    );
  }
}
