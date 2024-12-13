// ignore_for_file: public_member_api_docs, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';
import 'package:lazyui/src/widgets/forms/lzform/src/notifiers/form_notifier.dart';

class Input2 extends StatefulWidget {
  final String? label;
  final String? hint;
  final FormModel? model;
  final bool? disabled;

  const Input2({super.key, this.label, this.hint, this.model, this.disabled});

  @override
  State<Input2> createState() => _Input2State();
}

class _Input2State extends State<Input2> {
  late FormNotifier notifier;

  @override
  void dispose() {
    notifier.dispose();
    super.dispose();
  }

  @override
  void initState() {
    notifier = widget.model?.notifier ?? FormNotifier();

    // set model attribute
    notifier.controller = widget.model?.controller ?? TextEditingController();
    notifier.disabled = (widget.disabled ?? false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        notifier.watch((state) {
          bool disabled = state.disabled;

          // background color
          Color backgroundColor =
              disabled ? const Color.fromARGB(31, 204, 204, 204) : Colors.white;

          return LzTextField(
            hint: widget.hint,
            enabled: !disabled,
            controller: state.controller,
            border: Br.all(),
            backgroundColor: backgroundColor,
            onChange: (value) {
              logg(state.controller.text);
            },
          );
        })
      ],
    );
  }
}
