// ignore_for_file: invalid_use_of_protected_member

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'controller.dart';
import 'target.dart';
import 'tutorial_coach_mark.dart';

export 'controller.dart' show TrainerController;
export 'enums.dart';
export 'target.dart' show Target;

class Trainer extends StatefulWidget {
  final Widget Function(List<GlobalKey> keys) builder;
  final List<Target> targets;
  final TrainerController? controller;
  final Duration duration;
  final bool allowSkip;
  final TrainerLabels labels;
  final Widget Function(String content, TrainerController controller)?
      contentBuilder;
  final void Function(int index)? onNext;
  final void Function()? onSkip;
  final void Function()? onFinish;

  /// Example:
  ///
  /// ```dart
  /// final trainer = TrainerController();
  ///
  /// final targets = [
  ///   Target(content: Faker.words(20)),
  /// ];
  ///
  /// return Trainer(
  ///   targets: targets,
  ///   controller: trainer,
  ///   builder: (keys) => Scaffold(
  ///     body: YourWidget(
  ///       key: keys[0],
  ///       onTap: () => trainer.show()
  ///   )
  /// )
  /// ```
  const Trainer(
      {super.key,
      required this.builder,
      this.targets = const [],
      this.controller,
      this.duration = const Duration(milliseconds: 600),
      this.allowSkip = true,
      this.labels = const TrainerLabels(),
      this.contentBuilder,
      this.onNext,
      this.onSkip,
      this.onFinish});

  @override
  State<Trainer> createState() => _TrainerState();
}

class _TrainerState extends State<Trainer> {
  List<TargetFocus> targets = [];
  List<GlobalKey> keys = [];
  final TrainerController _controller = TrainerController();

  bool isOpened = false;

  void showTrainer([int? from]) {
    final trainer = TutorialCoachMark(
        targets: targets,
        opacityShadow: .5,
        duration: widget.duration,
        initFocus: from,
        onSkip: () => isOpened = false,
        onFinish: () => isOpened = false,
        imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7));

    trainer.show(context);
    isOpened = true;
  }

  void initialized() async {
    _controller.skip();

    targets = [];
    keys = [];
    isOpened = false;

    int length = widget.targets.length;

    widget.targets.generate((target, i) {
      final key = GlobalKey();
      keys.add(key);

      targets.add(TargetFocus(keyTarget: key, shape: target.shape, contents: [
        TargetContent(
            align: target.align,
            padding: target.padding ?? Ei.all(50),
            builder: (_, controller) {
              // _controller will be initialized only when the Trainer is opened
              _controller.nextTarget = controller.next;
              _controller.skipTarget = controller.skip;

              bool isLast = i == length - 1;

              List<_Label> actions = [
                _Label(0, widget.labels.skip),
                _Label(1, isLast ? widget.labels.finish : widget.labels.next),
              ];

              if (!widget.allowSkip) {
                actions.removeAt(0);
              }

              if (widget.contentBuilder != null) {
                return widget.contentBuilder!(
                    target.content ?? '', _controller);
              }

              return _TargetContent(controller, target, i, actions, (action) {
                if (action.key == 0) {
                  controller.skip();
                  widget.onSkip?.call();
                } else {
                  controller.next();

                  if (isLast) {
                    return widget.onFinish?.call();
                  }

                  widget.onNext?.call(i);
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
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, _) {
          if (didPop || isOpened) {
            return;
          }

          context.lz.pop();
        },
        child: widget.builder(keys));
  }
}

class _TargetContent extends StatelessWidget {
  final TutorialCoachMarkController controller;
  final Target target;
  final int index;
  final List<_Label> actions;
  final Function(_Label action) onTap;

  const _TargetContent(
      this.controller, this.target, this.index, this.actions, this.onTap);

  @override
  Widget build(BuildContext context) {
    final actions = this.actions;

    if (actions.length == 2) {
      actions.insert(1, _Label(-1, ''));
    }

    return Column(
      crossAxisAlignment: Caa.start,
      spacing: 25,
      children: [
        Text(
          target.content ?? '',
          style: Gfont.white,
        ),

        // trainer controls
        Row(children: actions.generate((label, i) {
          if (label.key == -1) {
            return Container(width: .5, height: 30, color: Colors.white54);
          }

          double space = 30;

          return Touch(
              type: TouchType.fade,
              onTap: () => onTap(label),
              child: Textr(label.label,
                  style: Gfont.white.bold,
                  padding: Ei.only(v: 13, r: space, l: i == 0 ? 0 : space)));
        }))
      ],
    );
  }
}

class TrainerLabels {
  final String skip;
  final String next;
  final String finish;

  const TrainerLabels(
      {this.skip = 'Skip', this.next = 'Next', this.finish = 'Finish'});
}

class _Label {
  final int key;
  final String label;

  const _Label(this.key, this.label);
}
