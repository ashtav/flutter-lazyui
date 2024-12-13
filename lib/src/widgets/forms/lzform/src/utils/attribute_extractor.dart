// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../models/attribute.dart';

/// A mixin for form-related functionalities to be used with widgets.
///
/// This mixin provides utility methods to interact with form attributes and create internal widgets.
mixin LzFormMixin {
  /// Retrieves the attribute of type `Attribute` from the nearest ancestor widget of type `LzFormWrap`.
  ///
  /// If the `LzFormWrap` widget is found, returns an `Attribute` object containing:
  /// - `style`: The style inherited from `LzFormWrap`.
  /// - `isWrapped`: Indicates whether the widget is wrapped by `LzFormWrap`.
  /// - `isGrouped`: Indicates whether grouping is enabled in `LzFormWrap`.
  /// - `type`: The type of the `LzFormWrap`.
  ///
  /// If no `LzFormWrap` widget is found, returns an `Attribute` object with default or null values.
  Attribute getAttribute<T>(BuildContext context) {
    final fa = context.findAncestorWidgetOfExactType<LzFormWrap>();
    return Attribute(
        style: fa?.style,
        isWrapped: fa != null,
        isGrouped: fa?.grouping ?? false,
        type: fa?.type);
  }

  /// Creates and returns a `_TopInnerLineLabel` widget with the specified `color`.
  ///
  /// This is a private method used internally.
  _TopInnerLineLabel getTopInnerLineLabel({Color? color}) {
    return _TopInnerLineLabel(color: color);
  }
}

/// Mixin providing utility methods and widgets for forms.
///
/// Methods:
///   - `getAttribute<T>(BuildContext context)`: Retrieves the attribute of a form element.
///
/// Widgets:
///   - `_TopInnerLineLabel`: A widget representing a top inner line label.
///     Parameters:
///       - `color`: The color of the line label.
class _TopInnerLineLabel extends StatelessWidget {
  final Color? color;
  const _TopInnerLineLabel({this.color});

  @override
  Widget build(BuildContext context) {
    return Poslign(
      alignment: Alignment.centerLeft,
      child: Container(
        height: 3,
        color: color ?? 'fafafa'.hex,
        width: context.width,
        margin: Ei.only(t: 1.5),
      ),
    );
  }
}
