part of utils;

class Br {
  /// ``` dart
  /// border: Br.all(color: Colors.black12)
  /// ```
  static BoxBorder all(
          {Color? color,
          double width = .7,
          BorderStyle style = BorderStyle.solid,
          double strokeAlign = BorderSide.strokeAlignInside}) =>
      Border.all(
          color: color ?? Colors.black12,
          width: width,
          style: style,
          strokeAlign: strokeAlign);

  /// ``` dart
  /// border: Br.only(['t'])
  /// ```
  static BoxBorder only(List<String> only,
          {Color color = Colors.black12,
          double width = .7,
          bool except = false,
          BorderStyle style = BorderStyle.solid}) =>
      Border(
          top: !only.contains('t') || except
              ? BorderSide.none
              : Br.side(color, width: width, style: style),
          bottom: !only.contains('b') || except
              ? BorderSide.none
              : Br.side(color, width: width, style: style),
          left: !only.contains('l') || except
              ? BorderSide.none
              : Br.side(color, width: width, style: style),
          right: !only.contains('r') || except
              ? BorderSide.none
              : Br.side(color, width: width, style: style));

  /// ``` dart
  /// border: Br.except(['t'])
  /// ```
  static BoxBorder except(List<String> except,
          {Color color = Colors.black12,
          double width = .7,
          BorderStyle style = BorderStyle.solid}) =>
      Border(
          top: except.contains('t')
              ? BorderSide.none
              : Br.side(color, width: width, style: style),
          bottom: except.contains('b')
              ? BorderSide.none
              : Br.side(color, width: width, style: style),
          left: except.contains('l')
              ? BorderSide.none
              : Br.side(color, width: width, style: style),
          right: except.contains('r')
              ? BorderSide.none
              : Br.side(color, width: width, style: style));

  /// ``` dart
  /// Border(left: Br.side(C.black1))
  /// ```
  static BorderSide side(Color color,
          {double width = .7, BorderStyle style = BorderStyle.solid}) =>
      BorderSide(color: color, width: width, style: style);

  /// ``` dart
  /// borderRadius: Br.radius(15)
  /// borderRadius: Br.radius(15, except: ['bl', 'br'])
  /// ```
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

  /// ``` dart
  /// borderRadius: Br.radiusOnly()
  /// ```
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

  /// ``` dart
  /// borderRadius: Br.circle
  /// ```
  static BorderRadius circle = BorderRadius.circular(99999);

  /// ``` dart
  /// borderRadius: Br.zero
  /// ```
  static const BorderRadius zero = BorderRadius.zero;

  /// ``` dart
  /// border: Br.none
  /// ```
  static const BoxBorder none = Border.fromBorderSide(BorderSide.none);
}

/* --------------------------------------------------------------------------------
| EDGE INSETS
| */

class Ei {
  /// ``` dart
  /// padding: Ei.zero
  /// ```
  static const EdgeInsets zero = EdgeInsets.zero;

  /// ``` dart
  /// padding: Ei.only(b: 15)
  /// ```
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

  /// ``` dart
  /// padding: Ei.all(15)
  /// ```
  static EdgeInsets all(double value, {List<String>? except}) => except == null
      ? EdgeInsets.all(value)
      : EdgeInsets.only(
          bottom: except.contains('b') ? 0 : value,
          top: except.contains('t') ? 0 : value,
          left: except.contains('l') ? 0 : value,
          right: except.contains('r') ? 0 : value);

  /// ``` dart
  /// padding: Ei.sym(v: 15)
  /// ```
  static EdgeInsets sym({double v = 0, double h = 0}) =>
      EdgeInsets.symmetric(vertical: v, horizontal: h);

  /// ``` dart
  /// // set all values is 15 except top
  /// Ei.except(['t'], 15);
  /// ```
  static EdgeInsets except(List<String> except, [double padding = 15]) =>
      EdgeInsets.only(
          bottom: !except.contains('b') ? padding : 0,
          top: !except.contains('t') ? padding : 0,
          left: !except.contains('l') ? padding : 0,
          right: !except.contains('r') ? padding : 0);
}

/* --------------------------------------------------------------------------------
| MAIN AXIS SIZE
| */

class Mas {
  static const MainAxisSize max = MainAxisSize.max;
  static const MainAxisSize min = MainAxisSize.min;
}

/* --------------------------------------------------------------------------------
| MAIN AXIS ALIGNMENT
| */

class Maa {
  static const MainAxisAlignment start = MainAxisAlignment.start;
  static const MainAxisAlignment center = MainAxisAlignment.center;
  static const MainAxisAlignment end = MainAxisAlignment.end;
  static const MainAxisAlignment spaceAround = MainAxisAlignment.spaceAround;
  static const MainAxisAlignment spaceBetween = MainAxisAlignment.spaceBetween;
  static const MainAxisAlignment spaceEvenly = MainAxisAlignment.spaceEvenly;
}

/* --------------------------------------------------------------------------------
| CROSS AXIS ALIGNMENT
| */

class Caa {
  static const CrossAxisAlignment start = CrossAxisAlignment.start;
  static const CrossAxisAlignment center = CrossAxisAlignment.center;
  static const CrossAxisAlignment end = CrossAxisAlignment.end;
  static const CrossAxisAlignment baseline = CrossAxisAlignment.baseline;
  static const CrossAxisAlignment stretch = CrossAxisAlignment.stretch;
}

/* --------------------------------------------------------------------------------
| WRAP AXIS ALIGNMENT
| */

class Wca {
  static const WrapCrossAlignment start = WrapCrossAlignment.start;
  static const WrapCrossAlignment center = WrapCrossAlignment.center;
  static const WrapCrossAlignment end = WrapCrossAlignment.end;
}

/* --------------------------------------------------------------------------------
| WRAP ALIGNMENT
| */

class Wa {
  static const WrapAlignment start = WrapAlignment.start;
  static const WrapAlignment center = WrapAlignment.center;
  static const WrapAlignment end = WrapAlignment.end;
  static const WrapAlignment spaceAround = WrapAlignment.spaceAround;
  static const WrapAlignment spaceBetween = WrapAlignment.spaceBetween;
  static const WrapAlignment spaceEvenly = WrapAlignment.spaceEvenly;
}

/* --------------------------------------------------------------------------------
| TEXT ALIGN
| */

class Ta {
  static const TextAlign start = TextAlign.start;
  static const TextAlign left = TextAlign.left;
  static const TextAlign right = TextAlign.right;
  static const TextAlign end = TextAlign.end;
  static const TextAlign justify = TextAlign.justify;
  static const TextAlign center = TextAlign.center;
}

/* --------------------------------------------------------------------------------
| TEXT OVERFLOW
| */

class Tof {
  static const TextOverflow clip = TextOverflow.clip;
  static const TextOverflow ellipsis = TextOverflow.ellipsis;
  static const TextOverflow fade = TextOverflow.fade;
  static const TextOverflow visible = TextOverflow.visible;
}

/* --------------------------------------------------------------------------------
| FONT WEIGHT
| */

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

/* --------------------------------------------------------------------------------
| TEXT INPUT TYPE
| */

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
