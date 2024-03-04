import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AccordionView extends StatelessWidget {
  const AccordionView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AccordionController();

    return Scaffold(
        appBar: AppBar(title: const Text('Accordion'), actions: [
          const Icon(Ti.layoutNavbarCollapse).onPressed(() {
            controller.collapse();
            LzToast.show('All accordions collapsed!!',
                placement: ToastPlacement.bottom);
          })
        ]),
        body: LzListView(
          children: [
            LzAccordion(
              border: Br.all(width: 2),
              initValue: 0,
              controller: controller,
              children: [
                const LzAccordionContent(
                  title: 'What is Accordion?',
                  child: Textml(
                      'An <b>Accordion</b> in UI/UX is a collapsible panel for showing and hiding content, ideal for organizing and optimizing space in an interface. It enhances usability by allowing users to expand sections for more details and collapse them to reduce clutter.'),
                ),
                LzAccordionContent(
                  suffix: Text('Expand', style: Gfont.muted),
                  title: 'Why do we use it?',
                  child: const Text(
                      'Accordions streamline content presentation, enhancing user engagement by minimizing distractions and focusing on layout readability.'),
                )
              ],
            ).margin(b: 15),
            LzAccordion(
              children: [
                LzAccordionContent(
                  title: 'Expand And Focus',
                  child: Text(Faker.words(35, 3)),
                ),
                LzAccordionContent(
                  title: 'List 2',
                  child: Text(Faker.words(35)),
                )
              ],
            ).margin(b: 15),
            LzAccordion(
              backgroundColor: '444'.hex,
              textColor: Colors.white,
              border: Br.none,
              children: [
                LzAccordionContent(
                  title: 'Dark Mode',
                  child: Text(Faker.words(35, 3),
                      style: Gfont.color(Colors.white70)),
                ),
              ],
            )
          ],
        ));
  }
}
