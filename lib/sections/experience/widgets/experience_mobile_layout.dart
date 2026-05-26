import 'package:flutter/material.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

class ExperienceMobileLayout extends StatelessWidget {
  final String lang;

  const ExperienceMobileLayout({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          AppTexts.get('experienceTitle', lang),
          style: AppTextStyles.sectionSubtitle(lang),
        ),
        SizedBox(height: AppSizes.spacing12),
        Text(
          AppTexts.get('workSubtitle', lang),
          style: AppTextStyles.sectionTitle(lang),
        ),
        SizedBox(height: AppSizes.spacing16),
        _buildExperienceCard(
          year: AppTexts.get('work1Year', lang),
          title: AppTexts.get('work1Title', lang),
          organization: AppTexts.get('work1Organization', lang),
          description: AppTexts.get('work1Description', lang),
          color: AppColors.secondary,
        ),
        SizedBox(height: AppSizes.spacing16),
        _buildExperienceCard(
          year: AppTexts.get('work2Year', lang),
          title: AppTexts.get('work2Title', lang),
          organization: AppTexts.get('work2Organization', lang),
          description: AppTexts.get('work2Description', lang),
          color: AppColors.secondary,
        ),
        SizedBox(height: AppSizes.spacing16),
        _buildExperienceCard(
          year: AppTexts.get('work3Year', lang),
          title: AppTexts.get('work3Title', lang),
          organization: AppTexts.get('work3Organization', lang),
          description: AppTexts.get('work3Description', lang),
          color: AppColors.secondary,
        ),
        SizedBox(height: AppSizes.spacing60),
        Text(
          AppTexts.get('educationSubtitle', lang),
          style: AppTextStyles.sectionTitle(lang),
        ),
        SizedBox(height: AppSizes.spacing16),
        _buildExperienceCard(
          year: AppTexts.get('edu1Year', lang),
          title: AppTexts.get('edu1Title', lang),
          organization: AppTexts.get('edu1Organization', lang),
          description: AppTexts.get('edu1Description', lang),
          color: AppColors.secondary,
        ),
        SizedBox(height: AppSizes.spacing16),
        _buildExperienceCard(
          year: AppTexts.get('edu2Year', lang),
          title: AppTexts.get('edu2Title', lang),
          organization: AppTexts.get('edu2Organization', lang),
          description: AppTexts.get('edu2Description', lang),
          color: AppColors.secondary,
        ),
        SizedBox(height: AppSizes.spacing16),
        _buildExperienceCard(
          year: AppTexts.get('edu3Year', lang),
          title: AppTexts.get('edu3Title', lang),
          organization: AppTexts.get('edu3Organization', lang),
          description: AppTexts.get('edu3Description', lang),
          color: AppColors.secondary,
        ),
      ],
    );
  }

  Widget _buildExperienceCard({
    required String year,
    required String title,
    required String organization,
    required String description,
    required Color color,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.cardPadding),
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(AppSizes.cardRadius),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            spreadRadius: AppSizes.shadowSpread,
            blurRadius: AppSizes.shadowBlur,
            offset: Offset(0, AppSizes.shadowOffsetY),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.chipPaddingH,
              vertical: AppSizes.chipPaddingV - 2,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppSizes.chipRadiusLarge),
              border: Border.all(color: color.withOpacity(0.3)),
            ),
            child: Text(
              year,
              style: AppTextStyles.timelineYear(lang).copyWith(
                color: color,
                fontSize: 11,
              ),
            ),
          ),
          SizedBox(height: AppSizes.spacing8),
          Text(
            title,
            style: AppTextStyles.timelineTitle(lang).copyWith(fontSize: 16),
          ),
          SizedBox(height: AppSizes.spacing4),
          Text(
            organization,
            style: AppTextStyles.timelineOrganization(lang).copyWith(
              color: color,
              fontSize: 13,
            ),
          ),
          if (description.isNotEmpty) ...[
            SizedBox(height: AppSizes.spacing8),
            Text(
              description,
              style: AppTextStyles.timelineDescription(lang).copyWith(fontSize: 12),
            ),
          ],
        ],
      ),
    );
  }
}