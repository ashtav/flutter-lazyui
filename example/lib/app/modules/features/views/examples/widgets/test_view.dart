import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

extension GroupAnimate on Column {
  Column animateGroup() {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children.generate((child, i) {
        if (child is SizedBox) {
          return child;
        }

        return child.lz.animate.slideUp(delay: (i + 1) * 100);
      }).toList(),
    );
  }
}

class Notifier extends ChangeNotifier {}

class Press extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  const Press(this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: Icon(icon));
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      child: Scaffold(
        appBar: AppBar(title: const Text('Test View'), actions: []),
        body: LzListView(
          children: [
            Column(
              children: ['Name', 'Date of Birth', 'Gender'].generate((label, i) {
                final values = [Faker.name(), Faker.date(), Faker.gender()];

                return Container(padding: Ei.sym(v: 13, h: 20), child: DataTile(label: label, value: values[i]));
              }),
            ).start
          ],
        ),
      ),
    );
  }
}

enum TypographyStyle {
  primaryData,
  secondaryData,
  subtleLabel,
  emphasizedValue,
  caption,
  titleEmphasis
}

class DataTile extends StatelessWidget {
  final String? label;
  final dynamic value;
  final CrossAxisAlignment? align;
  final double gap;
  final TypographyStyle? style;

  const DataTile({super.key, this.label, this.value, this.align, this.gap = 0, this.style = TypographyStyle.subtleLabel});

  TextStyle _getLabelStyle(TypographyStyle style) {
    switch (style) {
      case TypographyStyle.secondaryData:
        return Gfont.fs12; // example smaller font for secondary data
      case TypographyStyle.subtleLabel:
        return Gfont.fs10.copyWith(color: Colors.grey); // subtle label with smaller and grey color
      case TypographyStyle.emphasizedValue:
        return Gfont.fs14.copyWith(fontWeight: FontWeight.bold); // emphasized label with bold weight
      case TypographyStyle.caption:
        return Gfont.fs10.copyWith(fontStyle: FontStyle.italic); // caption style, smaller and italic
      case TypographyStyle.titleEmphasis:
        return Gfont.fs16.copyWith(fontWeight: FontWeight.w600); // title emphasis with a slightly larger font
      case TypographyStyle.primaryData:
      default:
        return Gfont.fs14; // default primary data style
    }
  }

  TextStyle _getValueStyle(TypographyStyle style) {
    switch (style) {
      case TypographyStyle.secondaryData:
        return Gfont.fs14.copyWith(color: Colors.black45); // secondary data value, less emphasis
      case TypographyStyle.subtleLabel:
        return Gfont.fs14.copyWith(color: Colors.black45); // value should match label style
      case TypographyStyle.emphasizedValue:
        return Gfont.fs16.copyWith(fontWeight: FontWeight.bold); // emphasized value with larger font and bold
      case TypographyStyle.caption:
        return Gfont.fs12; // value for caption is slightly smaller
      case TypographyStyle.titleEmphasis:
        return Gfont.fs16.copyWith(fontWeight: FontWeight.w700); // larger value with strong emphasis
      case TypographyStyle.primaryData:
      default:
        return Gfont.fs14; // default value style
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align ?? Caa.start,
      children: [
        Text(label.toString(), style: _getLabelStyle(style ?? TypographyStyle.primaryData)),
        Text(value.toString(), style: _getValueStyle(style ?? TypographyStyle.primaryData))
      ],
    ).gap(gap);
  }
}

