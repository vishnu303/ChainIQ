import 'package:chainiq/features/home/constants/home_constants.dart';
import 'package:flutter/material.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Mobile'),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: navigationDestinations,
      ),
    );
  }
}
