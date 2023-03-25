import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart' hide Button, Errors;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class CoachWrapperController {
  Function([Duration? delay]) open = ([Duration? delay]) {};
}

class CoachTarget {
  final GlobalKey key;
  final IconData? icon;
  final String title;
  final String message;
  final Function(TargetFocus?)? onTapTarget;

  CoachTarget({required this.key, this.icon, required this.title, required this.message, this.onTapTarget});
}

class CoachWrapper extends StatefulWidget {
  final Function(bool mounted)? onInit;
  final Widget? child;
  final List<CoachTarget> targets;
  final CoachWrapperController? controller;

  const CoachWrapper({Key? key, this.onInit, this.child, this.targets = const [], this.controller}) : super(key: key);

  @override
  State<CoachWrapper> createState() => _CoachWrapperState();
}

class _CoachWrapperState extends State<CoachWrapper> {
  bool isCoach = false;

  @override
  void initState() {
    widget.onInit?.call(mounted);
    super.initState();
  }

  void runCoach([Duration? delay]) async {
    if (widget.targets.isEmpty) return;
    isCoach = true;

    List<CoachTarget> targets = widget.targets;

    TutorialCoachMark(
      onClickTarget: (target) async {
        List keys = widget.targets.map((e) => e.key).toList();
        int index = keys.indexOf(target.keyTarget);

        if (index > -1) {
          widget.targets[index].onTapTarget?.call(target);
        }
      },
      targets: List.generate(
          targets.length,
          (i) => TargetFocus(
                keyTarget: targets[i].key,
                radius: 250,
                contents: [
                  TargetContent(
                    builder: (context, controller) {
                      return Column(
                        crossAxisAlignment: Caa.start,
                        children: [
                          Container(
                            padding: Ei.all(20),
                            constraints: BoxConstraints(maxWidth: context.width * .6),
                            decoration: BoxDecoration(border: Br.all(color: Colors.white), borderRadius: Br.radius(5)),
                            child: Col(
                              children: [
                                Iconr(
                                  targets[i].icon ?? La.bookOpen,
                                  color: Colors.white,
                                  margin: Ei.only(b: 35),
                                  size: 30,
                                ),
                                Text(
                                  targets[i].title,
                                  style: Gfont.bold.white,
                                ),
                                Textr(
                                  targets[i].message,
                                  margin: Ei.only(t: 10),
                                  style: Gfont.white.fopacity(.8),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              )),
      opacityShadow: 0.9,
      hideSkip: true,
      onFinish: () {
        isCoach = false;
      },
    ).show(context: context, delay: delay);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller != null) {
      widget.controller?.open = runCoach;
    }

    return WillPopScope(
        child: widget.child ?? Container(),
        onWillPop: () async {
          return !isCoach;
        });
  }
}
