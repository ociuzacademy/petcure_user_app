import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';

class CustomSnackBar {
  // Generic custom snackbar
  static void show(
    BuildContext context, {
    required String message,
    IconData? icon,
    Color backgroundColor = AppPalette.black87Color,
    Color textColor = AppPalette.whiteColor,
  }) {
    _showSnackBar(
      context,
      message: message,
      icon: icon,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  // Predefined success snackbar
  static void showSuccess(
    BuildContext context, {
    required String message,
    IconData icon = Icons.check,
    Color backgroundColor = AppPalette.greenColor,
    Color textColor = AppPalette.whiteColor,
  }) {
    _showSnackBar(
      context,
      message: message,
      icon: icon,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  // Predefined error snackbar
  static void showError(
    BuildContext context, {
    required String message,
    IconData icon = Icons.error,
    Color backgroundColor = AppPalette.redColor,
    Color textColor = AppPalette.whiteColor,
  }) {
    _showSnackBar(
      context,
      message: message,
      icon: icon,
      backgroundColor: backgroundColor,
      textColor: textColor,
    );
  }

  // Shared snackbar implementation
  static void _showSnackBar(
    BuildContext context, {
    required String message,
    required IconData? icon,
    required Color backgroundColor,
    required Color textColor,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppPalette.transparentColor,
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, color: textColor),
              const SizedBox(width: 12),
            ],
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
