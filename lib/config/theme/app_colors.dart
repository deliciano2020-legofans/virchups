import 'package:flutter/material.dart';

/// Heinz Ketchup inspired color palette
class AppColors {
  // Prevent instantiation
  AppColors._();

  // Light Mode Primary Colors
  static const Color ketchupRed = Color(0xFFD12D2C);
  static const Color deepKetchup = Color(0xFFA41E22);
  static const Color heinzGreen = Color(0xFF2F5233);

  // Dark Mode Primary Colors
  static const Color ketchupRedBright = Color(0xFFFF5A52);
  static const Color ketchupRedDark = Color(0xFFD12D2C);
  static const Color heinzGreenLight = Color(0xFF79A57A);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFFF9F4);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightCardBackground = Color(0xFFFFFBF5);
  static const Color lightTextPrimary = Color(0xFF1A1A1A);
  static const Color lightTextSecondary = Color(0xFF666666);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkCardBackground = Color(0xFF2A2A2A);
  static const Color darkTextPrimary = Color(0xFFEDEDED);
  static const Color darkTextSecondary = Color(0xFFB0B0B0);

  // Accent Colors
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningOrange = Color(0xFFFF9800);
  static const Color errorRed = Color(0xFFD32F2F);
  static const Color infoBlue = Color(0xFF2196F3);
}
