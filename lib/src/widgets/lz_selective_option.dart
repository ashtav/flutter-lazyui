import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

/// ``` dart
/// LzSelectiveOption.show(context, options: ['See Detail', 'Edit', 'Delete'].options(icons: icons), confirmOnTap: [2], onSelect: (value) {
///   logg(value.option);
/// });
///
/// // You can set confirmOnTap: [{2: 'Cancel|Delete'}]
/// ```

class LzSelectiveOption {
  static void show(
    BuildContext context, {
    String? title,
    IconData? icon,
    Option? initValue,
    required List<Option> options,
    List confirmOnTap = const [],
    Function(Option)? onSelect,
    String? cancelLabel,
    MainAxisAlignment? alignment,
    bool dismissOnSelect = true,
  }) {
    context.bottomSheet(
        _LzSelectiveOptionWidget(
          context: context,
          title: title,
          icon: icon,
          initValue: initValue,
          options: options,
          confirmOnTap: confirmOnTap,
          onSelect: onSelect,
          cancelLabel: cancelLabel,
          alignment: alignment,
          dismissOnSelect: dismissOnSelect,
        ),
        backgroundColor: Colors.transparent,
        enableDrag: true);
  }
}

class _LzSelectiveOptionWidget extends StatelessWidget {
  final BuildContext context;
  final String? title;
  final IconData? icon;
  final Option? initValue;
  final List<Option> options;
  final List confirmOnTap;
  final Function(Option)? onSelect;
  final String? cancelLabel;
  final MainAxisAlignment? alignment;
  final bool dismissOnSelect;

  const _LzSelectiveOptionWidget(
      {required this.context,
      this.title,
      this.icon,
      this.initValue,
      required this.options,
      this.confirmOnTap = const [],
      this.onSelect,
      this.cancelLabel,
      this.alignment,
      this.dismissOnSelect = true});

  @override
  Widget build(BuildContext context) {
    List<Option> options = this.options;
    final notifier = LzSelectiveOptionNotifier(options);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      int index = options.indexWhere((e) => e.toMap().toString() == initValue?.toMap().toString());
      notifier.onSelect(context, initValue, index);
    });

    return Column(
      mainAxisSize: Mas.min,
      crossAxisAlignment: Caa.start,
      children: [
        if (title != null)
          Textr(
            title ?? 'Options',
            style: Gfont.fs20.white.bold,
            icon: icon ?? La.clipboardList,
            padding: Ei.all(20),
          ),
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: Br.radiusOnly(tlr: 8)),
          constraints: BoxConstraints(
            maxHeight: context.height * 0.65,
          ),
          child: ListView(
            physics: BounceScroll(),
            shrinkWrap: true,
            controller: notifier.scrollController,
            children: List.generate(options.length, (i) {
              final option = options[i];
              String label = option.option;

              return notifier.watch((state) {
                bool isSelected = state.selected?.toMap().toString() == option.toMap().toString();

                return Opacity(
                  opacity: option.disabled ? .5 : 1,
                  child: Stack(
                    key: state.keys[i],
                    children: [
                      InkW(
                        onTap: option.disabled
                            ? null
                            : () {
                                if (dismissOnSelect) context.pop();
                                onSelect?.call(option);
                                state.onSelect(context, option, i);
                              },
                        padding: Ei.all(22),
                        border: Br.only(['t'], except: i == 0),
                        color: isSelected ? lighten(Colors.blue, mixFactor: .05) : Colors.white,
                        child: Row(
                          mainAxisAlignment: alignment ?? Maa.start,
                          children: [
                            Text(
                              label,
                              style: Gfont.color(isSelected ? Colors.blue : LzColor.black),
                            ).flexible(),
                          ],
                        ),
                      ),
                      AnimatedPositioned(
                          duration: 150.ms,
                          top: 0,
                          left: isSelected ? 0 : -5,
                          child: Container(
                            width: 5,
                            height: context.height,
                            decoration: BoxDecoration(color: LzColor.black),
                          ))
                    ],
                  ),
                );
              });
            }),
          ),
        ).clip(tlr: 8),
      ],
    );
  }
}

class LzSelectiveOptionNotifier extends ChangeNotifier {
  final List<Option> options;

  final scrollController = ScrollController();

  List<GlobalKey> keys = [];
  Option? selected;

  LzSelectiveOptionNotifier(this.options) {
    keys = List.generate(options.length, (i) => GlobalKey());
  }

  void onSelect(BuildContext context, Option? value, int i) {
    try {
      selected = value;
      notifyListeners();

      if (i < 0) {
        return;
      }

      double fs = 16.5;
      double p = 22;

      final text = TextSpan(text: value?.option ?? '', style: TextStyle(fontSize: fs));

      final textPainter = TextPainter(text: text, textDirection: TextDirection.ltr);
      textPainter.layout();
      final textWidth = textPainter.width;

      final screenWidth = MediaQuery.of(context).size.width;
      final paddingWidth = p * 2;
      final remainingWidth = screenWidth - paddingWidth;
      final rowCount = (textWidth / remainingWidth).ceil();

      final height = (fs + paddingWidth + (fs * rowCount)) - 10.3;

      double to = i * height;
      // logg('-- jump to: $to');

      scrollController.jumpTo(to);

      Utils.timer(() {
        final k = keys[i];
        final context = k.currentContext;

        if (context != null) {
          Scrollable.ensureVisible(
            context,
            duration: 300.ms,
            curve: Curves.linear,
            alignment: 0.5,
          );
        }
      }, 100.ms);
    } catch (e, s) {
      Utils.errorCatcher(e, s);
    }
  }
}

Color lighten(Color color, {double mixFactor = .5}) {
  // Pastikan mixFactor berada dalam kisaran 0.0 hingga 1.0
  mixFactor = mixFactor.clamp(0.0, 1.0);

  // Gunakan faktor campuran yang dihitung untuk menciptakan warna yang lebih tipis
  int red = (color.red * mixFactor + 255 * (1 - mixFactor)).round();
  int green = (color.green * mixFactor + 255 * (1 - mixFactor)).round();
  int blue = (color.blue * mixFactor + 255 * (1 - mixFactor)).round();

  return Color.fromARGB(color.alpha, red, green, blue);
}
