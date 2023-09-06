part of widget;

class LzTextDivider extends StatelessWidget {
  final Text text;
  final double spacing, height, lineHeight;
  final Color? backgroundColor, lineColor;
  const LzTextDivider(this.text,
      {super.key,
      this.spacing = 15,
      this.height = 30,
      this.lineHeight = 1,
      this.backgroundColor,
      this.lineColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: height,
          width: context.width,
        ),
        Poslign(
          alignment: Alignment.center,
          child: Container(
            height: lineHeight >= 15 ? 15 : lineHeight,
            color: lineColor ?? Colors.black26,
            width: context.width,
          ),
        ),
        Poslign(
            alignment: Alignment.center,
            child: Container(
                padding: Ei.sym(h: spacing),
                color: backgroundColor ?? Utils.hex('fafafa'),
                child: text))
      ],
    );
  }
}