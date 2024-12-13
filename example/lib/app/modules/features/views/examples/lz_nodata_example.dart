import 'package:flutter/material.dart';
import 'package:lazyui/lazyui.dart';

class NoDataView extends StatelessWidget {
  const NoDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LzNoData(
        message:
            'No data found, try to check your internet connection, or try again later.',
        onTap: () {
          // Handle tap-to-refresh action here.
          LzToast.show('Refreshing data...');
        },
      ),
    );
  }
}
