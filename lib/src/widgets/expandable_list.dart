import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class ExpandableContent {
  final String title;
  final Widget child;

  const ExpandableContent({required this.title, required this.child});
}

class ExpandableList extends StatefulWidget {
  final List<ExpandableContent> children;
  final bool multiple, border, titleEllipsis;
  final int? initValue;
  final double? radius;
  const ExpandableList(
      {Key? key, this.children = const [], this.multiple = false, this.initValue, this.radius, this.border = true, this.titleEllipsis = false})
      : super(key: key);

  @override
  State<ExpandableList> createState() => _ExpandableListState();
}

class _ExpandableListState extends State<ExpandableList> with TickerProviderStateMixin {
  List<AnimationController> controllers = [];
  List<Animation<double>> animations = [];
  List<int> actives = [];

  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 0.25,
  );

  int length = 0;

  void init() {
    length = widget.children.length;

    controllers = List.generate(length, (i) => AnimationController(vsync: this, duration: const Duration(milliseconds: 300)));
    animations = List.generate(
        length,
        (i) => CurvedAnimation(
              parent: controllers[i],
              curve: Curves.fastOutSlowIn,
            ));

    int? index = widget.initValue;

    if (index != null && index > -1 && index < length) {
      actives.add(index);
      controllers[index].forward();
    }
  }

  void disposeControllers() {
    for (AnimationController e in controllers) {
      e.dispose();
    }
  }

  void onTap(int i) {
    AnimationController controller = controllers[i];

    void setForward() {
      if (!widget.multiple) {
        actives = [];
      }

      actives.add(i);
      controller.forward();
    }

    if (!widget.multiple) {
      // collapse all
      for (AnimationController e in controllers) {
        e.reverse();
      }

      // expand only one child
      if (!actives.contains(i)) {
        return setForward();
      }

      actives.remove(i);
    } else {
      if (!actives.contains(i)) {
        return setForward();
      }

      actives.remove(i);
      controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void didUpdateWidget(ExpandableList oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double radius = LazyUi.getConfig.radius;

    return Container(
      decoration: BoxDecoration(border: widget.border ? Br.all() : null, borderRadius: Br.radius(widget.radius ?? radius)),
      child: ClipRRect(
        borderRadius: Br.radius(widget.radius ?? radius),
        child: Col(
          children: List.generate(length, (i) {
            String title = widget.children[i].title;

            return Container(
              decoration: BoxDecoration(border: Br.only(['t'], except: i == 0)),
              child: Col(
                children: [
                  InkW(
                      onTap: () {
                        onTap(i);
                      },
                      padding: Ei.all(20),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: Maa.spaceBetween,
                        children: [
                          Flexible(
                              child: Textr(
                            title,
                            margin: Ei.only(r: 15),
                            overflow: widget.titleEllipsis ? Tof.ellipsis : Tof.visible,
                          )),
                          RotationTransition(turns: turnsTween.animate(controllers[i]), child: const Icon(La.angleRight, color: Colors.black38))
                        ],
                      )),
                  SizeTransition(
                      axisAlignment: 1.0,
                      sizeFactor: animations[i],
                      child: Container(
                        padding: Ei.all(20),
                        decoration: BoxDecoration(border: Br.only(['t'])),
                        child: widget.children[i].child,
                      )),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
