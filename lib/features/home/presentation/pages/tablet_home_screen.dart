import 'package:chainiq/features/home/constants/home_constants.dart';
import 'package:chainiq/features/home/presentation/bloc/cubit/navigation_cubit.dart';
import 'package:chainiq/features/home/presentation/widgets/custom_navigatoinrail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
            body: Row(
          children: [
            CustomNavigationRail(
              extended: false,
              selectedIndex: state.selectedIndex,
            ),
            Expanded(
              child: homePages[state.selectedIndex],
            )
          ],
        ));
      },
    );
  }
}
