import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFFF2FF5B);
  static const Color primaryLight = Color(0xFFF5FF88);
  static const Color primaryDark = Color(0xFFE8FF30);
  static const Color secondary = Color(0xFF89FF69);

  // Background Colors
  static const Color background = Color(0xFF000000);
  static const Color backgroundWhite = Color(0xFF1A1A1A);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFCCCCCC);
  static const Color textWhite = Colors.white;
  static final Color textWhite70 = Colors.white.withOpacity(0.7);

  // Border Colors
  static const Color border = Color(0xFF333333);
  static final Color borderPrimary = primary.withOpacity(0.3);

  // Shadow Colors
  static final Color shadowLight = Colors.black.withOpacity(0.3);
  static final Color shadowMedium = Colors.black.withOpacity(0.5);
  static final Color shadowPrimary = primary.withOpacity(0.2);

  // Overlay Colors
  static final Color overlayWhite = Colors.white.withOpacity(0.05);
  static final Color overlayWhite20 = Colors.white.withOpacity(0.1);

  // Gradient
  static List<Color> gradientPrimary = [primaryDark, primary];

  // Chip Colors
  static final Color chipBackground = primary.withOpacity(0.15);
}