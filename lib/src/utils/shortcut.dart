import 'package:flutter/material.dart';

double _borderWidth = .7;
Color _borderColor = Colors.black12;

class Br {
  static BoxBorder all(
      {Color? color,
      double? width,
      BorderStyle style = BorderStyle.solid,
      double strokeAlign = BorderSide.strokeAlignInside}) {
    return Border.all(
        color: color ?? _borderColor,
        width: width ?? _borderWidth,
        style: style,
        strokeAlign: strokeAlign);
  }

  static BoxBorder only(List<String> only,
      {Color? color,
      double? width,
      bool except = false,
      BorderStyle style = BorderStyle.solid}) {
    Color bcolor = color ?? _borderColor;
    double bwidth = width ?? _borderWidth;

    return Border(
        top: !only.contains('t') || except
            ? BorderSide.none
            : Br.side(bcolor, width: bwidth, style: style),
        bottom: !only.contains('b') || except
            ? BorderSide.none
            : Br.side(bcolor, width: bwidth, style: style),
        left: !only.contains('l') || except
            ? BorderSide.none
            : Br.side(bcolor, width: bwidth, style: style),
        right: !only.contains('r') || except
            ? BorderSide.none
            : Br.side(bcolor, width: bwidth, style: style));
  }

  static BoxBorder except(List<String> except,
      {Color? color, double? width, BorderStyle style = BorderStyle.solid}) {
    Color bcolor = color ?? _borderColor;
    double bwidth = width ?? _borderWidth;

    return Border(
        top: except.contains('t')
            ? BorderSide.none
            : Br.side(bcolor, width: bwidth, style: style),
        bottom: except.contains('b')
            ? BorderSide.none
            : Br.side(bcolor, width: bwidth, style: style),
        left: except.contains('l')
            ? BorderSide.none
            : Br.side(bcolor, width: bwidth, style: style),
        right: except.contains('r')
            ? BorderSide.none
            : Br.side(bcolor, width: bwidth, style: style));
  }

  static BorderSide side(Color color,
          {double? width, BorderStyle style = BorderStyle.solid}) =>
      BorderSide(color: color, width: width ?? _borderWidth, style: style);

  static BorderRadius radius(double value, {List<String>? except}) => except ==
          null
      ? BorderRadius.circular(value)
      : BorderRadius.only(
          topLeft: except.contains('tl') ? Radius.zero : Radius.circular(value),
          topRight:
              except.contains('tr') ? Radius.zero : Radius.circular(value),
          bottomLeft:
              except.contains('bl') ? Radius.zero : Radius.circular(value),
          bottomRight:
              except.contains('br') ? Radius.zero : Radius.circular(value));

  static BorderRadius radiusOnly(
          {double? tl,
          double? tr,
          double? bl,
          double? br,
          double? tlr,
          double? blr,
          double? ltb,
          double? rtb}) =>
      BorderRadius.only(
          topLeft: Radius.circular(tl ?? tlr ?? ltb ?? 0),
          topRight: Radius.circular(tr ?? tlr ?? rtb ?? 0),
          bottomLeft: Radius.circular(bl ?? blr ?? ltb ?? 0),
          bottomRight: Radius.circular(br ?? blr ?? rtb ?? 0));

  static BorderRadius circle = BorderRadius.circular(99999);
  static const BorderRadius zero = BorderRadius.zero;
  static const BoxBorder none = Border.fromBorderSide(BorderSide.none);
}

class Ei {
  static const EdgeInsets zero = EdgeInsets.zero;

  static EdgeInsets only(
          {double? b,
          double? t,
          double? l,
          double? r,
          double? v,
          double? h,
          double others = 0}) =>
      EdgeInsets.only(
          bottom: v ?? b ?? others,
          top: v ?? t ?? others,
          left: h ?? l ?? others,
          right: h ?? r ?? others);

  static EdgeInsets all(double value, {List<String>? except}) => except == null
      ? EdgeInsets.all(value)
      : EdgeInsets.only(
          bottom: except.contains('b') ? 0 : value,
          top: except.contains('t') ? 0 : value,
          left: except.contains('l') ? 0 : value,
          right: except.contains('r') ? 0 : value);

  static EdgeInsets sym({double v = 0, double h = 0}) =>
      EdgeInsets.symmetric(vertical: v, horizontal: h);

  static EdgeInsets syms(double v, double h) =>
      EdgeInsets.symmetric(vertical: v, horizontal: h);

  static EdgeInsets except(List<String> except, [double padding = 15]) =>
      EdgeInsets.only(
          bottom: !except.contains('b') ? padding : 0,
          top: !except.contains('t') ? padding : 0,
          left: !except.contains('l') ? padding : 0,
          right: !except.contains('r') ? padding : 0);
}

class Mas {
  static const MainAxisSize max = MainAxisSize.max;
  static const MainAxisSize min = MainAxisSize.min;
}

class Maa {
  static const MainAxisAlignment start = MainAxisAlignment.start;
  static const MainAxisAlignment center = MainAxisAlignment.center;
  static const MainAxisAlignment end = MainAxisAlignment.end;
  static const MainAxisAlignment spaceAround = MainAxisAlignment.spaceAround;
  static const MainAxisAlignment spaceBetween = MainAxisAlignment.spaceBetween;
  static const MainAxisAlignment spaceEvenly = MainAxisAlignment.spaceEvenly;
}

class Caa {
  static const CrossAxisAlignment start = CrossAxisAlignment.start;
  static const CrossAxisAlignment center = CrossAxisAlignment.center;
  static const CrossAxisAlignment end = CrossAxisAlignment.end;
  static const CrossAxisAlignment baseline = CrossAxisAlignment.baseline;
  static const CrossAxisAlignment stretch = CrossAxisAlignment.stretch;
}

class Wca {
  static const WrapCrossAlignment start = WrapCrossAlignment.start;
  static const WrapCrossAlignment center = WrapCrossAlignment.center;
  static const WrapCrossAlignment end = WrapCrossAlignment.end;
}

class Wa {
  static const WrapAlignment start = WrapAlignment.start;
  static const WrapAlignment center = WrapAlignment.center;
  static const WrapAlignment end = WrapAlignment.end;
  static const WrapAlignment spaceAround = WrapAlignment.spaceAround;
  static const WrapAlignment spaceBetween = WrapAlignment.spaceBetween;
  static const WrapAlignment spaceEvenly = WrapAlignment.spaceEvenly;
}

class Ta {
  static const TextAlign start = TextAlign.start;
  static const TextAlign left = TextAlign.left;
  static const TextAlign right = TextAlign.right;
  static const TextAlign end = TextAlign.end;
  static const TextAlign justify = TextAlign.justify;
  static const TextAlign center = TextAlign.center;
}

class Tof {
  static const TextOverflow clip = TextOverflow.clip;
  static const TextOverflow ellipsis = TextOverflow.ellipsis;
  static const TextOverflow fade = TextOverflow.fade;
  static const TextOverflow visible = TextOverflow.visible;
}

class Fw {
  static const FontWeight normal = FontWeight.normal;
  static const FontWeight bold = FontWeight.bold;
  static const FontWeight w100 = FontWeight.w100;
  static const FontWeight w200 = FontWeight.w200;
  static const FontWeight w300 = FontWeight.w300;
  static const FontWeight w400 = FontWeight.w400;
  static const FontWeight w500 = FontWeight.w500;
  static const FontWeight w600 = FontWeight.w600;
  static const FontWeight w700 = FontWeight.w700;
  static const FontWeight w800 = FontWeight.w800;
  static const FontWeight w900 = FontWeight.w900;
}

class Tit {
  static const TextInputType datetime = TextInputType.datetime;
  static const TextInputType emailAddress = TextInputType.emailAddress;
  static const TextInputType multiline = TextInputType.multiline;
  static const TextInputType name = TextInputType.name;
  static const TextInputType number = TextInputType.number;
  static const TextInputType phone = TextInputType.phone;
  static const TextInputType streetAddress = TextInputType.streetAddress;
  static const TextInputType text = TextInputType.text;
  static const TextInputType url = TextInputType.url;
  static const TextInputType visiblePassword = TextInputType.visiblePassword;
}

class Ad {
  static const AlignmentDirectional bottomCenter =
      AlignmentDirectional.bottomCenter;
  static const AlignmentDirectional bottomEnd = AlignmentDirectional.bottomEnd;
  static const AlignmentDirectional bottomStart =
      AlignmentDirectional.bottomStart;
  static const AlignmentDirectional center = AlignmentDirectional.center;
  static const AlignmentDirectional centerEnd = AlignmentDirectional.centerEnd;
  static const AlignmentDirectional centerStart =
      AlignmentDirectional.centerStart;
  static const AlignmentDirectional topCenter = AlignmentDirectional.topCenter;
  static const AlignmentDirectional topEnd = AlignmentDirectional.topEnd;
  static const AlignmentDirectional topStart = AlignmentDirectional.topStart;
}

class Bx {
  static BoxShadow shadow(Color color,
      {double? blur, double? spread, double? x, double? y}) {
    return BoxShadow(
        color: color,
        blurRadius: blur ?? 5,
        spreadRadius: spread ?? 0,
        offset: Offset(x ?? 0, y ?? 0));
  }
}
