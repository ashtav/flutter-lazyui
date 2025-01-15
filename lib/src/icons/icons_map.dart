import 'package:flutter/material.dart';
import 'package:lazyui/src/config/config.dart';

import 'icons.dart';

enum IconSet { chevron, search, eye, eyeOff, sun, moon, eraser, backspace, info }

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

Map<IconType, IconData> suns = {IconType.huge: Hi.sun02, IconType.tabler: Ti.sun, IconType.lineAwesome: La.sun};

Map<IconType, IconData> moons = {IconType.huge: Hi.moon02, IconType.tabler: Ti.moon, IconType.lineAwesome: La.moon};

Map<IconType, IconData> erasers = {
  IconType.huge: Hi.eraser,
  IconType.tabler: Ti.eraser,
  IconType.lineAwesome: La.eraser
};

Map<IconType, IconData> backspaces = {
  IconType.huge: Hi.eraser01,
  IconType.tabler: Ti.backspace,
  IconType.lineAwesome: La.backspace
};

Map<IconType, IconData> infos = {
  IconType.huge: Hi.informationCircle,
  IconType.tabler: Ti.infoCircle,
  IconType.lineAwesome: La.infoCircle
};

Map<IconSet, IconData?> icons = {
  IconSet.chevron: chevrons[config.icon],
  IconSet.search: searches[config.icon],
  IconSet.eye: eyes[config.icon],
  IconSet.eyeOff: eyesOff[config.icon],
  IconSet.sun: suns[config.icon],
  IconSet.moon: moons[config.icon],
  IconSet.eraser: erasers[config.icon],
  IconSet.backspace: backspaces[config.icon],
  IconSet.info: infos[config.icon],
};

class ConfigIcon {
  static IconData get(IconSet icon) {
    return icons[icon]!;
  }
}
