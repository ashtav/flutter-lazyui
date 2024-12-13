import 'package:flutter/material.dart';

import 'dropdown_value.dart';

/// Represents the style configuration for a dropdown menu.
class DropStyle {
  /// The width of the dropdown menu.
  final double? width;

  /// The color of the separators between dropdown options.
  final Color? separatorColor;

  /// The color of the text in the dropdown options.
  final Color? textColor;

  /// The color of the barrier behind the dropdown menu.
  final Color? barrierColor;

  /// The background color of the dropdown menu.
  final Color? backgroundColor;

  /// Indicates whether the background should blur when the dropdown menu is displayed.
  final bool backBlur;

  /// A list of indices indicating where separators should be displayed.
  final List<dynamic> separators;

  /// A list of icons to be displayed alongside dropdown options.
  final List<IconData?> icons;

  /// A list of critical options, which are styled differently to draw attention.
  final List<dynamic> critical;

  /// A list indicating which dropdown options are disabled.
  final List<dynamic> disabled;

  /// Indicates whether to animate the dropdown menu.
  final bool transition;

  /// The alignment of the dropdown menu relative to its anchor.
  final DropAlignment? alignment;

  /// The offset to adjust the position of the dropdown menu.
  final Offset? offset;

  /// Creates an instance of [DropStyle].
  DropStyle({
    this.width,
    this.separatorColor,
    this.textColor,
    this.barrierColor,
    this.backgroundColor,
    this.backBlur = false,
    this.separators = const [],
    this.icons = const [],
    this.critical = const [],
    this.disabled = const [],
    this.transition = false,
    this.alignment,
    this.offset,
  });
}
