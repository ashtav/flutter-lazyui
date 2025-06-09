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

/// The default instance of [TrainerLabels] used by the Trainer widget.
///
/// This provides a set of default labels that can be customized or overridden
/// as needed throughout the application.
TrainerLabels _defaultLabels = TrainerLabels();

/// A widget that provides an interactive tutorial overlay for guiding users through UI elements.
///
/// The [Trainer] widget highlights specified targets and displays instructional content, allowing
/// users to navigate through steps, skip, or finish the tutorial. It can be customized with labels,
/// content builders, and callbacks for various actions.
class Trainer extends StatefulWidget {
  /// Sets the default labels for all Trainer instances.
  static void setLabels(TrainerLabels labels) => _defaultLabels = labels;

  /// A builder function that receives a list of [GlobalKey]s for each target and returns the widget tree.
  final Widget Function(List<GlobalKey> keys) builder;

  /// The list of [Target]s to highlight and provide instructions for.
  final List<Target> targets;

  /// An optional [TrainerController] to control the tutorial programmatically.
  final TrainerController? controller;

  /// The duration of the transition animation between targets.
  final Duration duration;

  /// Whether the user is allowed to skip the tutorial.
  final bool allowSkip;

  /// Custom labels for the tutorial actions (skip, next, finish).
  final TrainerLabels? labels;

  /// An optional builder for custom content, receiving the content string and controller.
  final Widget Function(String content, TrainerController controller)?
      contentBuilder;

  /// Callback invoked when the user proceeds to the next target.
  final void Function(int index)? onNext;

  /// Callback invoked when the user skips the tutorial.
  final void Function()? onSkip;

  /// Callback invoked when the user finishes the tutorial.
  final void Function()? onFinish;

  /// Callback invoked when the user skips or finishes the tutorial.
  final void Function()? onSkipOrFinish;

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
      this.labels,
      this.contentBuilder,
      this.onNext,
      this.onSkip,
      this.onFinish,
      this.onSkipOrFinish});

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
                _Label(0, widget.labels?.skip ?? _defaultLabels.skip),
                _Label(
                    1,
                    isLast
                        ? widget.labels?.finish ?? _defaultLabels.finish
                        : widget.labels?.next ?? _defaultLabels.next),
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
                  widget.onSkipOrFinish?.call();
                } else {
                  controller.next();

                  if (isLast) {
                    widget.onSkipOrFinish?.call();
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

/// A widget that displays the content and action controls for each tutorial target.
///
/// This widget is used internally by the Trainer to render the instructional text,
/// optional icon, and navigation controls (skip, next, finish) for each step in the tutorial.
class _TargetContent extends StatelessWidget {
  /// The controller for managing tutorial navigation actions.
  final TutorialCoachMarkController controller;

  /// The target data containing content, icon, and configuration.
  final Target target;

  /// The index of the current target in the tutorial sequence.
  final int index;

  /// The list of action labels (e.g., skip, next, finish) to display.
  final List<_Label> actions;

  /// Callback invoked when an action button is tapped.
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
        Textr(
          target.content ?? '',
          style: Gfont.white,
          icon: target.icon,
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

/// Holds the customizable labels for the Trainer widget's action buttons.
class TrainerLabels {
  /// The label for the skip action button.
  final String skip;

  /// The label for the next action button.
  final String next;

  /// The label for the finish action button.
  final String finish;

  const TrainerLabels(
      {this.skip = 'Skip', this.next = 'Next', this.finish = 'Finish'});
}

/// Internal class representing an action label for the Trainer controls.
///
/// Used to distinguish between different actions (e.g., skip, next, finish)
/// and their associated display text.
class _Label {
  /// The unique key identifying the action (e.g., 0 for skip, 1 for next/finish, -1 for divider).
  final int key;

  /// The display label for the action button.
  final String label;

  const _Label(this.key, this.label);
}
