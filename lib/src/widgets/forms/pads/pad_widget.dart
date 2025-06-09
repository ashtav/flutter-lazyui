import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/config/config.dart';
import 'package:lazyui/src/icons/icons_map.dart';
import 'package:lazyui/src/theme/color.dart';
import 'package:lazyui/src/widgets/forms/pads/notifier.dart';

/// A customizable widget for entering PINs, OTPs, or passcodes using a keypad interface.
/// It displays a series of input fields and a custom numeric keypad, with optional timer and messages.
class PadWidget extends StatelessWidget {
  /// The notifier that manages the pad state and input values.
  final PadNotifier notifier;

  /// The number of input fields to display.
  final int length;

  /// Whether to obsecure the input (for passcodes).
  final bool passcode;

  /// The duration before the input expires (optional).
  final Duration? expired;

  /// The title text displayed above the input fields (optional).
  final String? title;

  /// The message text displayed below the title (optional).
  final String? message;

  /// Callback when the input is completed.
  final Function(PadController controller)? onCompleted;

  const PadWidget(
    this.notifier, {
    super.key,
    this.length = 6,
    this.passcode = false,
    this.expired,
    this.title,
    this.message,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    List<String> keys = [
      ...[1, 9].iterate().map((e) => '$e'),
      'x',
      '0',
      '<'
    ];

    if (expired != null &&
        context.mounted &&
        notifier.remainingDuration == null) {
      notifier.startTimer(expired!, onTimeout: () {
        context.lz.pop();
      });
    }

    String defaultTitle = 'Please enter your OTP Code.';
    String detaultMessage =
        'Otp code sent to your number, please enter the code below to reset your password.';

    String defaultTitlePasscode = 'Please enter your Passcode.';
    String defaultMessagePasscode =
        'Your passcode is required to proceed. Enter the code below to unlock access.';

    return Scaffold(
        appBar: TransAppBar(
          leading: IconButton(
              onPressed: () => context.lz.pop(), icon: Icon(Hi.cancel01)),
        ),
        body: Column(
          children: [
            Expanded(
              child: Column(
                spacing: 30,
                children: [
                  // header
                  Padding(
                    padding: Ei.sym(h: 20),
                    child: Column(
                      spacing: 10,
                      children: [
                        Text(
                            title ??
                                (passcode
                                    ? defaultTitlePasscode
                                    : defaultTitle),
                            style: Gfont.bold,
                            textAlign: Ta.center),
                        Text(
                            message ??
                                (passcode
                                    ? defaultMessagePasscode
                                    : detaultMessage),
                            textAlign: Ta.center),
                      ],
                    ),
                  ),

                  // input
                  notifier.watch((state) => Row(
                        mainAxisAlignment: Maa.center,
                        spacing: 10,
                        children: (length > 6 || length < 1 ? 6 : length)
                            .generate((i) {
                          return PadInput(
                            state.values.length < (i + 1)
                                ? null
                                : state.values[i],
                            active: i == state.values.length,
                            obsecure: passcode,
                          );
                        }),
                      )),
                ],
              ).centered,
            ),

            // timer
            if (expired != null)
              notifier.watch((state) {
                return BlinkAnimate(
                    isAnimated: !state.isPaused,
                    duration: 500.ms,
                    child: Textr('Expired in ${state.expired} seconds',
                        style: config.font.red, padding: Ei.sym(v: 20)));
              }),

            // custom keypad
            Wrap(
              children: keys.generate((k, i) {
                double width = context.width / 3;

                final maps = {
                  'x': ConfigIcon.get(IconSet.eraser),
                  '<': ConfigIcon.get(IconSet.backspace)
                };
                final key = maps[k] ?? k;

                return Touch(
                  onTap: () {
                    bool isCompleted = notifier.onInput(k);
                    if (isCompleted) {
                      onCompleted?.call(PadController(context, notifier));
                    }
                  },
                  padding: Ei.all(20),
                  color: Colors.white,
                  border: Br.only(['b', i % 3 == 0 ? '' : 'l'], width: .5),
                  // color: i % 2 == 0
                  //     ? (context.isDarkMode ? '161616'.hex : 'f5f5f5'.hex)
                  //     : (context.isDarkMode ? '202020'.hex : Colors.white),
                  child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(),
                      width: width - (40 + .5),
                      height: 20,
                      child: key is String
                          ? Text(key, style: Gfont.fs16, textAlign: Ta.center)
                          : Icon(key as IconData)),
                );
              }),
            )
          ],
        ));
  }
}

/// A widget that represents a single input field in the pad, used for displaying each digit or character entered by the user.
/// It supports both obsecure (e.g., passcode) and visible input modes, and visually indicates the active input field.
class PadInput extends StatelessWidget {
  /// The value to display in the input field. If null, the field is empty.
  final String? value;

  /// Whether this input field is currently active (focused).
  final bool active;

  /// Whether to obsecure the input (e.g., for passcodes).
  final bool obsecure;

  const PadInput(this.value,
      {super.key, this.active = false, this.obsecure = false});

  @override
  Widget build(BuildContext context) {
    if (obsecure) {
      return AnimatedContainer(
        width: 20,
        height: 20,
        duration: 100.ms,
        margin: Ei.sym(h: 5, v: 20),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: context.isDarkMode
                ? darkAppbarColor.lighten(.05)
                : Colors.white,
            border:
                Br.all(color: Colors.green, width: value == null ? 0.5 : 5)),
      );
    }

    return Stack(
      alignment: Ad.center,
      children: [
        BlinkAnimate(
          isAnimated: value == null && active,
          child: Container(
            padding: Ei.sym(v: 20),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                border: Br.only(['b'],
                    color: value == null
                        ? Colors.black12.themeify
                        : Colors.black54.themeify,
                    width: 2)),
          ),
        ),
        AnimatedPositioned(
            duration: 300.ms,
            curve: value == null
                ? Curves.fastEaseInToSlowEaseOut
                : Curves.elasticOut,
            bottom: value == null ? -15 : 15,
            child: Text(value == null ? '.' : value!,
                textAlign: Ta.center, style: Gfont.bold))
      ],
    );
  }
}
