part of 'util.dart';

// Br Configuration

double _borderWidth = .7;

/// A utility class for defining border styles and configurations.
class Br {
  /// This method is used to set the default border color and width for the entire application.
  ///
  /// ``` dart
  /// Br.config(color: Colors.black12)
  /// ```
  // static void config({Color? color, double? width}) {
  //   lzBorderColor = color ?? lzBorderColor;
  //   _borderWidth = width ?? _borderWidth;
  // }

  /// ``` dart
  /// border: Br.all(color: Colors.black12)
  /// ```
  static BoxBorder all(
      {Color? color,
      double? width,
      BorderStyle style = BorderStyle.solid,
      double strokeAlign = BorderSide.strokeAlignInside}) {
    return Border.all(
        color: color ?? lzBorderColor,
        width: width ?? _borderWidth,
        style: style,
        strokeAlign: strokeAlign);
  }

  /// ``` dart
  /// border: Br.only(['t'])
  /// ```
  static BoxBorder only(List<String> only,
      {Color? color,
      double? width,
      bool except = false,
      BorderStyle style = BorderStyle.solid}) {
    Color bcolor = color ?? lzBorderColor;
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

  /// ``` dart
  /// border: Br.except(['t'])
  /// ```
  static BoxBorder except(List<String> except,
      {Color? color, double? width, BorderStyle style = BorderStyle.solid}) {
    Color bcolor = color ?? lzBorderColor;
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

  /// ``` dart
  /// Border(left: Br.side(C.black1))
  /// ```
  static BorderSide side(Color color,
          {double? width, BorderStyle style = BorderStyle.solid}) =>
      BorderSide(color: color, width: width ?? _borderWidth, style: style);

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

/// A class containing commonly used EdgeInsets constants.
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
  /// padding: Ei.syms(15, 20) // vertical, horizontal
  /// ```
  static EdgeInsets syms(double v, double h) =>
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

/// A class providing constants for main axis sizes.
class Mas {
  /// A constant representing `MainAxisSize.max`.
  static const MainAxisSize max = MainAxisSize.max;

  /// A constant representing `MainAxisSize.min`.
  static const MainAxisSize min = MainAxisSize.min;
}

/// A class providing constants for main axis alignments.
class Maa {
  /// A constant representing `MainAxisAlignment.start`.
  static const MainAxisAlignment start = MainAxisAlignment.start;

  /// A constant representing `MainAxisAlignment.center`.
  static const MainAxisAlignment center = MainAxisAlignment.center;

  /// A constant representing `MainAxisAlignment.end`.
  static const MainAxisAlignment end = MainAxisAlignment.end;

  /// A constant representing `MainAxisAlignment.spaceAround`.
  static const MainAxisAlignment spaceAround = MainAxisAlignment.spaceAround;

  /// A constant representing `MainAxisAlignment.spaceBetween`.
  static const MainAxisAlignment spaceBetween = MainAxisAlignment.spaceBetween;

  /// A constant representing `MainAxisAlignment.spaceEvenly`.
  static const MainAxisAlignment spaceEvenly = MainAxisAlignment.spaceEvenly;
}

/// A class providing constants for cross axis alignments.
class Caa {
  /// A constant representing `CrossAxisAlignment.start`.
  static const CrossAxisAlignment start = CrossAxisAlignment.start;

  /// A constant representing `CrossAxisAlignment.center`.
  static const CrossAxisAlignment center = CrossAxisAlignment.center;

  /// A constant representing `CrossAxisAlignment.end`.
  static const CrossAxisAlignment end = CrossAxisAlignment.end;

  /// A constant representing `CrossAxisAlignment.baseline`.
  static const CrossAxisAlignment baseline = CrossAxisAlignment.baseline;

  /// A constant representing `CrossAxisAlignment.stretch`.
  static const CrossAxisAlignment stretch = CrossAxisAlignment.stretch;
}

/// A class providing constants for wrap cross axis alignments.
class Wca {
  /// A constant representing `WrapCrossAlignment.start`.
  static const WrapCrossAlignment start = WrapCrossAlignment.start;

  /// A constant representing `WrapCrossAlignment.center`.
  static const WrapCrossAlignment center = WrapCrossAlignment.center;

  /// A constant representing `WrapCrossAlignment.end`.
  static const WrapCrossAlignment end = WrapCrossAlignment.end;
}

/// A class providing constants for wrap alignments.
class Wa {
  /// A constant representing `WrapAlignment.start`.
  static const WrapAlignment start = WrapAlignment.start;

  /// A constant representing `WrapAlignment.center`.
  static const WrapAlignment center = WrapAlignment.center;

  /// A constant representing `WrapAlignment.end`.
  static const WrapAlignment end = WrapAlignment.end;

  /// A constant representing `WrapAlignment.spaceAround`.
  static const WrapAlignment spaceAround = WrapAlignment.spaceAround;

  /// A constant representing `WrapAlignment.spaceBetween`.
  static const WrapAlignment spaceBetween = WrapAlignment.spaceBetween;

  /// A constant representing `WrapAlignment.spaceEvenly`.
  static const WrapAlignment spaceEvenly = WrapAlignment.spaceEvenly;
}

/// A class providing constants for text alignments.
class Ta {
  /// A constant representing `TextAlign.start`.
  static const TextAlign start = TextAlign.start;

  /// A constant representing `TextAlign.left`.
  static const TextAlign left = TextAlign.left;

  /// A constant representing `TextAlign.right`.
  static const TextAlign right = TextAlign.right;

  /// A constant representing `TextAlign.end`.
  static const TextAlign end = TextAlign.end;

  /// A constant representing `TextAlign.justify`.
  static const TextAlign justify = TextAlign.justify;

  /// A constant representing `TextAlign.center`.
  static const TextAlign center = TextAlign.center;
}

/// A class providing constants for text overflow behaviors.
class Tof {
  /// A constant representing `TextOverflow.clip`.
  static const TextOverflow clip = TextOverflow.clip;

  /// A constant representing `TextOverflow.ellipsis`.
  static const TextOverflow ellipsis = TextOverflow.ellipsis;

  /// A constant representing `TextOverflow.fade`.
  static const TextOverflow fade = TextOverflow.fade;

  /// A constant representing `TextOverflow.visible`.
  static const TextOverflow visible = TextOverflow.visible;
}

/// A class providing constants for font weights.
class Fw {
  /// A constant representing normal font weight.
  static const FontWeight normal = FontWeight.normal;

  /// A constant representing bold font weight.
  static const FontWeight bold = FontWeight.bold;

  /// A constant representing font weight 100.
  static const FontWeight w100 = FontWeight.w100;

  /// A constant representing font weight 200.
  static const FontWeight w200 = FontWeight.w200;

  /// A constant representing font weight 300.
  static const FontWeight w300 = FontWeight.w300;

  /// A constant representing font weight 400.
  static const FontWeight w400 = FontWeight.w400;

  /// A constant representing font weight 500.
  static const FontWeight w500 = FontWeight.w500;

  /// A constant representing font weight 600.
  static const FontWeight w600 = FontWeight.w600;

  /// A constant representing font weight 700.
  static const FontWeight w700 = FontWeight.w700;

  /// A constant representing font weight 800.
  static const FontWeight w800 = FontWeight.w800;

  /// A constant representing font weight 900.
  static const FontWeight w900 = FontWeight.w900;
}

/// A class providing constants for text input types.
class Tit {
  /// A constant representing a datetime text input type.
  static const TextInputType datetime = TextInputType.datetime;

  /// A constant representing an email address text input type.
  static const TextInputType emailAddress = TextInputType.emailAddress;

  /// A constant representing a multiline text input type.
  static const TextInputType multiline = TextInputType.multiline;

  /// A constant representing a name text input type.
  static const TextInputType name = TextInputType.name;

  /// A constant representing a number text input type.
  static const TextInputType number = TextInputType.number;

  /// A constant representing a phone text input type.
  static const TextInputType phone = TextInputType.phone;

  /// A constant representing a street address text input type.
  static const TextInputType streetAddress = TextInputType.streetAddress;

  /// A constant representing a generic text input type.
  static const TextInputType text = TextInputType.text;

  /// A constant representing a URL text input type.
  static const TextInputType url = TextInputType.url;

  /// A constant representing a visible password text input type.
  static const TextInputType visiblePassword = TextInputType.visiblePassword;
}

/// This class provides constants representing the different options
/// for the `AlignmentDirectional` enum used in Flutter for aligning
/// widgets within a directional context (typically used with widgets
/// that have a defined reading direction, like `Text`).
class Ad {
  /// The `bottomCenter` constant aligns the bottom edge of the widget
  /// with the bottom edge of the available space, and the center of the
  /// widget with the center of the available space along the main axis
  /// (which depends on the reading direction).
  static const AlignmentDirectional bottomCenter =
      AlignmentDirectional.bottomCenter;

  /// The `bottomEnd` constant aligns the bottom edge of the widget with
  /// the bottom edge of the available space, and the trailing edge of the
  /// widget with the trailing edge of the available space along the main axis.
  static const AlignmentDirectional bottomEnd = AlignmentDirectional.bottomEnd;

  /// The `bottomStart` constant aligns the bottom edge of the widget with
  /// the bottom edge of the available space, and the leading edge of the
  /// widget with the leading edge of the available space along the main axis.
  static const AlignmentDirectional bottomStart =
      AlignmentDirectional.bottomStart;

  /// The `center` constant centers the widget both horizontally and
  /// vertically within the available space, considering the reading direction
  /// for horizontal centering.
  static const AlignmentDirectional center = AlignmentDirectional.center;

  /// The `centerEnd` constant aligns the center of the widget with the
  /// center of the available space vertically, and the trailing edge of the
  /// widget with the trailing edge of the available space along the main axis.
  static const AlignmentDirectional centerEnd = AlignmentDirectional.centerEnd;

  /// The `centerStart` constant aligns the center of the widget with the
  /// center of the available space vertically, and the leading edge of the
  /// widget with the leading edge of the available space along the main axis.
  static const AlignmentDirectional centerStart =
      AlignmentDirectional.centerStart;

  /// The `topCenter` constant aligns the top edge of the widget with the
  /// top edge of the available space, and the center of the widget with
  /// the center of the available space along the main axis.
  static const AlignmentDirectional topCenter = AlignmentDirectional.topCenter;

  /// The `topEnd` constant aligns the top edge of the widget with the
  /// top edge of the available space, and the trailing edge of the widget
  /// with the trailing edge of the available space along the main axis.
  static const AlignmentDirectional topEnd = AlignmentDirectional.topEnd;

  /// The `topStart` constant aligns the top edge of the widget with the
  /// top edge of the available space, and the leading edge of the widget
  /// with the leading edge of the available space along the main axis.
  static const AlignmentDirectional topStart = AlignmentDirectional.topStart;
}

/// A class providing a utility method for creating box shadows.
class Bx {
  /// Creates a box shadow with the specified color and optional blur, spread, x, and y parameters.
  ///
  /// [color]: The color of the shadow.
  /// [blur]: The blur radius of the shadow. Default is 5.
  /// [spread]: The spread radius of the shadow. Default is 0.
  /// [x]: The horizontal offset of the shadow. Default is 0.
  /// [y]: The vertical offset of the shadow. Default is 0.
  ///
  /// Returns a box shadow instance.
  static BoxShadow shadow(Color color,
      {double? blur, double? spread, double? x, double? y}) {
    return BoxShadow(
        color: color,
        blurRadius: blur ?? 5,
        spreadRadius: spread ?? 0,
        offset: Offset(x ?? 0, y ?? 0));
  }

  /// Creates a linear gradient with the specified colors and optional start, end, stops, and tile mode parameters.
  ///
  /// [colors]: A list of colors to be used in the gradient.
  /// [begin]: The starting point of the gradient. Default is top-left (0.0, 0.0).
  /// [end]: The ending point of the gradient. Default is top-right (1.0, 0.0).
  /// [stops]: A list of positions for each color stop. Default is [0.0, 1.0].
  /// [mode]: The tile mode that defines how the gradient is repeated. Default is [TileMode.clamp].
  ///
  /// Returns a [LinearGradient] instance.
  static Gradient gradient(List<Color> colors,
      {AlignmentGeometry? begin,
      AlignmentGeometry? end,
      List<double>? stops = const [0.0, 1.0],
      TileMode? mode}) {
    return LinearGradient(
        colors: colors,
        begin: begin ?? const FractionalOffset(0.0, 0.0),
        end: end ?? const FractionalOffset(1.0, 0.0),
        stops: stops,
        tileMode: mode ?? TileMode.clamp);
  }

  /// Creates a radial gradient with the specified colors and optional center, radius, stops, and tile mode parameters.
  ///
  /// [colors]: A list of colors to be used in the radial gradient.
  /// [center]: The center point of the gradient. Default is center (0.5, 0.5).
  /// [radius]: The radius of the radial gradient. Default is 0.5.
  /// [stops]: A list of positions for each color stop. Default is evenly distributed.
  /// [mode]: The tile mode that defines how the gradient is repeated. Default is [TileMode.clamp].
  ///
  /// Returns a [RadialGradient] instance.
  static Gradient radialGradient(List<Color> colors,
      {AlignmentGeometry? center,
      double radius = 0.5,
      List<double>? stops,
      TileMode mode = TileMode.clamp}) {
    return RadialGradient(
        colors: colors,
        center: center ?? const Alignment(0.5, 0.5),
        radius: radius,
        stops: stops,
        tileMode: mode);
  }

  /// Creates a sweep gradient with the specified colors and optional center, startAngle, endAngle, stops, and tile mode parameters.
  ///
  /// [colors]: A list of colors to be used in the sweep gradient.
  /// [center]: The center point of the sweep gradient. Default is center (0.5, 0.5).
  /// [startAngle]: The start angle of the sweep in radians. Default is 0.0.
  /// [endAngle]: The end angle of the sweep in radians. Default is 2 * pi (full circle).
  /// [stops]: A list of positions for each color stop. Default is evenly distributed.
  /// [mode]: The tile mode that defines how the gradient is repeated. Default is [TileMode.clamp].
  ///
  /// Returns a [SweepGradient] instance.
  static Gradient sweepGradient(List<Color> colors,
      {AlignmentGeometry? center,
      double startAngle = 0.0,
      double endAngle = 2 * 3.141592653589793,
      List<double>? stops,
      TileMode mode = TileMode.clamp}) {
    return SweepGradient(
        colors: colors,
        center: center ?? const Alignment(0.5, 0.5),
        startAngle: startAngle,
        endAngle: endAngle,
        stops: stops,
        tileMode: mode);
  }
}
