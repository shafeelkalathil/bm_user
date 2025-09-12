import 'package:flutter/material.dart';
import '../../constants/color_constants.dart';
import '../../utils/styles/text_style.dart';

class AppInputDecorationTheme {
  AppInputDecorationTheme._();

  static final lightInputDecorationTheme = InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    hintStyle: textSemiContent14.copyWith(color: primary.shade100),
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    focusColor: primary.shade500,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary.shade500, width: 2),
        borderRadius: BorderRadius.circular(30)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary.shade500, width: 2),
        borderRadius: BorderRadius.circular(30)),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffff5252), width: 2),
        borderRadius: BorderRadius.circular(30)),
    focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffff5252), width: 2),
        borderRadius: BorderRadius.circular(30)),
  );
}
