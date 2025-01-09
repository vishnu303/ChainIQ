import 'package:chainiq/features/home/constants/home_constants.dart';
import 'package:flutter/material.dart';

class CustomNavigationRail extends StatelessWidget {
  final bool extended;
  final int selectedIndex;
  const CustomNavigationRail({
    super.key,
    this.extended = true,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: extended,
      selectedIndex: 0,
      groupAlignment: 0,
      elevation: 10,
      destinations: navigationDestinations.map((destination) {
        return NavigationRailDestination(
          icon: destination.icon,
          label: Text(destination.label),
        );
      }).toList(),
    );
  }
}
