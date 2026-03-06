import 'package:flutter/material.dart';

class AppColors {
  static const black = Color(0xFF111111);
  static const white = Color(0xFFFFFFFF);
  static const transparent = Colors.transparent;

  // Change background to be slightly cooler/greyer to make white cards POP
  static const surface = Color(0xFFF8F9FA);
  static const background = Color(0xFFFFFFFF);

  static const grey100 = Color(0xFFF2F2F2);
  static const grey200 = Color(0xFFE8E8E8);
  static const grey600 = Color(0xFF757575);

  // Add a "Success" color for Prices/Growth (Classic for Payroll)
  static const success = Color(0xFF2E7D32);
  static const ratingGold = Color(0xFFFFB300);
  static const error = Color(0xFFE53935); // Standard Error (Icons, Text)
  static const errorContainer = Color(
    0xFFFDEDED,
  ); // Light background for alerts
  static const onErrorContainer = Color(0xFF5F2120); // Deep red text for alerts

  static const textPrimary = Color(0xFF111111);
  static const textSecondary = Color(0xFF666666);
}
