import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TextFieldView extends StatelessWidget {
  const TextFieldView({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      // tap to close keyboard
      child: Scaffold(
        body: Column(
          children: [
            const Textml(
                    "Create stylish textfield with a single line of code. <p color=\"09f\">LzTextField(hint: 'Enter your name', border: Br.all())</p>")
                .margin(b: 35),
            Center(
              child: LzTextField(
                  hint: 'Enter your name',
                  border: Br.all(),
                  prefixIcon: const Icon(Ti.user)),
            ),
          ],
        ).center.padding(all: 35),
      ),
    );
  }
}
