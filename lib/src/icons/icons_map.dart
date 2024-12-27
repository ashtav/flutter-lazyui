import 'package:flutter/material.dart';
import 'package:lazyui/src/config/config.dart';

import 'icons.dart';

enum IconSet { chevron, search, eye, eyeOff }

Map<IconType, IconData> chevrons = {
  IconType.huge: Hi.arrowDown01,
  IconType.tabler: Ti.chevronDown,
  IconType.lineAwesome: La.chevronDown
};

Map<IconType, IconData> searches = {
  IconType.huge: Hi.search01,
  IconType.tabler: Ti.search,
  IconType.lineAwesome: La.search
};

Map<IconType, IconData> eyes = {IconType.huge: Hi.view, IconType.tabler: Ti.eye, IconType.lineAwesome: La.eye};

Map<IconType, IconData> eyesOff = {
  IconType.huge: Hi.viewOff,
  IconType.tabler: Ti.eyeOff,
  IconType.lineAwesome: La.eyeSlash
};

Map<IconSet, IconData?> icons = {
  IconSet.chevron: chevrons[config.icon],
  IconSet.search: searches[config.icon],
  IconSet.eye: eyes[config.icon],
  IconSet.eyeOff: eyesOff[config.icon],
};

class ConfigIcon {
  static IconData get(IconSet icon) {
    return icons[icon]!;
  }
}
