import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  final String title;
  const DemoPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
