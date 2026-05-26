import 'package:flutter/material.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

class SkillsMobileLayout extends StatelessWidget {
  final String lang;
  final List<String> developmentSkills;
  final List<String> tools;

  const SkillsMobileLayout({
    super.key,
    required this.lang,
    required this.developmentSkills,
    required this.tools,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.get('skillsTitle', lang),
          style: AppTextStyles.sectionTitle(lang),
        ),
        SizedBox(height: AppSizes.spacing40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTexts.get('developmentSkills', lang),
                    style: AppTextStyles.body1(lang).copyWith(
                      fontSize: 14,
                      height: 1.8,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacing16),
                  ...developmentSkills.map((skill) => Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.spacing12),
                    child: _buildSkillChip(skill),
                  )),
                ],
              ),
            ),
            SizedBox(width: AppSizes.spacing24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppTexts.get('usedTools', lang),
                    style: AppTextStyles.body1(lang).copyWith(
                      fontSize: 14,
                      height: 1.8,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: AppSizes.spacing16),
                  ...tools.map((tool) => Padding(
                    padding: EdgeInsets.only(bottom: AppSizes.spacing12),
                    child: _buildSkillChip(tool),
                  )),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.chipPaddingH,
        vertical: AppSizes.chipPaddingV,
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(AppSizes.chipRadius),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        skill,
        style: AppTextStyles.chip(null),
      ),
    );
  }
}