part of page;

class NoDataView extends StatelessWidget {
  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('No Data'),
        ),
        body: LzNoData(
          message: 'Opps! There is no data to show',
          onTap: () {
            // do something...
          },
        ));
  }
}
