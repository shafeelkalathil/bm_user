import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class CustomToast {

  static void showSuccess(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        icon: const Icon(
          Icons.check_circle,
          color: Color(0xff00E676),
          size: 120,
        ),
        backgroundColor: const Color(0xff00E676),
      ),
      displayDuration: const Duration(seconds: 3),
    );
  }

  static void showError(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        icon: const Icon(
          Icons.error_outline,
          color: Color(0xffff5252),
          size: 120,
        ),
        backgroundColor: const Color(0xffff5252),
      ),
      displayDuration: const Duration(seconds: 4),
    );
  }

  static void showInfo(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(
        message: message,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        icon: const Icon(
          Icons.info_outline,
          color: Color(0xff2196F3),
          size: 120,
        ),
        backgroundColor: const Color(0xff2196F3),
      ),
      displayDuration: const Duration(seconds: 3),
    );
  }

}