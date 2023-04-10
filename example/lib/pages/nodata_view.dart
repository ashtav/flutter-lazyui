import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('No Data'),
          centerTitle: true,
        ),
        body: ListView(
          physics: BounceScroll(),
          padding: Ei.all(20),
          children: [
            LzBox(
              padding: Ei.all(0),
              radius: Br.radius(15),
              child: Col(
                children: List.generate(
                    3,
                    (i) => InkW(
                          onTap: () {},
                          padding: Ei.all(20),
                          child: Row(
                            children: [
                              Text('Test $i'),
                            ],
                          ),
                        )),
              ),
            )
          ],
        ));

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('No Data'),
    //     centerTitle: true,
    //   ),
    //   body: const NoData(
    //     message: 'Opps! No data found',
    //   ),
    // );
  }
}
