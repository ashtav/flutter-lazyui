part of page;

class ExpandableListView extends StatelessWidget {
  const ExpandableListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Expandable List')),
        body: LzListView(
          children: [
            LzAccordion(
              children: [
                LzAccordionContent(
                  title: 'What is Lorem Ipsum?',
                  child: Textml(
                      '<b>Lorem Ipsum</b> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500... ${Faker.words(25)}'),
                ),
                const LzAccordionContent(
                  title: 'Why do we use it?',
                  child: Text(
                      'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
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
            )
          ],
        ));
  }
}
