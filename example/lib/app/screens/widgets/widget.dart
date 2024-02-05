import 'package:flutter/material.dart';

class WidgetView extends StatelessWidget {
  final String title;
  final Widget child;
  const WidgetView({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: child,
    );
  }
}
