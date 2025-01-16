import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

import '../widgets/example_label_widget.dart';

class AccordionView extends StatelessWidget {
  const AccordionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accordion'),
      ),
      body: ListView(
        padding: Ei.all(20),
        children: [
          const ExampleLabel(
            description:
                'LzAccordion is a versatile widget that allows you to create collapsible sections, ideal for organizing content in a structured and user-friendly way.',
          ),
          LzAccordion(
            children: [
              LzAccordionContent(
                  title: 'What is Flutter?', child: Text(Faker.words(20))),
              LzAccordionContent(
                  title: 'How to become flutter developer?',
                  child: Text(Faker.words(20))),
            ],
          )
        ],
      ),
    );
  }
}
