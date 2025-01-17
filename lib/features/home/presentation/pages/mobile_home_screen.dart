import 'package:chainiq/features/home/constants/home_constants.dart';
import 'package:chainiq/features/home/presentation/bloc/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: homePages[state.selectedIndex],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              backgroundColor: Theme.of(context).colorScheme.surface,
              elevation: 5,
              indicatorColor: Theme.of(context).colorScheme.primary,
              labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
                (states) {
                  if (states.contains(WidgetState.selected)) {
                    return TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    );
                  }
                  return TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  );
                },
              ),
            ),
            child: NavigationBar(
              selectedIndex: state.selectedIndex,
              onDestinationSelected: (index) {
                context.read<NavigationCubit>().navigateTo(index);
              },
              destinations: navigationDestinations.map((destination) {
                return NavigationDestination(
                  icon: destination.icon,
                  selectedIcon: destination.selectedIcon ?? destination.icon,
                  label: destination.label,
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
