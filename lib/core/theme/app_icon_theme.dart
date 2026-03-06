import 'package:flutter/material.dart';
import 'package:payrollapp/core/theme/app_color.dart';

class AppIconTheme {
  AppIconTheme._();

  /// Default icon (used by ThemeData)
  static const IconThemeData defaultIcon = IconThemeData(
    color: AppColors.textPrimary,
    size: 24,
  );

  /// Secondary icons (manual usage)
  static const IconThemeData secondaryIcon = IconThemeData(
    color: AppColors.textSecondary,
    size: 22,
  );

  /// Disabled icons
  static const IconThemeData disabledIcon = IconThemeData(
    color: AppColors.grey600,
    size: 22,
  );
}
