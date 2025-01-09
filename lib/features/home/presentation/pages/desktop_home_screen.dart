import 'package:chainiq/features/home/presentation/widgets/custom_navigatoinrail.dart';
import 'package:flutter/material.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        children: [
          CustomNavigationRail(
            selectedIndex: 0,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
          ))
        ],
      )),
    );
  }
}
