import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import 'otp_notifier.dart';

/// A customizable One-Time Password (OTP) input widget.
///
/// This widget provides an interface for entering a numeric OTP typically used
/// for authentication purposes. It supports custom expiration times, various
/// OTP styles, and a completion callback.
///
/// The OTP input supports a minimum length of 4 and a maximum length of 8.
/// Upon expiration, if set, the widget will automatically dismiss itself.
///
/// Example usage:
/// ```dart
/// LzOtp.show(context,
///   expired: 60.s,
///   type: OtpType.bottomLine,
///   subtitle: 'OTP code sent to +628100000, please enter the code below to reset your password',
///   onCompleted: (otp) {
///     String value = otp.value;
///     // request api to verify otp
/// });
/// ```

class LzOtp {
  static void show(BuildContext context,
      {String? title,
      String? subtitle,
      Widget? header,
      int length = 6,
      Duration? expired,
      OtpType type = OtpType.bottomLine,
      OtpStyle? style,
      void Function(OtpController otp)? onCompleted}) {
    context.bottomSheet(OtpWidget(
        title: title,
        subtitle: subtitle,
        header: header,
        length: length,
        expired: expired,
        type: type,
        style: style,
        onCompleted: onCompleted));
  }
}

/// The widget uses a custom virtual keyboard for input to prevent keylogging
/// from the system keyboard.
class OtpWidget extends StatefulWidget {
  final String? title, subtitle;
  final Widget? header;
  final int length;
  final Duration? expired;
  final OtpType type;
  final OtpStyle? style;
  final Function(OtpController otp)? onCompleted;

  /// Creates an OtpWidget.
  ///
  /// The [title] and [subtitle] are displayed above the OTP input field.
  /// The [header] allows passing a custom widget to be placed above the input field.
  /// The [length] determines the number of OTP digits, minimum 4, maximum 8.
  /// The [expired] duration after which the OTP is considered expired.
  /// The [type] of OTP input style to use.
  /// The [style] allows custom styling of the OTP input field.
  /// The [onCompleted] is the callback function when the user has completed the input.
  const OtpWidget(
      {super.key,
      this.title,
      this.subtitle,
      this.header,
      this.length = 6,
      this.expired,
      this.type = OtpType.bottomLine,
      this.style,
      this.onCompleted});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

/// The associated state class for [OtpWidget].
///
/// Manages the OTP input and handles expiration logic if provided.
class _OtpWidgetState extends State<OtpWidget> {
  final notifier = OtpNotifier();
  late OtpController otpController;

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
    '',
    '0',
    '<'
  ];
  Timer? timer;

  void initExpired() {
    if (widget.expired != null) {
      timer = notifier.startTimer(widget.expired!, onTimeout: () {
        timer?.cancel();
        Navigator.of(context).pop();
      });
    }

    otpController = OtpController(context, notifier, timer: timer);
  }

  @override
  void initState() {
    super.initState();

    // init expired timer
    initExpired();

    // set length, minimum 4, maximum 8
    notifier.length = widget.length < 4
        ? 4
        : widget.length > 8
            ? 8
            : widget.length;

    // set max when user input otp, based on length
    notifier.max = notifier.length;
  }

  @override
  void dispose() {
    notifier.dispose();
    timer?.cancel();
    otpController.timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // build header
    Widget header = widget.header ??
        Column(
          children: [
            Text(widget.title ?? 'Please enter your OTP code',
                style: Gfont.bold),

            // subtitle
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

    // style
    final style = widget.style;

    return Scaffold(
      appBar: AppBar(elevation: 0),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: Maa.center,
            children: [
              // header
              header,

              // input number
              notifier.watch((state) => Row(
                    mainAxisSize: Mas.min,
                    children: List.generate(state.length, (i) {
                      String value = state.otp.length > i ? state.otp[i] : '';
                      bool isFilled = value.isNotEmpty;
                      bool inFocus = state.otp.length == i;

                      return Container(
                        width: (context.width - 100) / notifier.length,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: Br.radius(4),
                            border: widget.type == OtpType.bottomLine
                                ? null
                                : Br.all(
                                    color: isFilled
                                        ? Colors.black87
                                        : Colors.black12),
                            color: Colors.white),
                        padding: Ei.sym(v: 0, h: 5),
                        margin: Ei.sym(h: 3),
                        child: Stack(
                          children: [
                            Center(
                              child: value.isEmpty
                                  ? const None()
                                  : SlideUp(
                                      child:
                                          Text(value, style: Gfont.fs20.bold)),
                            ),
                            if (widget.type == OtpType.bottomLine)
                              Positioned(
                                bottom: 0,
                                child: AnimatedContainer(
                                  duration: 150.ms,
                                  decoration: BoxDecoration(
                                    color: inFocus
                                        ? style?.bottomInline?.focusColor ??
                                            Colors.orange
                                        : isFilled
                                            ? style?.bottomInline
                                                    ?.filledColor ??
                                                Colors.green
                                            : style?.bottomInline
                                                    ?.unfillColor ??
                                                Colors.black12,
                                    borderRadius: Br.radius(4),
                                  ),
                                  width:
                                      (context.width - 160) / notifier.length,
                                  height: 2,
                                ).lz.blink(inFocus, 300.ms),
                              )
                          ],
                        ),
                      );
                    }),
                  )),

              // otp expired timer
              if (widget.expired != null)
                notifier.watch((state) {
                  return Textr('Expired in ${state.expired} seconds',
                          style: Gfont.red, margin: Ei.only(t: 25))
                      .lz
                      .blink(!state.isPaused, 500.ms);
                }),
            ],
          )),

          // custom virtual keyboard
          Wrap(
            children: keyboards.generate((item, i) {
              return InkTouch(
                onTap: item == ''
                    ? null
                    : () {
                        bool isCompleted = notifier.onInput(item);
                        if (isCompleted) {
                          otpController.value = notifier.otp.join();
                          widget.onCompleted?.call(otpController);
                        }
                      },
                border: Br.only([i < 3 ? '' : 't', i % 3 != 0 ? 'l' : '']),
                child: Container(
                    padding: Ei.all(15),
                    width: (context.width - 2) / 3,
                    child: Center(
                        child: item == '<'
                            ? const Icon(Ti.backspace, color: Colors.black54)
                            : Text(item, style: Gfont.fs17))),
              );
            }),
          )
        ],
      ),
    );
  }
}

/// An enumeration of the types of OTP input styles.
///
/// Use [OtpType.borderRounded] for rounded borders around the OTP digits.
/// Use [OtpType.bottomLine] for an underline style.
enum OtpType { borderRounded, bottomLine }

/// A class to configure the overall style for the OTP widget.
///
/// Currently supports customization for the [OtpType.bottomLine] type.
class OtpStyle {
  final BottomInlineStyle? bottomInline;

  /// Creates an [OtpStyle].
  ///
  /// Pass [bottomInline] to customize the bottom line style for [OtpType.bottomLine].
  const OtpStyle({this.bottomInline});
}

/// A class representing the style configuration for [OtpWidget].
///
/// This class allows customization of the bottom line style when the [OtpType.bottomLine] is used.
class BottomInlineStyle {
  final Color? unfillColor, focusColor, filledColor;

  /// Creates a [BottomInlineStyle].
  ///
  /// The [unfillColor] is the color of the bottom line when the field is empty.
  /// The [focusColor] is the color of the bottom line when the field is in focus.
  /// The [filledColor] is the color of the bottom line when the field is filled.

  BottomInlineStyle({this.unfillColor, this.focusColor, this.filledColor});
}

/// A controller for managing the OTP input state and timer.
///
/// This class provides mechanisms to pause and resume the OTP timer,
/// as well as to handle the current value of the OTP input. It works
/// in conjunction with an [OtpNotifier] to manage state updates and
/// potentially trigger UI changes in response to timer events.
///
class OtpController {
  /// The [BuildContext] for the widget that created this controller.
  final BuildContext _context;

  /// The [OtpNotifier] that holds the state for the OTP timer and input.
  final OtpNotifier _notifier;

  /// The [Timer] that counts down the OTP validity duration.
  Timer? timer;

  /// The current value of the OTP input.
  String value;

  /// Creates an [OtpController].
  ///
  /// The [_context] is the BuildContext from the widget that creates the controller.
  /// The [_notifier] is the OtpNotifier that this controller manipulates.
  /// The [timer] is an optional Timer that can be passed to resume countdown from a specific duration.
  /// The [value] is the initial value of the OTP input, defaulting to an empty string.
  OtpController(this._context, this._notifier, {this.timer, this.value = ''});

  /// Pauses the countdown timer, if active, and sets the notifier's paused state to true.
  OtpController pause() {
    timer?.cancel();
    _notifier.isPaused = true;
    _notifier.setPaused(true);

    return this;
  }

  /// Resumes the countdown timer from the remaining duration if the notifier was paused.
  ///
  /// If the remaining duration is not null, it resets the timer with the remaining duration
  /// and defines the actions to take when the timer times out.
  OtpController resume() {
    if (_notifier.remainingDuration != null) {
      _notifier.setPaused(false);
      timer = _notifier.startTimer(_notifier.remainingDuration!, onTimeout: () {
        Navigator.of(_context).pop();
      });
    }

    return this;
  }

  /// Resets the OTP input.
  ///
  /// This method clears the current value of the OTP input and resets the notifier.
  OtpController reset() {
    _notifier.reset();
    return this;
  }
}
