import 'package:example/app/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    final forms = LzForm.make(['name']);

    forms.fill({'name': 'John Doe'});

    List<String> labels = ['Text A', 'Text B', 'Text C'];
    final font = context.gfont;

    return Wrapper(
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Test View'),
            actions: [Ti.swipe, Ti.photo].iconButton((i) {
              if (i == 0) {
                LzModal.show(context, options: [
                  ModalOption(label: 'Profile', widget: Textr('Your profile!', padding: Ei.all(35))),
                  ModalOption(label: 'Birth Date', widget: LzDatePicker.widget()),
                ]);
              } else {
                Pickers.show(context);
              }
            })),
        body: LzListView(
          gap: 10,
          children: [
            Text('Hello World!', style: font.bold),
            Text(Faker.words(15), style: font.muted),
            const SizedBox(height: 15),
            LzForm.input(hint: 'Enter your name', model: forms['name']),
            LzDropItem(
              options: DropOption.list(['Details', 'Edit', 'Delete', 'Archive']),
              style: DropStyle(separators: [3]),
              builder: (child) => Container(padding: Ei.all(20), width: context.width, child: child),
              child: LzCard(
                stacked: true,
                stackAlign: StackAlign.top,
                children: [Text(Faker.words(25))],
              ),
            ),
            Intrinsic(
                gap: 3,
                children: labels.generate((item, i) {
                  return InkTouch(
                    onTap: () {},
                    border: Br.all(),
                    radius: Br.radius(5),
                    padding: Ei.sym(v: 13, h: 20),
                    child: Text(item),
                  );
                })),
          ],
        ),
      ),
    );
  }
}

class LzModalNotifier extends ChangeNotifier {
  String? label;
  Widget? widget;
  List<ModalOption> actives = [];

  void action(ModalOption data) {
    actives.add(data);

    label = data.label;
    widget = data.widget;

    notifyListeners();
  }

  void onBack(){
    actives.removeLast();
    notifyListeners();
  }
}

class ModalOption {
  final String label;
  final Widget? widget;

  ModalOption({required this.label, this.widget});
}

class LzModal extends StatelessWidget {
  final List<ModalOption> options;
  const LzModal({super.key, this.options = const []});

  @override
  Widget build(BuildContext context) {
    double width = 290;
    final notifier = LzModalNotifier();
    final font = context.gfont;

    return Center(
      child: SizedBox(
        width: width,
        child: Column(
          children: [
            notifier.watch((state) {
              bool isRoot = state.actives.isEmpty;
              String label = state.actives.last.label;

              return Row(
              children: [
                Textr('Back', icon: Ti.arrowLeft, padding: Ei.sym(v: 20), style: font.white),
              ],
            ).between;
            }),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SlideDown(
                  child: Container(
                      decoration: BoxDecoration(borderRadius: Br.radius(7), color: Colors.white70),
                      width: width - 20,
                      height: 20),
                ),
                notifier.watch((state) {
                  return Container(
                    width: width,
                    margin: Ei.only(b: 7),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: Br.radius(7)),
                    child: state.label != null
                        ? state.widget
                        : Column(
                            children: options.generate((option, i) {
                              return Touch(
                                onTap: () {
                                  if (option.widget != null) {
                                    state.action(option);
                                  }
                                },
                                hoverable: true,
                                child: Textr(
                                  option.label,
                                  padding: Ei.all(20),
                                  border: Br.only(['t'], except: i == 0),
                                  width: context.width,
                                  textAlign: Ta.center,
                                ),
                              );
                            }),
                          ),
                  );
                }),
      
                // Poslign(alignment: Alignment.topLeft, child: )
              ],
            ),
          ],
        ).center,
      ),
    );
  }

  static show(BuildContext context, {List<ModalOption> options = const []}) {
    context.dialog(LzModal(options: options), backBlur: true);
  }
}
