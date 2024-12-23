import 'package:flutter/material.dart';

class LzTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final void Function(String)? onChanged;

  const LzTextField({super.key, this.controller, this.hint, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
      ),
      onChanged: onChanged,
    );
  }
}
