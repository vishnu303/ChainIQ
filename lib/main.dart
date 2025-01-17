import 'package:chainiq/core/responsive/responsive_layout.dart';
import 'package:chainiq/features/home/presentation/bloc/cubit/navigation_cubit.dart';
import 'package:chainiq/features/home/presentation/pages/desktop_home_screen.dart';
import 'package:chainiq/features/home/presentation/pages/mobile_home_screen.dart';
import 'package:chainiq/features/home/presentation/pages/tablet_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavigationCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ResponsiveLayout(
          mobile: MobileHomeScreen(),
          tablet: TabletHomeScreen(),
          desktop: DesktopHomeScreen(),
        ),
      ),
    );
  }
}
