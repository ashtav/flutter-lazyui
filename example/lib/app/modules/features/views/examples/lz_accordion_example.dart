import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class AccordionView extends StatelessWidget {
  const AccordionView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AccordionController();
    final font = Gfont.style(context);

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
              initValues: const [0],
              chunk: const [2, 3],
              chunkSpace: 7,
              controller: controller,
              children: [
                const LzAccordionContent(
                  title: 'What is Accordion?',
                  child: Textml(
                      'An <b>Accordion</b> in UI/UX is a collapsible panel for showing and hiding content, ideal for organizing and optimizing space in an interface. It enhances usability by allowing users to expand sections for more details and collapse them to reduce clutter.'),
                ),
                LzAccordionContent(
                  suffix: Text('Expand', style: font.muted),
                  title: 'Why do we use it?',
                  child: const Text(
                      'Accordions streamline content presentation, enhancing user engagement by minimizing distractions and focusing on layout readability.'),
                ),
                LzAccordionContent(
                  title: 'Separate List',
                  child: Text(Faker.words(35, 3)),
                ),
                LzAccordionContent(
                  title: 'Lorem Ipsum Dolor',
                  child: Text(Faker.words(35)),
                ),
                LzAccordionContent(
                  title: 'Sit Amet Consectetur',
                  child: Text(Faker.words(35, 3)),
                ),
              ],
            ).margin(b: 15),
            // LzAccordion(
            //   onExpand: (i) {
            //     controller.collapse();
            //   },
            //   children: [
            //     LzAccordionContent(
            //       title: 'Expand And Focus',
            //       child: Text(Faker.words(35, 3)),
            //     ),
            //     LzAccordionContent(
            //       title: 'List 2',
            //       child: Text(Faker.words(35)),
            //     )
            //   ],
            // ).margin(b: 15),
          ],
        ));
  }
}
