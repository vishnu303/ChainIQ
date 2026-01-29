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
          appBar: AppBar(
            title: Text(navigationDestinations[state.selectedIndex].label),
            forceMaterialTransparency: true,
          ),
          body: homePages[state.selectedIndex],
          bottomNavigationBar: NavigationBar(
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
        );
      },
    );
  }
}
