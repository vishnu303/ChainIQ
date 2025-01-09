import 'package:chainiq/core/constants/constants.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < mobileSize;
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mobileSize &&
      MediaQuery.sizeOf(context).width < desktopSize;
  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= desktopSize;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    if (size.width >= desktopSize) {
      return desktop;
    } else if (size.width >= mobileSize && size.width <= desktopSize) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
