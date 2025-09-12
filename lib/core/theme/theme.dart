import 'package:flutter/material.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/input_decoration_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: Colors.white,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: AppInputDecorationTheme.lightInputDecorationTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonTheme,
  );
}
