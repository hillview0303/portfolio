import 'package:flutter/material.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';
import 'project_buttons.dart';

class ProjectsDesktopLayout extends StatelessWidget {
  final String lang;
  final List<Map<String, dynamic>> projects;

  const ProjectsDesktopLayout({
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
        SizedBox(height: AppSizes.spacing60),
        ...projects.map((project) => Padding(
          padding: EdgeInsets.only(bottom: AppSizes.spacing24),
          child: _buildProjectCard(project),
        )).toList(),
      ],
    );
  }

  static const double _imageWidth = 300;
  static const double _cardMinHeight = 200;

  // 오른쪽 콘텐츠가 카드 높이를 결정하고, 왼쪽 이미지 영역은 그 높이를 꽉 채움
  // (project_buttons의 LayoutBuilder와 충돌하므로 IntrinsicHeight 대신 Stack 사용)
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        child: SizedBox(
          width: double.infinity,
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: _cardMinHeight),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: _imageWidth),
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.cardPadding),
                    child: _buildContent(project),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: _imageWidth,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Image.asset(
                      project['image'] as String,
                      width: _imageWidth,
                      height: _cardMinHeight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Map<String, dynamic> project) {
    return Column(
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
    );
  }
}
