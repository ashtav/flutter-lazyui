import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('No Data'),
      ),
      body: LzNoData(
        padding: Ei.sym(h: 50),
        message:
            '<b>No Data Found</b>\nTry to check your internet connection, or try again later.',
      ),
    );
  }
}
