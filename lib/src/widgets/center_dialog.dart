part of widget;

class CenterDialog extends StatelessWidget {
  final Widget child;
  final double margin;
  final BorderRadiusGeometry borderRadius;

  const CenterDialog({
    Key? key,
    required this.child,
    this.margin = 15,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: Maa.center,
      children: [
        Container(
          padding: Ei.only(b: context.viewInsets.bottom),
          child: Material(
              color: Colors.transparent,
              child: Container(
                  margin: EdgeInsets.all(margin), child: ClipRRect(borderRadius: borderRadius, child: child))),
        )
      ],
    );
  }
}
