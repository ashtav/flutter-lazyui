part of page;

class RefreshtorView extends StatelessWidget {
  const RefreshtorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Refreshtor'),
        ),
        body: Refreshtor(
          onRefresh: () async {
            LzToast.show('Refreshing...', position: Position.center, icon: La.infoCircle);
          },
          type: RefrehtorType.curve,
          child: LzListView(
            children: [Text(Faker.words(35, 5))],
          ),
        ));
  }
}
