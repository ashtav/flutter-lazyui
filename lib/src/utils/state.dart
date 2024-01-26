part of utils;

final Map<String, LzNotifier> _notifiers = {};

class LzNotifier<T> extends ChangeNotifier {
  final String id;
  LzNotifier(this.id);

  dynamic value;

  void set(T value) {
    this.value = value;
    notifyListeners();
  }
}

class LzState {
  static void set(String key, dynamic value) {
    if (key.trim().isEmpty) return;
    if (key[0] != '#') return;

    final notifier = _notifiers[key];
    notifier?.set(value);
  }

  static Widget watch<T>(String key, T initValue, Widget Function(T value) builder) {
    return LzListener<T>(key, builder, initValue: initValue);
  }

  static void clear([String? key]) {
    if (key == null) {
      _notifiers.clear();
    } else {
      _notifiers.remove(key);
    }
  }
}

class LzListener<T> extends StatelessWidget {
  final String id;
  final Widget Function(T value) builder;
  final dynamic initValue;

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
