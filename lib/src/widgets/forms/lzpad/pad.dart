import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/colors.dart';

import 'input_widget.dart';
import 'pad_notifier.dart';

/// This class provides a utility for displaying a numeric keypad widget.
class LzPad {
  /// Displays the numeric keypad widget.
  ///
  /// Parameters:
  /// - [context]: The build context.
  /// - [title]: The title of the keypad widget.
  /// - [message]: The message of the keypad widget.
  /// - [header]: The header widget of the keypad widget.
  /// - [footer]: The footer widget of the keypad widget.
  /// - [length]: The length of the input.
  /// - [expired]: The duration until expiration.
  /// - [type]: The type of the keypad widget.
  /// - [style]: The style of the keypad widget.
  /// - [onCompleted]: A function called when input is completed.
  static void show(BuildContext context,
      {String? title,
      String? message,
      Widget? header,
      Widget? footer,
      int length = 6,
      Duration? expired,
      PadType type = PadType.bottomLine,
      PadStyle? style,
      void Function(PadController controller)? onCompleted}) {
    context.lz.focus(); // hide keyboard
    context.bottomSheet(
        PadWidget(
            title: title,
            message: message,
            header: header,
            footer: footer,
            length: length,
            expired: expired,
            type: type,
            style: style,
            onCompleted: onCompleted),
        safeArea: false);
  }
}

/// Represents a customizable pad widget for user input.
///
/// This widget can be used for various input purposes, potentially including
/// passcodes, PINs, or other sensitive data entry.
class PadWidget extends StatefulWidget {
  /// Title displayed above the input area (optional).
  final String? title;

  /// Message displayed below the input area (optional).
  final String? message;

  /// Optional header widget displayed at the top of the pad.
  final Widget? header;

  /// Optional footer widget displayed at the bottom of the pad.
  final Widget? footer;

  /// Length of the input required (defaults to 6).
  final int length;

  /// Optional duration after which the pad expires (clears input).
  final Duration? expired;

  /// Type of pad to display (defaults to PadType.bottomLine).
  final PadType type;

  /// Optional styling options for the pad.
  final PadStyle? style;

  /// Callback function executed when the user completes input (optional).
  final Function(PadController values)? onCompleted;

  /// Creates a new `PadWidget` instance.
  const PadWidget(
      {super.key,
      this.title,
      this.message,
      this.header,
      this.footer,
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

  List<String> keyboards = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    'x',
    '0',
    '<'
  ];
  Timer? timer;

  void onInit() {
    notifier.setMessage(widget.message ?? '');

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

    onInit();

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
    final font = Gfont.style(context);

    Widget header = widget.header ??
        Column(
          children: [
            Text(widget.title ?? 'Please enter your OTP code',
                style: font.bold),
            if (widget.message != null)
              notifier.watch((state) => Textr(
                    state.message,
                    textAlign: Ta.center,
                    style: font.muted,
                    padding: Ei.all(20),
                  )),
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
      backgroundColor: lzDarkMode ? '1e1d21'.hex.darken(.2) : 'f1f1f1'.hex,
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: Maa.center,
            children: [
              LzListView(
                shrinkWrap: true,
                padding: Ei.sym(v: 35),
                scrollLimit: const [35, 35],
                children: [
                  Column(
                    mainAxisAlignment: Maa.center,
                    children: [
                      header,
                      notifier.watch((state) => Row(
                            mainAxisSize: Mas.min,
                            children: List.generate(state.length, (i) {
                              String value = state.values.length > i
                                  ? state.values[i]
                                  : '';
                              bool isFilled = value.isNotEmpty;
                              bool inFocus = state.values.length == i;

                              if (widget.type == PadType.passcode) {
                                return PasscodeInput(filled: isFilled);
                              }

                              return Container(
                                width: (context.width - 100) / notifier.length,
                                height: 55,
                                decoration: BoxDecoration(
                                  borderRadius: Br.radius(4),
                                  border: widget.type == PadType.bottomLine
                                      ? null
                                      : Br.all(
                                          color: isFilled
                                              ? Colors.black87
                                              : Colors.black26),
                                ),
                                padding: Ei.sym(v: 0, h: 5),
                                margin: Ei.sym(h: 3),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: value.isEmpty
                                          ? const None()
                                          : SlideAnimate(
                                              child: Text(value,
                                                  style: font.fs20.bold)),
                                    ),
                                    if (widget.type == PadType.bottomLine)
                                      Positioned(
                                        bottom: 0,
                                        child: AnimatedContainer(
                                          duration: 150.ms,
                                          decoration: BoxDecoration(
                                            color: inFocus
                                                ? style?.bottomInline
                                                        ?.focusColor ??
                                                    Colors
                                                        .black12.adaptWithTheme
                                                : isFilled
                                                    ? style?.bottomInline
                                                            ?.filledColor ??
                                                        Colors.black54
                                                            .adaptWithTheme
                                                    : style?.bottomInline
                                                            ?.unfillColor ??
                                                        Colors.black12
                                                            .adaptWithTheme,
                                            borderRadius: Br.radius(4),
                                          ),
                                          width: (context.width - 160) /
                                              notifier.length,
                                          height: 2,
                                        ).lz.animate.blink(inFocus, 300.ms),
                                      )
                                  ],
                                ),
                              );
                            }),
                          )),
                      if (widget.expired != null)
                        notifier.watch((state) {
                          return Textr('Expired in ${state.expired} seconds',
                                  style: font.red, margin: Ei.only(t: 25))
                              .lz
                              .animate
                              .blink(!state.isPaused, 500.ms);
                        }),
                    ],
                  ),
                ],
              ),
            ],
          )),
          widget.footer ?? const None(),

          // keyboard
          Container(
            decoration:
                BoxDecoration(border: Br.only(['t']), color: lzBackgroundColor),
            child: notifier.watch((state) {
              return Wrap(
                children: keyboards.generate((item, i) {
                  bool isEmpty =
                      state.values.isEmpty && ['<', 'x'].contains(item);

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
                    color: lzBackgroundColor,
                    child: Container(
                        padding: Ei.sym(
                            h: 15, v: ['<', 'x'].contains(item) ? 17 : 15),
                        width: (context.width - 2) / 3,
                        child: Center(
                                child: item == '<'
                                    ? Icon(Ti.backspace,
                                        color: Colors.black87.adaptWithTheme)
                                    : item == 'x'
                                        ? Icon(
                                            Ti.eraser,
                                            color:
                                                Colors.black87.adaptWithTheme,
                                          )
                                        : Text(item, style: font.fs17))
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

/// Enumerates different visual styles for the keypad widget.
enum PadType {
  /// Pad with rounded borders.
  borderRounded,

  /// Pad with a bottom line separating the keys.
  bottomLine,

  /// Pad specifically designed for passcode input (might have visual cues for hiding characters).
  passcode,
}

/// Configuration options for the visual style of the keypad widget.
class PadStyle {
  /// Customizes the appearance of the bottom line in the `bottomLine` pad type (optional).
  final BottomInlineStyle? bottomInline;

  /// Creates a new `PadStyle` instance.
  ///
  /// All parameters are optional.
  const PadStyle({this.bottomInline});
}

/// Defines styling options for the bottom line in the `PadType.bottomLine` keypad.
class BottomInlineStyle {
  /// Color used for the unfilled portion of the bottom line (optional).
  final Color? unfillColor;

  /// Color used for the focused key's section of the bottom line (optional).
  final Color? focusColor;

  /// Color used for the filled portion of the bottom line (optional).
  final Color? filledColor;

  /// Creates a new `BottomInlineStyle` instance.
  ///
  /// All parameters are optional.
  BottomInlineStyle({this.unfillColor, this.focusColor, this.filledColor});
}

/// Manages user input and state for the keypad widget.
///
/// This class provides methods to handle user interactions with the keypad,
/// update the current input value, and interact with the associated `PadNotifier`
/// to trigger UI updates.
class PadController {
  /// The build context of the widget using this controller.
  final BuildContext _context;

  /// The `PadNotifier` instance used for notifying the UI about changes.
  final PadNotifier _notifier;

  /// Optional timer object for handling timeouts or expiration (can be null).
  Timer? timer;

  /// The current value entered by the user.
  String value;

  /// Creates a new `PadController` instance.
  ///
  /// [context] and [notifier] are required parameters.
  /// [timer] and [value] are optional.
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

  /// Set message
  PadController setMessage(String value) {
    _notifier.setMessage(value);
    return this;
  }
}

/// LzPadHeader widget for the keypad.
class LzPadHeader extends StatelessWidget {
  /// The icon of the keypad.
  final IconData? icon;

  /// The title and message of the keypad.
  final String? title, message;

  /// Creates a new LzPadHeader widget.
  const LzPadHeader({super.key, this.icon, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    final font = Gfont.style(context);
    return Column(
      children: [
        if (icon != null)
          Iconr(icon,
              size: 50,
              color: Colors.black54.adaptWithTheme,
              margin: Ei.only(b: 25)),
        if (title != null) Text(title!, style: font.fs18.bold),
        if (message != null)
          Text(message!, style: font.muted, textAlign: Ta.center),
        const SizedBox(height: 20)
      ],
    ).gap(10);
  }
}
