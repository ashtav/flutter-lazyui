import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class RefreshtorView extends StatelessWidget {
  const RefreshtorView({super.key});

  @override
  Widget build(BuildContext context) {
    Future getData() async {
      await Future.delayed(1.s);
      LzToast.show('Refreshed!',
          placement: ToastPlacement.center, icon: La.checkCircle);
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Refreshtor'),
        ),
        body: Refreshtor(
          onRefresh: () async {
            await getData();
          },
          type: RefrehtorType.curve,
          child: LzListView(
            children: [
              Textml(
                  '<b>Please pull down to refresh.</b> ${Faker.words(15)}\n'),
              Text(Faker.words(35, 5))
            ],
          ),
        ));
  }
}
