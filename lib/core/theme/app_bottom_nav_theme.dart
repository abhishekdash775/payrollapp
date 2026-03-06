import 'package:flutter/material.dart';
import 'package:payrollapp/core/theme/app_color.dart';

class AppBottomNavTheme {
  AppBottomNavTheme._();

  static const BottomNavigationBarThemeData theme =
      BottomNavigationBarThemeData(
    backgroundColor: AppColors.background,

    elevation: 8,

    selectedItemColor: AppColors.textPrimary,
    unselectedItemColor: AppColors.grey600,

    selectedIconTheme: IconThemeData(
      size: 26,
    ),

    unselectedIconTheme: IconThemeData(
      size: 24,
    ),

    selectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),

    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),

    type: BottomNavigationBarType.fixed,
    showUnselectedLabels: true,
  );
}