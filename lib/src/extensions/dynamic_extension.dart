part of extensions;

extension ListenableExtension<T extends ChangeNotifier> on T {
  AnimatedBuilder watch(Widget Function(T) child) {
    return AnimatedBuilder(
      animation: this,
      builder: (context, _) => child(this),
    );
  }
}

extension CustomDynamicExtension on dynamic {
  /// Return the value if it satisfies the specified conditions, otherwise return a default value.
  ///
  /// The optional [value] parameter is the value to be checked.
  /// The optional [conditions] parameter is a list of conditions that the value needs to satisfy (default: [null, '']).
  ///
  /// Example usage:
  /// ```dart
  /// String? name;
  /// String displayName = name.orIf('-', [null, '']);
  /// print(displayName); // If name is null or empty, the output will be '-'
  /// ```
  ///
  T orIf<T>([dynamic value, List conditions = const [null, '']]) {
    Type type = runtimeType;
    dynamic result = '-';

    if (value == null) {
      if (type is int) {
        result = 0;
      } else if (type is double) {
        result = 0.0;
      } else if (type is bool) {
        result = false;
      }
    } else {
      result = value;
    }

    return conditions.contains(this) ? result : this;
  }
}
