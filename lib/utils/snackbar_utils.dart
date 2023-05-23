import 'package:flutter/material.dart';


class SnackbarUtils {
  static void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 3,
        duration: const Duration(milliseconds: 400),
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        content: Text(message),
      ),
    );
  }
}
