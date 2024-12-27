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
      widget.children.generate((child, i) {
        if (i != 0) {
          children.add(SizedBox(height: widget.gap));
        }

        children.add(child);
      });
    } else {
      children = widget.children;
    }
  }

  @override
  void initState() {
    initChildren();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LzListView oldWidget) {
    if (widget.children != oldWidget.children) {
      initChildren();
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: widget.padding,
      cacheExtent: 1000,
      children: children,
    );
  }
}
