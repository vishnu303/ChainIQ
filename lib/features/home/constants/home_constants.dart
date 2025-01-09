// Navigation

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
];
