import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chainiq/features/home/constants/home_constants.dart';
import 'package:chainiq/features/home/presentation/bloc/cubit/navigation_cubit.dart';

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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: NavigationRail(
        extended: extended,
        selectedIndex: selectedIndex,
        groupAlignment: -1,
        elevation: 10,
        backgroundColor: Theme.of(context).colorScheme.surface,
        onDestinationSelected: (index) {
          context.read<NavigationCubit>().navigateTo(index);
        },
        leading: extended
            ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Menu",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )
            : const SizedBox.shrink(),
        selectedLabelTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onSurface,
        ),
        destinations: navigationDestinations.map((destination) {
          return NavigationRailDestination(
            icon: destination.icon,
            selectedIcon: destination.selectedIcon ?? destination.icon,
            label: Tooltip(
              message: destination.label,
              child: Text(destination.label),
            ),
          );
        }).toList(),
      ),
    );
  }
}
