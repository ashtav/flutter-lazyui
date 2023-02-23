import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class StackedListView extends StatelessWidget {
  final List<Widget> children;
  final Widget? stacked;
  final double padding;
  final ScrollPhysics? physics;
  const StackedListView({super.key, this.children = const [], this.stacked, this.padding = 20.0, this.physics});

  @override
  Widget build(BuildContext context) {
    final streamController = StreamController<double>();
    final childrenKey = GlobalKey(), stackedKey = GlobalKey();

    List<Widget> children = [];

    initWidget() {
      children = [
        Col(key: childrenKey, children: [...this.children]),
        StreamBuilder<double>(
          stream: streamController.stream,
          builder: (BuildContext context, snap) => SizedBox(height: snap.data ?? 0),
        ),
        Container(key: stackedKey, child: stacked),
      ];
    }

    onRender() {
      // get children height
      final RenderBox? box = childrenKey.currentContext?.findRenderObject() as RenderBox?;
      double contentHeight = box?.size.height ?? 0;

      // get stacked height
      final RenderBox? box2 = stackedKey.currentContext?.findRenderObject() as RenderBox?;
      double buttonHeight = box2?.size.height ?? 0;

      // 56 = appbar height
      double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;
      double content = contentHeight + buttonHeight + (padding * 2) + 56 + statusBarHeight;

      double height = context.height - content;
      streamController.add(height < 0 ? padding : height);
    }

    initWidget();

    WidgetsBinding.instance.addPostFrameCallback((_) => onRender());
    return ListView(physics: physics ?? BounceScroll(), padding: Ei.all(padding), children: children);
  }
}
