import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'pad_notifier.dart';

/// This class provides a utility for displaying a numeric keypad widget.
class LzPad {
  /// Displays the numeric keypad widget.
  ///
  /// Parameters:
  /// - [context]: The build context.
  /// - [title]: The title of the keypad widget.
  /// - [subtitle]: The subtitle of the keypad widget.
  /// - [header]: The header widget of the keypad widget.
  /// - [length]: The length of the input.
  /// - [expired]: The duration until expiration.
  /// - [type]: The type of the keypad widget.
  /// - [style]: The style of the keypad widget.
  /// - [onCompleted]: A function called when input is completed.
  static void show(BuildContext context,
      {String? title,
      String? subtitle,
      Widget? header,
      int length = 6,
      Duration? expired,
      PadType type = PadType.bottomLine,
      PadStyle? style,
      void Function(PadController controller)? onCompleted}) {
    context.bottomSheet(
        PadWidget(
            title: title,
            subtitle: subtitle,
            header: header,
            length: length,
            expired: expired,
            type: type,
            style: style,
            onCompleted: onCompleted),
        safeArea: false);
  }
}

/// Widget for displaying the numeric keypad.
class PadWidget extends StatefulWidget {
  final String? title, subtitle;
  final Widget? header;
  final int length;
  final Duration? expired;
  final PadType type;
  final PadStyle? style;
  final Function(PadController values)? onCompleted;

  const PadWidget(
      {super.key,
      this.title,
      this.subtitle,
      this.header,
      this.length = 6,
      this.expired,
      this.type = PadType.bottomLine,
      this.style,
      this.onCompleted});

  @override
  State<PadWidget> createState() => _PadWidgetState();
}

class _PadWidgetState extends State<PadWidget> {
  final notifier = PadNotifier();
  late PadController valuesController;

  List<String> keyboards = ['1', '2', '3', '4', '5', '6', '7', '8', '9', 'x', '0', '<'];
  Timer? timer;

  void initExpired() {
    if (widget.expired != null) {
      timer = notifier.startTimer(widget.expired!, onTimeout: () {
        timer?.cancel();
        Navigator.of(context).pop();
      });
    }

    valuesController = PadController(context, notifier, timer: timer);
  }

  @override
  void initState() {
    super.initState();

    initExpired();

    notifier.length = widget.length < 4
        ? 4
        : widget.length > 8
            ? 8
            : widget.length;

    notifier.max = notifier.length;
  }

  @override
  void dispose() {
    notifier.dispose();
    timer?.cancel();
    valuesController.timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget header = widget.header ??
        Column(
          children: [
            Text(widget.title ?? 'Please enter your OTP code', style: Gfont.bold),
            if (widget.subtitle != null)
              Textr(
                widget.subtitle!,
                textAlign: Ta.center,
                style: Gfont.muted,
                padding: Ei.all(20),
              ),
            const SizedBox(height: 25),
          ],
        );

    final style = widget.style;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 120,
        leading: IconButton(
          icon: const Icon(La.times),
          onPressed: () {
            timer?.cancel();
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: 'f1f1f1'.hex,
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: Maa.center,
            children: [
              header,
              notifier.watch((state) => Row(
                    mainAxisSize: Mas.min,
                    children: List.generate(state.length, (i) {
                      String value = state.values.length > i ? state.values[i] : '';
                      bool isFilled = value.isNotEmpty;
                      bool inFocus = state.values.length == i;

                      return Container(
                        width: (context.width - 100) / notifier.length,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: Br.radius(4),
                          border: widget.type == PadType.bottomLine
                              ? null
                              : Br.all(color: isFilled ? Colors.black87 : Colors.black26),
                        ),
                        padding: Ei.sym(v: 0, h: 5),
                        margin: Ei.sym(h: 3),
                        child: Stack(
                          children: [
                            Center(
                              child: value.isEmpty ? const None() : SlideUp(child: Text(value, style: Gfont.fs20.bold)),
                            ),
                            if (widget.type == PadType.bottomLine)
                              Positioned(
                                bottom: 0,
                                child: AnimatedContainer(
                                  duration: 150.ms,
                                  decoration: BoxDecoration(
                                    color: inFocus
                                        ? style?.bottomInline?.focusColor ?? Colors.black12
                                        : isFilled
                                            ? style?.bottomInline?.filledColor ?? Colors.black54
                                            : style?.bottomInline?.unfillColor ?? Colors.black12,
                                    borderRadius: Br.radius(4),
                                  ),
                                  width: (context.width - 160) / notifier.length,
                                  height: 2,
                                ).lz.blink(inFocus, 300.ms),
                              )
                          ],
                        ),
                      );
                    }),
                  )),
              if (widget.expired != null)
                notifier.watch((state) {
                  return Textr('Expired in ${state.expired} seconds', style: Gfont.red, margin: Ei.only(t: 25))
                      .lz
                      .blink(!state.isPaused, 500.ms);
                }),
            ],
          )),
          Container(
            decoration: BoxDecoration(border: Br.only(['t'])),
            child: notifier.watch((state) {
              return Wrap(
                children: keyboards.generate((item, i) {
                  bool isEmpty = state.values.isEmpty && ['<', 'x'].contains(item);

                  return InkTouch(
                    onTap: isEmpty
                        ? null
                        : () {
                            if (item == 'x') {
                              notifier.reset();
                              return;
                            }

                            bool isCompleted = notifier.onInput(item);
                            if (isCompleted) {
                              valuesController.value = notifier.values.join();
                              widget.onCompleted?.call(valuesController);
                            }
                          },
                    border: Br.only([i < 3 ? '' : 't', i % 3 != 0 ? 'l' : '']),
                    color: Colors.white,
                    child: Container(
                        padding: Ei.sym(h: 15, v: ['<', 'x'].contains(item) ? 16.5 : 15),
                        width: (context.width - 2) / 3,
                        child: Center(
                                child: item == '<'
                                    ? const Icon(Ti.backspace, color: Colors.black54)
                                    : item == 'x'
                                        ? const Icon(
                                            Ti.eraser,
                                            color: Colors.black54,
                                          )
                                        : Text(item, style: Gfont.fs17))
                            .lz
                            .opacity(isEmpty ? .4 : 1)),
                  );
                }),
              );
            }),
          )
        ],
      ),
    );
  }
}

/// Enumeration for the type of keypad.
enum PadType { borderRounded, bottomLine }

/// Style configuration for the keypad widget.
class PadStyle {
  final BottomInlineStyle? bottomInline;

  const PadStyle({this.bottomInline});
}

/// Style configuration for the bottom inline keypad.
class BottomInlineStyle {
  final Color? unfillColor, focusColor, filledColor;

  BottomInlineStyle({this.unfillColor, this.focusColor, this.filledColor});
}

/// Controller for managing the keypad.
class PadController {
  final BuildContext _context;
  final PadNotifier _notifier;
  Timer? timer;
  String value;

  PadController(this._context, this._notifier, {this.timer, this.value = ''});

  /// Pauses the keypad.
  PadController pause() {
    timer?.cancel();
    _notifier.isPaused = true;
    _notifier.setPaused(true);

    return this;
  }

  /// Resumes the keypad.
  PadController resume() {
    if (_notifier.remainingDuration != null) {
      _notifier.setPaused(false);
      timer = _notifier.startTimer(_notifier.remainingDuration!, onTimeout: () {
        Navigator.of(_context).pop();
      });
    }

    return this;
  }

  /// Resets the keypad.
  PadController reset() {
    _notifier.reset();
    return this;
  }
}
