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
          message: 'Opps! No Data Found.\nTap refresh or please try again later',
          onTap: () {
            // do something...

            try {
              
            } catch (e, s) {
              Utils.errorCatcher(e, s);
            }
          },
        ));
  }
}