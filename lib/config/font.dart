import 'package:flutter/material.dart';
import 'package:lazyui/src/utils/utils.dart';

import 'config.dart';

TextStyle gfont = Lazy.font;

class Gfont {
  // font color
  static final TextStyle black = gfont.copyWith(color: LzColors.black);
  static final TextStyle white = gfont.copyWith(color: Colors.white);
  static final TextStyle red = gfont.copyWith(color: LzColors.red);
  static final TextStyle orange = gfont.copyWith(color: LzColors.orange);
  static final TextStyle blue = gfont.copyWith(color: LzColors.blue);
  static final TextStyle green = gfont.copyWith(color: LzColors.green);
  static final TextStyle grey = gfont.copyWith(color: LzColors.grey);

  // font size
  static final TextStyle fs10 = gfont.copyWith(fontSize: 10);
  static final TextStyle fs11 = gfont.copyWith(fontSize: 11);
  static final TextStyle fs12 = gfont.copyWith(fontSize: 12);
  static final TextStyle fs13 = gfont.copyWith(fontSize: 13);
  static final TextStyle fs14 = gfont.copyWith(fontSize: 14);
  static final TextStyle fs15 = gfont.copyWith(fontSize: 15);
  static final TextStyle fs16 = gfont.copyWith(fontSize: 16);
  static final TextStyle fs17 = gfont.copyWith(fontSize: 17);
  static final TextStyle fs18 = gfont.copyWith(fontSize: 18);
  static final TextStyle fs19 = gfont.copyWith(fontSize: 19);
  static final TextStyle fs20 = gfont.copyWith(fontSize: 20);

  static final TextStyle bold = gfont.copyWith(fontWeight: FontWeight.bold);
  static final TextStyle normal = gfont.copyWith(fontWeight: FontWeight.normal);
  static final TextStyle muted =
      gfont.copyWith(fontWeight: FontWeight.normal, color: Colors.black54);

  static TextStyle fs(double size) => gfont.copyWith(fontSize: size);
  static TextStyle color(Color color) => gfont.copyWith(color: color);
  static TextStyle fbold(bool value) =>
      gfont.copyWith(fontWeight: value ? FontWeight.bold : FontWeight.normal);
}

extension TextStyleExtension on TextStyle {
  TextStyle get bold =>
      copyWith(fontWeight: FontWeight.bold, color: color, fontSize: fontSize);
  TextStyle get normal => copyWith(fontWeight: FontWeight.normal);
  TextStyle get muted => copyWith(color: Colors.black54);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get black => copyWith(color: LzColors.black);
  TextStyle get red => gfont.copyWith(color: LzColors.red);
  TextStyle get orange => gfont.copyWith(color: LzColors.orange);
  TextStyle get blue => gfont.copyWith(color: LzColors.blue);
  TextStyle get green => gfont.copyWith(color: LzColors.green);
  TextStyle get grey => gfont.copyWith(color: LzColors.grey);

  TextStyle fsize(double size) => copyWith(fontSize: size);
  TextStyle fcolor(Color color) => copyWith(color: color);
  TextStyle fopacity(double opacity) =>
      copyWith(color: color?.withOpacity(opacity));
  TextStyle fbold(bool value) =>
      gfont.copyWith(fontWeight: value ? FontWeight.bold : FontWeight.normal);
}
