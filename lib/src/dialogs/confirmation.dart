import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../config/config.dart';

class LzDialog {
  Future confirm(BuildContext context, {String? title, String? message, Function()? confirmed}) async {
    Widget blurWrapper(Widget child) => BackdropFilter(filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7), child: child);

    showDialog(
        context: context,
        builder: (_) => blurWrapper(ConfirmDialogWidget(
              title: title,
              message: message,
            ))).then((value) {
      if (value == true) {
        confirmed?.call();
      }
    });
  }
}

class ConfirmDialogWidget extends StatelessWidget {
  final String? title;
  final String? message;
  const ConfirmDialogWidget({super.key, this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Material(
              color: config.backgroundColor,
              child: SizedBox(
                width: 300,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      child: Column(
                        spacing: 10,
                        children: [
                          Text(title ?? 'Delete Data', style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(message ?? 'Are you sure want to delete this data?', textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Br.only(['t'])),
                      child: IntrinsicHeight(
                        child: Row(
                          children: List.generate(2, (i) {
                            return Expanded(
                              child: Touch(
                                onTap: () {
                                  context.lz.pop(i == 1);
                                },
                                borderRadius: Br.zero,
                                child: Container(
                                    decoration: BoxDecoration(border: Br.only(['l'], except: i == 0)),
                                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                    child: Text(['Cancel', 'Confirm'][i], textAlign: TextAlign.center)),
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
          )
        ],
      ),
    );
  }
}
