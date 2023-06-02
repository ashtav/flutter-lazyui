import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

extension CustomColorExtension on Color {
  Color lighten([double mixFactor = .5]) => LzColors.lighten(this, mixFactor: mixFactor);
  Color darken([double mixFactor = .5]) => LzColors.darken(this, mixFactor: mixFactor);
  Color inverse() => LzColors.inverse(this);
  bool isDark() => LzColors.isDark(this);
}
