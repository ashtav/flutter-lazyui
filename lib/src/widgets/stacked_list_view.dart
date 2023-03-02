import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:lazyui/lazyui.dart';

class StackedListNotifier extends ChangeNotifier {}

class StackedListView extends StatelessWidget {
  final List<Widget> children;
  final Widget? stacked;
  final double padding;
  final ScrollPhysics? physics;
  const StackedListView({super.key, this.children = const [], this.stacked, this.padding = 20.0, this.physics});

  @override
  Widget build(BuildContext context) {
    final streamController = StreamController<double>();
    final opacityStreamController = StreamController<bool>();
    final childrenKey = GlobalKey(), stackedKey = GlobalKey();

    List<Widget> children = [];
    double defaultHeight = -1;
    bool isInit = false;

    initWidget() {
      children = [
        Col(key: childrenKey, children: [...this.children]),
        StreamBuilder<double>(
          stream: streamController.stream,
          builder: (BuildContext context, snap) => AnimatedContainer(duration: const Duration(milliseconds: 150), height: snap.data ?? 0),
        ),
        StreamBuilder<bool>(
          stream: opacityStreamController.stream,
          builder: (BuildContext context, snap) => AnimatedOpacity(
              duration: const Duration(milliseconds: 300), opacity: snap.hasData ? 1 : 0, child: Container(key: stackedKey, child: stacked)),
        ),
      ];
    }

    onRender(bool visible) {
      if (!visible) {
        streamController.add(defaultHeight < 0 ? 0 : defaultHeight);
        if (defaultHeight != -1) return;
      }

      Utils.timer(() {
        // get children height
        final RenderBox? box = childrenKey.currentContext?.findRenderObject() as RenderBox?;
        double contentHeight = box?.size.height ?? 0;

        // get stacked height
        final RenderBox? box2 = stackedKey.currentContext?.findRenderObject() as RenderBox?;
        double buttonHeight = box2?.size.height ?? 0;

        // 56 = appbar height
        double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
        double content = contentHeight + buttonHeight + (padding * 2) + 56 + statusBarHeight;

        double height = (context.height - content) - MediaQueryData.fromWindow(window).viewInsets.bottom;
        streamController.add(height < 0 ? padding : height);
        if (defaultHeight == -1) defaultHeight = height;

        opacityStreamController.add(isInit);
      }, 250);
    }

    initWidget();

    return KeyboardVisibilityBuilder(builder: (_, visible) {
      WidgetsBinding.instance.addPostFrameCallback((_) => onRender(visible));

      return ListView(physics: physics ?? BounceScroll(), padding: Ei.all(padding), children: children);
    });
  }
}
