import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lazyui/lazyui.dart';

class Notifier extends ChangeNotifier {
  int active = 0;
  bool show = false;

  void toggle() {
    active++;

    if (active >= 3) {
      active = 0;
    }

    show = !show;
    notifyListeners();
  }

  double opacity = 1;

  void setValue(double value) {
    opacity = value;
    notifyListeners();
  }

  final forms = LzForm.make(['name', 'email', 'gender', 'image']);
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();
    final forms = notifier.forms;

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Labs'),
          actions: [
            LzThemeAction(),
            IconButton(onPressed: () {}, icon: Icon(Hi.gift))
          ],
        ),
        body: LzListView(
          autoCache: true,
          gap: 25,
          children: [
            LzCard(
              style: LzCardStyle(stacked: true),
              onTap: () {
                LzPicker.date(context);
              },
              children: [Text(Faker.name()), Text(Faker.email())],
            ),
            LzTextField(
              hint: 'Lorem ipsum dolor sit',
              border: Ltf.none,
            ),
            LzForm.input(
                label: 'Select Image',
                hint: 'Please select your image',
                model: forms.key('image'),
                suffixIcon: Hi.image01,
                onTap: () {
                  Pickers.image(then: (file) {
                    forms.set('image', file?.path);
                  });
                })
          ],
        ),
        bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: () {
            forms.set('name', Faker.words());
            // final form = forms.validate(required: [
            //   '*'
            // ], match: [
            //   'new_pass:confirm_pass'
            // ], min: [
            //   'old_pass:5'
            // ], message: {
            //   'old_pass': 'Old pass please!',
            //   'old_pass:min': 'Wait! min',
            //   'new_pass': 'New pass please!',
            //   'confirm_pass': 'Ey! confirm your pass!',
            //   'confirm_pass:match': 'Not same!'
            // });
          },
        ).margin(blr: 20).lz.shadowed(context),
      ),
    );
  }
}

class Pickers {
  static void image({Function(File?)? then}) async {
    final ImagePicker picker = ImagePicker();

    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      final File image = File(file.path);
      then?.call(image);
    } else {
      then?.call(null);
    }
  }
}
