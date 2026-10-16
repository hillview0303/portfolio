import 'package:flutter/material.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';
import 'project_buttons.dart';

class ProjectsMobileLayout extends StatelessWidget {
  final String lang;
  final List<Map<String, dynamic>> projects;

  const ProjectsMobileLayout({
    super.key,
    required this.lang,
    required this.projects,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.get('projectsTitle', lang),
          style: AppTextStyles.sectionTitle(lang),
        ),
        SizedBox(height: AppSizes.spacing16),
        Text(
          AppTexts.get('projectsSubtitle', lang),
          style: AppTextStyles.body1(lang).copyWith(
            fontSize: 14,
            height: 1.8,
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: AppSizes.spacing40),
        ...projects.map((project) => Padding(
          padding: EdgeInsets.only(bottom: AppSizes.spacing24),
          child: _buildProjectCard(project),
        )).toList(),
      ],
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundWhite,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            spreadRadius: AppSizes.shadowSpreadLarge,
            blurRadius: AppSizes.shadowBlurLarge,
            offset: Offset(0, AppSizes.shadowOffsetY),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppSizes.radiusL),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppSizes.radiusL),
              ),
              child: Image.asset(
                project['image'] as String,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(AppSizes.cardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.get(project['titleKey'] as String, lang),
                  style: AppTextStyles.projectTitle(lang),
                ),
                SizedBox(height: AppSizes.spacing8),
                Text(
                  AppTexts.get(project['descriptionKey'] as String, lang),
                  style: AppTextStyles.cardDescription(lang),
                ),
                SizedBox(height: AppSizes.spacing12),
                Wrap(
                  spacing: AppSizes.spacing4,
                  runSpacing: AppSizes.spacing4,
                  children: (project['tech'] as List<String>)
                      .map((tech) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.chipBackground,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: AppColors.borderPrimary),
                    ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        fontSize: 11,
                        color: AppColors.primary,
                      ),
                    ),
                  ))
                      .toList(),
                ),
                ProjectButtons(project: project, lang: lang),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
