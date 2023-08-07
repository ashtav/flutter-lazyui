part of page;

class CustomWidgets extends StatelessWidget {
  const CustomWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Custom Widgets'),
        ),
        body: const LzListView(
          children: [
            Text('Textml:'),
            Textml('<b color="fc1703">Text Bold Color</b> <i color="09f">Italic <b>blue bold</b> </i> <u><b>under</b>score</u> ')
          ],
        ));
  }
}
