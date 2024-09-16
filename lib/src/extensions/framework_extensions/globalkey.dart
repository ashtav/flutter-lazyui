part of extension;

/// Extension on [GlobalKey] providing convenience methods.
extension LzGlobalKeyExtension on GlobalKey {
  /// Returns the [BuildContext] associated with this [GlobalKey].
  BuildContext? get context => currentContext;
}
