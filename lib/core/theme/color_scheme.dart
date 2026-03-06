import 'package:flutter/material.dart';
import 'package:payrollapp/core/theme/app_color.dart';

class AppColorScheme {
  AppColorScheme._();

  static const light = ColorScheme(
    brightness: Brightness.light,

    // ================= BRAND =================
    primary: AppColors.black,
    onPrimary: AppColors.white,

    secondary: AppColors.grey600,
    onSecondary: AppColors.white,

    // ================= BACKGROUND =================
    // background: AppColors.background,
    // onBackground: AppColors.textPrimary,

    // ================= SURFACES =================
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
   
    surfaceContainerHighest: AppColors.grey100,
    onSurfaceVariant: AppColors.textSecondary,

    // ================= BORDERS =================
    outline: AppColors.grey200,
    outlineVariant: AppColors.grey100,

    // ================= STATES =================
    error: AppColors.error,
    onError: AppColors.white,
    errorContainer: Color(0xFFFDEDED), // Soft red background
    onErrorContainer: Color(0xFF5F2120),

    // ================= EXTRA (Material 3 FIX) =================
    inverseSurface: AppColors.black,
    onInverseSurface: AppColors.white,

    inversePrimary: AppColors.grey600,

    // shadow: Colors.black12,
    // scrim: Colors.black54,

    // tertiary: AppColors.black,
    // onTertiary: AppColors.white,
  );
}
