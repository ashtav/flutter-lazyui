part of extension;

/// Extends the functionality of the [GlobalKey] class with additional methods.
extension LzGlobalKeyExtension on GlobalKey {
  BuildContext? get context => currentContext;
}
