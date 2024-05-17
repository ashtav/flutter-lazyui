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
                LzModal.show(context, title: 'Select Menu', options: [
                  ModalOption(label: 'Profile', widget: Textr('Your profile!', padding: Ei.all(35)), icon: Ti.user),
                  ModalOption(label: 'Birth Date', widget: LzDatePicker.widget(format: 'd/mmm/y'), icon: Ti.calendarEvent),
                  ModalOption(
                      label: 'Long Content',
                      widget: Column(
                        children: [
                          Textr(
                            Faker.words(25, 10),
                            padding: Ei.all(20),
                          )
                        ],
                      ), icon: Ti.news),
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
  List<ModalOption> actives = [];
  ModalOption? get option => actives.isEmpty ? null : actives.last;

  void action(ModalOption data) {
    actives.add(data);
    notifyListeners();
  }

  void onBack() {
    actives.removeLast();
    notifyListeners();
  }
}

class ModalOption {
  final String label;
  final Widget? widget;
  final IconData? icon;

  ModalOption({required this.label, this.widget, this.icon});
}

class LzModal extends StatelessWidget {
  final String? title;
  final List<ModalOption> options;
  final MainAxisAlignment? align;
  final double? maxHeight;
  const LzModal({super.key, this.title, this.options = const [], this.align, this.maxHeight});

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
              String? label = isRoot ? null : state.actives.last.label;

              return Row(
                children: [
                  Touch(
                    onTap: isRoot ? null : () => state.onBack(),
                    hoverable: !isRoot,
                    child: Textr(label ?? (title ?? ''), icon: isRoot ? null : Ti.arrowLeft, padding: Ei.sym(v: 20), style: font.white),
                  ),
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
                      constraints: BoxConstraints(maxHeight: maxHeight ?? context.height * .5),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: Br.radius(7)),
                      child: SingleChildScrollView(
                        physics: BounceScroll(),
                        child: state.option != null
                            ? state.option!.widget
                            : Column(
                                children: options.generate((option, i) {
                                  return Touch(
                                    onTap: () {
                                      if (option.widget != null) {
                                        state.action(option);
                                      }
                                    },
                                    hoverable: true,
                                    child: Container(
                                      padding: Ei.all(20),
                                      decoration: BoxDecoration(border: Br.only(['t'], except: i == 0)),
                                      child: Row(
                                        mainAxisAlignment: align ?? Maa.spaceBetween,
                                        children: [
                                          Text(
                                            option.label,
                                            textAlign: Ta.center,
                                          ),
                                          Icon(
                                            option.icon,
                                            color: Colors.black45,
                                          ).lz.hide(option.icon == null)
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ).min,
                      ));
                }),
              ],
            ),
          ],
        ).center,
      ),
    );
  }

  static show(BuildContext context,
      {String? title, List<ModalOption> options = const [], MainAxisAlignment? align, double? maxHeight}) {
    context.dialog(LzModal(title: title, options: options, align: align, maxHeight: maxHeight), backBlur: true);
  }
}
