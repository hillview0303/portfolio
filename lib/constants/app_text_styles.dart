import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle _getFont(String? lang, {
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
    final isKorean = lang == 'ko';

    if (isKorean) {
      return GoogleFonts.ibmPlexSansKr(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );
    } else {
      return GoogleFonts.montserrat(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        height: height,
      );
    }
  }

  static String get fontFamily => GoogleFonts.montserrat().fontFamily!;

  // Section Title
  static TextStyle sectionTitle([String? lang]) => _getFont(
    lang,
    fontSize: 36,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
  );

  static TextStyle sectionSubtitle([String? lang]) => _getFont(
    lang,
    fontSize: 18,
    color: AppColors.textSecondary,
  );

  // Heading
  static TextStyle heading1([String? lang]) => _getFont(
    lang,
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: AppColors.primaryDark,
    height: 1.2,
  );

  static TextStyle heading2([String? lang]) => _getFont(
    lang,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  // Body
  static TextStyle body1([String? lang]) => _getFont(
    lang,
    fontSize: 16,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  static TextStyle body2([String? lang]) => _getFont(
    lang,
    fontSize: 14,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Card
  static TextStyle cardTitle([String? lang]) => _getFont(
    lang,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle cardSubtitle([String? lang]) => _getFont(
    lang,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  static TextStyle cardDescription([String? lang]) => _getFont(
    lang,
    fontSize: 14,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Timeline
  static TextStyle timelineYear([String? lang]) => _getFont(
    lang,
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static TextStyle timelineTitle([String? lang]) => _getFont(
    lang,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle timelineOrganization([String? lang]) => _getFont(
    lang,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  static TextStyle timelineDescription([String? lang]) => _getFont(
    lang,
    fontSize: 14,
    color: AppColors.textSecondary,
    height: 1.6,
  );

  // Chip
  static TextStyle chip([String? lang]) => _getFont(
    lang,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static TextStyle chipLarge([String? lang]) => _getFont(
    lang,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  // Button
  static TextStyle button([String? lang]) => _getFont(
    lang,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );

  // Contact
  static TextStyle contactTitle([String? lang]) => _getFont(
    lang,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );

  static TextStyle contactSubtitle([String? lang]) => _getFont(
    lang,
    fontSize: 18,
    color: AppColors.textWhite70,
    height: 1.6,
  );

  static TextStyle contactLabel([String? lang]) => _getFont(
    lang,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textWhite,
  );

  static TextStyle contactValue([String? lang]) => _getFont(
    lang,
    fontSize: 14,
    color: AppColors.textWhite70,
  );

  // Special
  static TextStyle subtitle1([String? lang]) => _getFont(
    lang,
    fontSize: 24,
    color: AppColors.primary,
    fontWeight: FontWeight.w500,
  );

  static TextStyle projectTitle([String? lang]) => _getFont(
    lang,
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  static TextStyle skillName([String? lang]) => _getFont(
    lang,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );
}