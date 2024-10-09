part of 'util.dart';

final Map<String, LzNotifier> _notifiers = {};

/// A class representing a notifier for value changes.
class LzNotifier<T> extends ChangeNotifier {
  /// The unique identifier for the notifier.
  final String id;

  /// Constructs a [LzNotifier] instance with the provided identifier.
  LzNotifier(this.id);

  /// The current value of the notifier.
  dynamic value;

  /// Sets the value of the notifier and notifies listeners.
  void set(T value) {
    this.value = value;
    notifyListeners();
  }
}

/// A class providing static methods for managing state and listening to changes.
class LzState {
  /// Retrieves the value associated with the specified key.
  static dynamic get(String key) {
    if (key.trim().isEmpty) return null;
    if (key[0] != '#') return null;

    final notifier = _notifiers[key];
    return notifier?.value;
  }

  /// Sets the value associated with the specified key.
  static void set(String key, dynamic value) {
    if (key.trim().isEmpty) return;
    if (key[0] != '#') return;

    final notifier = _notifiers[key];
    notifier?.set(value);
  }

  /// Creates a widget that rebuilds when the value associated with the specified key changes.
  static Widget watch<T>(
      String key, T initValue, Widget Function(T value) builder) {
    return LzListener<T>(key, builder, initValue: initValue);
  }

  /// Clears the value associated with the specified key or all keys if no key is provided.
  static void clear([String? key]) {
    if (key == null) {
      _notifiers.clear();
    } else {
      _notifiers.remove(key);
    }
  }
}

/// A widget that listens for changes in a specified key and rebuilds accordingly.
class LzListener<T> extends StatelessWidget {
  /// The identifier of the value to listen for changes.
  final String id;

  /// The builder function that returns the widget to build based on the value changes.
  final Widget Function(T value) builder;

  /// The initial value to use before any changes occur.
  final dynamic initValue;

  /// Constructs a [LzListener] instance with the provided identifier, builder function, and initial value.
  const LzListener(this.id, this.builder, {super.key, this.initValue});

  @override
  Widget build(BuildContext context) {
    final notifier = LzNotifier(id);
    _notifiers[id] = notifier;

    return notifier.watch((state) {
      return builder(state.value ?? initValue);
    });
  }
}
