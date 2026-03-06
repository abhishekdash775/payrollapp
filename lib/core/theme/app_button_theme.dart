import 'package:flutter/material.dart';
import 'package:payrollapp/core/theme/app_color.dart';

class AppButtonTheme {
  AppButtonTheme._();

  /// =========================
  /// Elevated Button (Primary CTA)
  /// =========================
  static ElevatedButtonThemeData elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  );

  /// =========================
  /// Outlined Button (Secondary)
  /// =========================
  static OutlinedButtonThemeData outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      side: const BorderSide(color: AppColors.grey200, width: 1.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
    ),
  );

  /// =========================
  /// Icon Button (Utility)
  /// =========================
  static IconButtonThemeData iconButtonTheme = IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.transparent),

      foregroundColor: WidgetStateProperty.all(AppColors.black),

      padding: WidgetStateProperty.all(EdgeInsets.zero),

      minimumSize: WidgetStateProperty.all(const Size(5, 5)),

      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
