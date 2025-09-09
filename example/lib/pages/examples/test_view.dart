import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lazyui/lazyui.dart';

class Notifier extends ChangeNotifier {
  List<FormManager> cards = [];

  void addCard() {
    final forms = LzForm.make(['name', 'gender', 'province']);
    cards.insert(0, forms);
    notifyListeners();
  }

  void remove(int index) {
    cards.removeAt(index);
    notifyListeners();
  }

  void onSubmit() {
    for (var e in cards) {
      logg('data: ${e.value}');
      logg('extra: ${e.extra('province')}');
    }
  }
}

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final notifier = Notifier();

    List<Map<String, dynamic>> province = [
      {
        'label': 'Bali',
        'value': 1,
      },
      {
        'label': 'Jakarta',
        'value': 2,
      },
      {
        'label': 'Yogyakarta',
        'value': 3,
      },
    ];

    return Unfocuser(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Labs'),
          actions: [
            LzThemeAction(),
            IconButton(
                onPressed: () {
                  notifier.addCard();
                },
                icon: Icon(Hi.plusSign))
          ],
        ),
        body: LzListView(
          autoCache: true,
          gap: 25,
          children: [
            LzForm.input(hint: 'Type something...', suffixIcon: Hi.book02),
            notifier.watch((state) {
              return Column(children: state.cards.generate((form, i) {
                return LzCard(
                  key: ValueKey(form
                      .hashCode), // Prevents rebuild issues if we use insert/remove
                  gap: 25,
                  children: [
                    Row(
                      children: [
                        Text('Card ${i + 1}'),
                        Touch(
                            onTap: () {
                              notifier.remove(i);
                            },
                            child: Icon(Hi.delete01))
                      ],
                    ).between,
                    LzForm.input(
                        label: 'Name *',
                        hint: 'Enter your name',
                        model: form.key('name')),
                    LzForm.radio(
                        label: 'Gender *',
                        options: ['Male', 'Female', 'Other'],
                        model: form.key('gender')),
                    LzForm.select(
                        label: 'Province *',
                        hint: 'Select your province',
                        options:
                            province.map((e) => e['label'].toString()).toList(),
                        values:
                            province.map((e) => e['value'].toString()).toList(),
                        model: form.key('province')),
                  ],
                );
              })).start.gap(25);
            })
          ],
        ),
        bottomNavigationBar: LzButton(
          text: 'Submit',
          onTap: () {
            notifier.onSubmit();
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
