import 'package:chainiq/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppPallete.seedColor,
  ),
  useMaterial3: true,
);
var darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppPallete.seedColor,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);
