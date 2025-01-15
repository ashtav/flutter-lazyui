part of '../extension.dart';

/// Extension on [GlobalKey] providing convenience methods.
extension CustomGlobalKeyExtension on GlobalKey {
  /// Returns the [BuildContext] associated with this [GlobalKey].
  BuildContext? get context => currentContext;
}
