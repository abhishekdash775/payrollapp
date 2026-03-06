import 'package:flutter/material.dart';
import 'package:payrollapp/core/theme/app_bar_theme.dart';
import 'package:payrollapp/core/theme/app_bottom_nav_theme.dart';
import 'package:payrollapp/core/theme/app_button_theme.dart';
import 'package:payrollapp/core/theme/app_color.dart';
import 'package:payrollapp/core/theme/app_icon_theme.dart';
import 'package:payrollapp/core/theme/app_input_theme.dart';
import 'package:payrollapp/core/theme/color_scheme.dart';
import 'package:payrollapp/core/theme/default_text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData themeData = ThemeData(
    fontFamily: 'OpenSans',
    textTheme: DefaultTextTheme.textTheme,
    inputDecorationTheme: AppInputTheme.lightInputTheme,
    colorScheme: AppColorScheme.light,
    elevatedButtonTheme: AppButtonTheme.elevatedButtonTheme,
    outlinedButtonTheme: AppButtonTheme.outlinedButtonTheme,
    iconButtonTheme: AppButtonTheme.iconButtonTheme,
    scaffoldBackgroundColor: AppColors.background,
    iconTheme: AppIconTheme.secondaryIcon,
    appBarTheme: AppAppBarTheme.lightAppBarTheme,
    bottomNavigationBarTheme: AppBottomNavTheme.theme,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.grey600,
      selectionColor: AppColors.grey100,
      selectionHandleColor: AppColors.grey600,
    ),
  );
}
