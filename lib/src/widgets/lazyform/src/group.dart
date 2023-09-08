part of lazyform;

enum SublabelStyle { text, card, cardWarning }

class LzFormGroup extends StatelessWidget {
  final String? label, sublabel;
  final IconData? prefixIcon;
  final List<Widget> children;
  final double? labelSize, bottomSpace;
  final TextStyle? labelStyle;
  final SublabelStyle sublabelStyle;
  final FormType type;

  const LzFormGroup(
      {super.key,
      this.label,
      this.sublabel,
      this.prefixIcon,
      this.children = const [],
      this.labelSize,
      this.bottomSpace,
      this.labelStyle,
      this.sublabelStyle = SublabelStyle.text,
      this.type = FormType.grouped});

  @override
  Widget build(BuildContext context) {
    final formListAncestor =
        context.findAncestorWidgetOfExactType<LzFormList>();
    Color borderColor =
        (formListAncestor?.style?.inputBorderColor ?? Colors.black12);

    // allowed widget
    List allowed = [Input, Select, Radio, Checkbox, Number, Switches];

    // remove all children that not allowed
    List<Widget> children = [...this.children];
    children.removeWhere((e) => !allowed.contains(e.runtimeType));

    // put warning if there is not allowed widget
    if (this.children.any((e) => !allowed.contains(e.runtimeType))) {
      children.add(const None());
    }

    // count not allowed widget
    int count =
        this.children.where((e) => !allowed.contains(e.runtimeType)).length;

    // get text style
    TextStyle? style = Theme.of(context).textTheme.bodyMedium;

    // sublabel style
    bool isCardWarning = sublabelStyle == SublabelStyle.cardWarning;
    Color sublabelBorderColor =
        isCardWarning ? Colors.orange.withOpacity(.5) : Colors.black12;
    Color sublabelColor =
        isCardWarning ? Colors.orange.withOpacity(.09) : Colors.white;
    Color sublabelTextColor = isCardWarning ? Colors.orange : Colors.black;

    double configRadius = LazyUi.radius;

    return Column(
      crossAxisAlignment: Caa.start,
      mainAxisSize: Mas.min,
      children: [
        // Label
        if (label != null)
          Textr(
            label!,
            style: labelStyle ??
                style?.copyWith(fontWeight: Fw.bold, fontSize: labelSize),
            icon: prefixIcon,
            margin: Ei.only(b: 8),
          ),

        // Sublabel
        if (sublabel != null)
          sublabelStyle == SublabelStyle.text
              ? Textr(
                  sublabel!,
                  style: style?.copyWith(fontSize: 14),
                  margin: Ei.only(b: 15),
                )
              : Textr(
                  sublabel!,
                  style:
                      style?.copyWith(fontSize: 14, color: sublabelTextColor),
                  margin: Ei.only(b: 15),
                  border: Br.all(color: sublabelBorderColor),
                  padding: Ei.sym(v: 13, h: 15),
                  radius: Br.radius(5),
                  color: sublabelColor,
                ),

        // Fields
        Container(
          margin: Ei.only(b: bottomSpace ?? 20),
          decoration: BoxDecoration(
              border: Br.all(color: borderColor),
              color: Colors.white,
              borderRadius: Br.radius(configRadius)),
          child: ClipRRect(
            borderRadius: Br.radius(configRadius),
            child: Column(
              crossAxisAlignment: Caa.start,
              mainAxisSize: Mas.min,
              children: List.generate(children.length, (i) {
                Widget child = children[i];

                if (allowed.contains(child.runtimeType)) {
                  return child;
                }

                return Textr(
                  'Found $count not allowed widget(s)',
                  style: style?.copyWith(fontSize: 14, color: Colors.redAccent),
                  border: Br.all(color: Colors.redAccent),
                  padding: Ei.sym(v: 10, h: 15),
                  margin: Ei.sym(h: 15, v: 15),
                  radius: Br.radius(5),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
