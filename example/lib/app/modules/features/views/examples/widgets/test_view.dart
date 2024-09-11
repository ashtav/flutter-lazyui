import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['name', 'address']);
    logg('test view screen has running...');

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(title: const Text('Test View'), actions: [
          Press(Ti.toggleLeft, () {
            forms.at(0).value(Faker.name());
          }),
          Press(Ti.forbid, () {
            // forms.at(0).enable(forms.at(0).attr.disabled);
            // forms.at(1).enable(forms.at(1).attr.disabled);
          }),
        ]),
        body: Center(
          child: TextButton(
              onPressed: () {
                context.dialog(const MyContent(), backBlur: true);
              },
              child: const Text('Show Dialog')),
        ),
        // body: LzListView(gap: 10, children: [
        //   const Text('Input'),
        //   LzForm.input(hint: 'Type your address', model: forms.at(1), disabled: true),
        //   25.height,
        //   const Text('Input 2'),
        //   LzForm.input2(hint: 'Type your name', model: forms.at(0), disabled: true)
        // ]),
      ),
    );
  }
}

class Press extends StatelessWidget {
  final Function() onTap;
  final IconData icon;
  const Press(this.icon, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onTap, icon: Icon(icon));
  }
}

class MyContent extends StatelessWidget {
  const MyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return LzDialog(
      scrollable: true,
      maxHeight: context.height * .8,

      // header
      header: LzDialog.title('Custom Dialog', icon: Ti.square),

      // footer
      footer: Column(
        children: [
          LzDialog.button('Confirm Dialog', style: Gfont.bold, icon: Ti.click),
          LzDialog.button('Close', outline: true),
        ],
      ).gap(10),
      // end of footer

      child: Column(
        children: [
          Text(Faker.words(15)).padding(all: 20),
          ...10.generate((i) {
            return Container(
              padding: Ei.all(20),
              decoration: BoxDecoration(border: Br.only(['t'])),
              child: Row(
                children: [Text(Faker.address()).lz.flexible(), const Icon(Ti.chevronRight, color: Colors.black45)],
              ).between.gap(20),
            );
          })
        ],
      ),
    );
  }
}
