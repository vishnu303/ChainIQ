import 'package:chainiq/features/home/presentation/pages/demo_page.dart';
import 'package:chainiq/features/market/presentation/pages/market_screen.dart';
import 'package:chainiq/features/news/presentation/screens/news_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Navigation
final List<NavigationDestination> navigationDestinations = const [
  NavigationDestination(
    icon: Icon(FontAwesomeIcons.chartLine),
    label: 'Market',
  ),
  NavigationDestination(
    icon: Icon(FontAwesomeIcons.newspaper),
    label: 'News',
  ),
  NavigationDestination(
    icon: Icon(FontAwesomeIcons.wallet),
    label: 'Portfolio',
  ),
  NavigationDestination(
    icon: Icon(Icons.settings),
    label: 'Settings',
  ),
];

// homescreen pages
List homePages = [
  MarketScreen(),
  NewsScreen(),
  DemoPage(title: 'Portfolio'),
  DemoPage(title: 'Settings'),
];
