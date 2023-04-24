part of page;

class WidgetsView extends StatelessWidget {
  const WidgetsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Widgets'),
      ),
      body: const LzListView(
        children: [
          // LzBox(
          //   margin: Ei.only(b: 15),
          //   children: const [Text('LzBox')],
          // ),
          // LzBox.clean(children: [const Text('LzBox with default padding is 0')]),
          // const TextDivider(Text('Customize Widget')),
          // const Text('Hello World').lzStyle(border: Br.all(), padding: Ei.all(20), color: Colors.white, radius: Br.radius(5)),
        ],
      ),
    );
  }
}
