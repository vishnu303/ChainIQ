import 'package:chainiq/features/home/presentation/widgets/custom_navigatoinrail.dart';
import 'package:flutter/material.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      children: [
        CustomNavigationRail(
          selectedIndex: 0,
          extended: false,
        ),
        Expanded(child: Container())
      ],
    ));
  }
}
