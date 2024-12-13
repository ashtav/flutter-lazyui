import 'package:flutter/material.dart';

class Utility extends StatelessWidget {
  final String title;
  final Widget child;
  const Utility({super.key, required this.title, required this.child});

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
