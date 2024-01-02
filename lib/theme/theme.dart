import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  focusColor: Colors.black,
  cardColor: const Color(0xFFF5F6F9),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: Colors.white),
  dividerColor: Colors.white54,
  scaffoldBackgroundColor: Colors.white,
  fontFamily: "Chillax",
  visualDensity: VisualDensity.adaptivePlatformDensity,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
      .copyWith(secondary: Colors.black)
      .copyWith(background: const Color(0xFEFEFEFE)),
);
