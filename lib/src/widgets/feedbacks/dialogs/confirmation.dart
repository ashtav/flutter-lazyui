import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/theme/color.dart';

/// A utility class for displaying a confirmation dialog with customizable
/// title, message, and button texts.
///
/// The [show] method presents a dialog with an optional blurred background,
/// and executes the [onConfirm] callback if the user confirms the action.
///
/// Example usage:
/// ```dart
/// LzConfirm.show(
///   context,
///   title: 'Delete Item',
///   message: 'Are you sure you want to delete this item?',
///   confirmText: 'Delete',
///   cancelText: 'Cancel',
///   onConfirm: () {
///     // Handle confirmation
///   },
/// );
/// ```
///
/// Parameters:
/// - [context]: The build context to display the dialog.
/// - [title]: Optional title for the dialog.
/// - [message]: Optional message content for the dialog.
/// - [confirmText]: Optional text for the confirm button.
/// - [cancelText]: Optional text for the cancel button.
/// - [onConfirm]: Optional callback executed when the user confirms.
class LzConfirm {
  static void show(BuildContext context,
      {String? title,
      String? message,
      String? confirmText,
      String? cancelText,
      void Function()? onConfirm}) async {
    Widget blurWrapper(Widget child) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7), child: child);

    showDialog(
        context: context,
        builder: (_) => blurWrapper(_ConfirmDialogWidget(
            title: title,
            message: message,
            confirmText: confirmText,
            cancelText: cancelText))).then((value) {
      if (value == true) {
        onConfirm?.call();
      }
    });
  }
}

/// A widget that animates its child in and out using both opacity and scale transitions.
/// When [visible] is true, the [child] is shown with a fade and scale-in animation.
/// When [visible] is false, the [child] is hidden with a fade and scale-out animation.
class _Switcher extends StatelessWidget {
  /// Whether the child is visible or not.
  final bool visible;

  /// The widget to display and animate.
  final Widget child;

  const _Switcher({this.visible = false, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: 150.ms,
      opacity: visible ? 1 : 0,
      child: AnimatedSwitcher(
        switchInCurve: Curves.linearToEaseOut,
        switchOutCurve: Curves.easeOutBack,
        duration: 150.ms,
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(scale: animation, child: child),
        child: visible ? child : const None(),
      ),
    );
  }
}

/// The dialog widget for confirmation, allowing customization of title, message, and button texts.
class _ConfirmDialogWidget extends StatefulWidget {
  /// The title displayed at the top of the dialog.
  final String? title;

  /// The message content displayed in the dialog.
  final String? message;

  /// The text for the confirm action button.
  final String? confirmText;

  /// The text for the cancel action button.
  final String? cancelText;

  const _ConfirmDialogWidget(
      {this.title, this.message, this.confirmText, this.cancelText});

  @override
  State<_ConfirmDialogWidget> createState() => __ConfirmDialogWidgetState();
}

class __ConfirmDialogWidgetState extends State<_ConfirmDialogWidget> {
  bool visible = false;

  @override
  void initState() {
    Timer(30.ms, () {
      setState(() {
        visible = true;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color background =
        context.isDarkMode ? darkAppbarColor.lighten(.02) : Colors.white;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: _Switcher(
              visible: visible,
              child: Material(
                color: background,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        child: Column(
                          spacing: 10,
                          children: [
                            Text(widget.title ?? 'Delete Data',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(
                                widget.message ??
                                    'Are you sure want to delete this data?',
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(border: Br.only(['t'])),
                        child: IntrinsicHeight(
                          child: Row(
                            children: [
                              widget.cancelText ?? 'Cancel',
                              widget.confirmText ?? 'Confirm'
                            ].generate((label, i) {
                              return Expanded(
                                child: Touch(
                                  onTap: () => context.lz.pop(i == 1),
                                  radius: Br.zero,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Br.only(['l'], except: i == 0)),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 10),
                                      child: Text(label,
                                          textAlign: TextAlign.center)),
                                ),
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class _ConfirmDialogWidget extends StatelessWidget {
//   final String? title;
//   final String? message;
//   const _ConfirmDialogWidget({this.title, this.message});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             child: _Switcher(
//               visible: true,
//               child: Material(
//                 color: config.backgroundColor,
//                 child: SizedBox(
//                   width: 300,
//                   child: Column(
//                     children: [
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//                         child: Column(
//                           spacing: 10,
//                           children: [
//                             Text(title ?? 'Delete Data', style: TextStyle(fontWeight: FontWeight.bold)),
//                             Text(message ?? 'Are you sure want to delete this data?', textAlign: TextAlign.center),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         decoration: BoxDecoration(border: Br.only(['t'])),
//                         child: IntrinsicHeight(
//                           child: Row(
//                             children: List.generate(2, (i) {
//                               return Expanded(
//                                 child: Touch(
//                                   onTap: () {
//                                     context.lz.pop(i == 1);
//                                   },
//                                   borderRadius: Br.zero,
//                                   child: Container(
//                                       decoration: BoxDecoration(border: Br.only(['l'], except: i == 0)),
//                                       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//                                       child: Text(['Cancel', 'Confirm'][i], textAlign: TextAlign.center)),
//                                 ),
//                               );
//                             }),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
