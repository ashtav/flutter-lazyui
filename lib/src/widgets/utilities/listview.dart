part of '../widget.dart';

class LzListView extends StatefulWidget {
  final List<Widget> children;
  final EdgeInsetsGeometry? padding;
  final double? gap;

  const LzListView({super.key, this.children = const [], this.padding, this.gap});

  @override
  State<LzListView> createState() => _LzListViewState();
}

class _LzListViewState extends State<LzListView> {
  List<Widget> children = [];

  void initChildren() {
    children = [];

    if (widget.gap != null && widget.children.length > 1) {
      for (int i = 0; i < widget.children.length; i++) {
        if (i != 0) {
          children.add(SizedBox(key: ValueKey('gap_$i'), height: widget.gap));
        }
        children.add(KeyedSubtree(key: ValueKey('child_$i'), child: widget.children[i]));
      }
    } else {
      children = widget.children
          .asMap()
          .entries
          .map((entry) => KeyedSubtree(key: ValueKey('child_${entry.key}'), child: entry.value))
          .toList();
    }
  }

  @override
  void initState() {
    initChildren();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LzListView oldWidget) {
    if (widget.children != oldWidget.children || widget.gap != oldWidget.gap) {
      initChildren();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: widget.padding,
      cacheExtent: 2500,
      children: children,
    );
  }
}
