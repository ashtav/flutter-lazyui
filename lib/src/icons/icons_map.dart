import 'package:flutter/material.dart';
import 'package:lazyui/src/config/config.dart';

import 'icons.dart';

enum IconSet { chevron }

Map<IconType, IconData> chevrons = {
  IconType.huge: Hi.arrowDown01,
  IconType.tabler: Ti.chevronDown,
  IconType.lineAwesome: La.chevronDown
};

Map<IconSet, IconData?> icons = {IconSet.chevron: chevrons[config.icon]};

class ConfigIcon {
  static IconData get(IconSet icon) {
    return icons[icon]!;
  }
}
