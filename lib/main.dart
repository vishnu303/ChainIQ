import 'package:chainiq/core/responsive/responsive_layout.dart';
import 'package:chainiq/core/theme/app_theme.dart';
import 'package:chainiq/core/theme/cubit/theme_cubit.dart';
import 'package:chainiq/features/home/presentation/bloc/cubit/navigation_cubit.dart';
import 'package:chainiq/features/home/presentation/pages/desktop_home_screen.dart';
import 'package:chainiq/features/home/presentation/pages/mobile_home_screen.dart';
import 'package:chainiq/features/home/presentation/pages/tablet_home_screen.dart';
import 'package:chainiq/features/market/presentation/bloc/market_bloc.dart';
import 'package:chainiq/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => serviceLocator<ThemeCubit>()),
        BlocProvider(create: (_) => serviceLocator<NavigationCubit>()),
        BlocProvider(create: (_) => serviceLocator<MarketBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: 'ChainIQ',
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
