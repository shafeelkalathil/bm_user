import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';

class AppElevatedButtonTheme {
  AppElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: primary.shade300,
      backgroundColor: primary.shade500,
      disabledForegroundColor: primary.shade300,
      disabledBackgroundColor: primary.shade300,
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  );
}
