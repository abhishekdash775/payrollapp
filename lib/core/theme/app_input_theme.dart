import 'package:flutter/material.dart';
import 'package:payrollapp/core/theme/app_color.dart';

class AppInputTheme {
  AppInputTheme._();

  static InputDecorationTheme get lightInputTheme => InputDecorationTheme(
    // Background
    filled: true,
    fillColor: AppColors.white,

    

    prefixIconColor: AppColors.grey600,
    suffixIconColor: AppColors.grey600,
    // Padding
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),

    // Hint Style
    hintStyle: const TextStyle(color: AppColors.grey600, fontSize: 14),

    // Label Style
    labelStyle: const TextStyle(
      color: AppColors.grey600,
      fontWeight: FontWeight.w500,
    ),

    // DEFAULT BORDER
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: AppColors.grey200, width: 1.2),
    ),

    // ENABLED
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: AppColors.grey200, width: 1.2),
    ),

    // FOCUSED ⭐ IMPORTANT
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: AppColors.grey600, width: 1.5),
    ),

    // ERROR
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),

    // FOCUSED ERROR
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: AppColors.error, width: 1.5),
    ),
  );
}
