import 'package:chainiq/core/responsive/responsive_layout.dart';
import 'package:chainiq/core/theme/app_pallete.dart';
import 'package:chainiq/core/theme/app_theme.dart';
import 'package:chainiq/core/theme/cubit/theme_cubit.dart';
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
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            home: const ResponsiveLayout(
              mobile: MobileHomeScreen(),
              tablet: TabletHomeScreen(),
              desktop: DesktopHomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
