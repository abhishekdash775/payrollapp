import 'package:flutter/material.dart';
import 'package:payrollapp/core/theme/app_color.dart';

class DefaultTextTheme {
  DefaultTextTheme._();

  static TextTheme textTheme = TextTheme(
    // ===== DISPLAY =====
    displayLarge: TextStyle(
      fontSize: 57,
    color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      height: 1.12,
    ),

    displayMedium: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 45,
      fontWeight: FontWeight.w700,
      height: 1.16,
    ),

    displaySmall: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 36,
      fontWeight: FontWeight.w600,
      height: 1.22,
    ),

    // ===== HEADLINE =====
    headlineLarge: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 1.25,
    ),

    headlineMedium: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 28,
      fontWeight: FontWeight.w600,
      height: 1.28,
    ),

    headlineSmall: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 24,
      fontWeight: FontWeight.w500,
      height: 1.30,
    ),

    // ===== TITLE =====
    titleLarge: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.27,
    ),

    titleMedium: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.50,
    ),

    titleSmall: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.43,
    ),

    // ===== BODY =====
    bodyLarge: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.50,
    ),

    bodyMedium: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.43,
    ),

    bodySmall: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.33,
    ),

    // ===== LABEL (Buttons, Chips) =====
    labelLarge: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      height: 1.43,
    ),

    labelMedium: TextStyle(
      fontSize: 12,
    color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      height: 1.33,
    ),

    labelSmall: TextStyle(
    color: AppColors.textPrimary,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 1.45,
    ),
  );
}
