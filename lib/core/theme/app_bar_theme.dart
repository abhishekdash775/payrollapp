import 'package:flutter/material.dart';
import 'package:payrollapp/core/theme/app_color.dart';

class AppAppBarTheme {
  AppAppBarTheme._();

  static const AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.white,
    surfaceTintColor: Colors.transparent, 
    elevation: 0,
    scrolledUnderElevation: 0,

    centerTitle: false,

    // Title style
    titleTextStyle: TextStyle(
      color: AppColors.black,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),

    // Icons
    iconTheme: IconThemeData(
      color: AppColors.black,
      size: 24,
    ),

    actionsIconTheme: IconThemeData(
      color: AppColors.black,
      size: 24,
    ),
  );
}