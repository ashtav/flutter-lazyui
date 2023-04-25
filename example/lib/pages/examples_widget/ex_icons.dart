part of example;

class ExIcons extends StatelessWidget {
  const ExIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Icons'),
        actions: [
          const Icon(Ti.settings).onPressed(() {}),
        ],
      ),
      body: LzListView(
        children: [
          const Text('Line Awesome Icons (ex: La.user)'),
          Intrinsic(
              children: List.generate(5, (i) {
            return Expanded(
              child: Iconr(
                [La.user, La.wallet, La.mapMarked, La.edit, La.trash][i],
                padding: Ei.all(10),
              ),
            );
          })),
          const Text('Tabler Icons (ex: Ti.user)').margin(t: 25),
          Intrinsic(
              children: List.generate(5, (i) {
            return Expanded(
              child: Iconr(
                [Ti.user, Ti.wallet, Ti.map2, Ti.edit, Ti.trash][i],
                padding: Ei.all(10),
              ),
            );
          })),
        ],
      ),
    );
  }
}
