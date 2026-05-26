import 'package:flutter/material.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

class ExperienceDesktopLayout extends StatelessWidget {
  final String lang;

  const ExperienceDesktopLayout({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.get('experienceTitle', lang),
          style: AppTextStyles.sectionSubtitle(lang),
        ),
        SizedBox(height: AppSizes.spacing60),
        Column(
          children: [
            _buildTimelineItemWithSubtitle(
              year: AppTexts.get('work1Year', lang),
              title: AppTexts.get('work1Title', lang),
              organization: AppTexts.get('work1Organization', lang),
              description: AppTexts.get('work1Description', lang),
              icon: Icons.laptop_mac,
              color: AppColors.secondary,
              isLeft: true,
              subtitle: AppTexts.get('workSubtitle', lang),
              showSubtitle: true,
            ),
            _buildTimelineItem(
              year: AppTexts.get('work2Year', lang),
              title: AppTexts.get('work2Title', lang),
              organization: AppTexts.get('work2Organization', lang),
              description: AppTexts.get('work2Description', lang),
              icon: Icons.engineering,
              color: AppColors.secondary,
              isLeft: false,
            ),
            _buildTimelineItem(
              year: AppTexts.get('work3Year', lang),
              title: AppTexts.get('work3Title', lang),
              organization: AppTexts.get('work3Organization', lang),
              description: AppTexts.get('work3Description', lang),
              icon: Icons.work_outline,
              color: AppColors.secondary,
              isLeft: true,
            ),
          ],
        ),
        Container(
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                AppColors.border.withOpacity(0.3),
                Colors.transparent,
              ],
            ),
          ),
          margin: EdgeInsets.symmetric(vertical: AppSizes.spacing60),
        ),
        Column(
          children: [
            _buildTimelineItemWithSubtitle(
              year: AppTexts.get('edu1Year', lang),
              title: AppTexts.get('edu1Title', lang),
              organization: AppTexts.get('edu1Organization', lang),
              description: AppTexts.get('edu1Description', lang),
              icon: Icons.code,
              color: AppColors.secondary,
              isLeft: false,
              subtitle: AppTexts.get('educationSubtitle', lang),
              showSubtitle: true,
            ),
            _buildTimelineItem(
              year: AppTexts.get('edu2Year', lang),
              title: AppTexts.get('edu2Title', lang),
              organization: AppTexts.get('edu2Organization', lang),
              description: AppTexts.get('edu2Description', lang),
              icon: Icons.terminal,
              color: AppColors.secondary,
              isLeft: true,
            ),
            _buildTimelineItem(
              year: AppTexts.get('edu3Year', lang),
              title: AppTexts.get('edu3Title', lang),
              organization: AppTexts.get('edu3Organization', lang),
              description: AppTexts.get('edu3Description', lang),
              icon: Icons.precision_manufacturing,
              color: AppColors.secondary,
              isLeft: false,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTimelineItemWithSubtitle({
    required String year,
    required String title,
    required String organization,
    required String description,
    required IconData icon,
    required Color color,
    required bool isLeft,
    required String subtitle,
    required bool showSubtitle,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.spacing40),
      child: Row(
        children: [
          if (isLeft)
            Expanded(
              child: _buildContentCard(
                year: year,
                title: title,
                organization: organization,
                description: description,
                color: color,
                alignment: CrossAxisAlignment.end,
                textAlign: TextAlign.right,
              ),
            )
          else
            Expanded(
              child: Center(
                child: Text(
                  subtitle,
                  style: AppTextStyles.sectionTitle(lang),
                ),
              ),
            ),
          Container(
            width: AppSizes.timelineIconWidth,
            child: Column(
              children: [
                Container(
                  width: AppSizes.timelineIconSize,
                  height: AppSizes.timelineIconSize,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(AppSizes.opacity30),
                        spreadRadius: AppSizes.shadowSpreadLarge,
                        blurRadius: AppSizes.shadowBlur,
                        offset: Offset(0, AppSizes.shadowSpreadLarge),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.textWhite,
                    size: AppSizes.iconL,
                  ),
                ),
                Container(
                  width: AppSizes.timelineLineWidth,
                  height: AppSizes.timelineLineHeight,
                  color: AppColors.border,
                ),
              ],
            ),
          ),
          if (!isLeft)
            Expanded(
              child: _buildContentCard(
                year: year,
                title: title,
                organization: organization,
                description: description,
                color: color,
                alignment: CrossAxisAlignment.start,
                textAlign: TextAlign.left,
              ),
            )
          else
            Expanded(
              child: Center(
                child: Text(
                  subtitle,
                  style: AppTextStyles.sectionTitle(lang),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String year,
    required String title,
    required String organization,
    required String description,
    required IconData icon,
    required Color color,
    required bool isLeft,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.spacing40),
      child: Row(
        children: [
          if (isLeft)
            Expanded(
              child: _buildContentCard(
                year: year,
                title: title,
                organization: organization,
                description: description,
                color: color,
                alignment: CrossAxisAlignment.end,
                textAlign: TextAlign.right,
              ),
            )
          else
            Expanded(child: SizedBox()),
          Container(
            width: AppSizes.timelineIconWidth,
            child: Column(
              children: [
                Container(
                  width: AppSizes.timelineIconSize,
                  height: AppSizes.timelineIconSize,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: color.withOpacity(AppSizes.opacity30),
                        spreadRadius: AppSizes.shadowSpreadLarge,
                        blurRadius: AppSizes.shadowBlur,
                        offset: Offset(0, AppSizes.shadowSpreadLarge),
                      ),
                    ],
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.textWhite,
                    size: AppSizes.iconL,
                  ),
                ),
                Container(
                  width: AppSizes.timelineLineWidth,
                  height: AppSizes.timelineLineHeight,
                  color: AppColors.border,
                ),
              ],
            ),
          ),
          if (!isLeft)
            Expanded(
              child: _buildContentCard(
                year: year,
                title: title,
                organization: organization,
                description: description,
                color: color,
                alignment: CrossAxisAlignment.start,
                textAlign: TextAlign.left,
              ),
            )
          else
            Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget _buildContentCard({
    required String year,
    required String title,
    required String organization,
    required String description,
    required Color color,
    required CrossAxisAlignment alignment,
    required TextAlign textAlign,
  }) {
    return Container(
      padding: EdgeInsets.all(AppSizes.cardPadding),
      margin: EdgeInsets.symmetric(horizontal: AppSizes.spacing16),
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
        crossAxisAlignment: alignment,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.chipPaddingH,
              vertical: AppSizes.chipPaddingV,
            ),
            decoration: BoxDecoration(
              color: color.withOpacity(AppSizes.opacity10),
              borderRadius: BorderRadius.circular(AppSizes.chipRadiusLarge),
              border: Border.all(color: color.withOpacity(AppSizes.opacity30)),
            ),
            child: Text(
              year,
              style: AppTextStyles.timelineYear(lang).copyWith(color: color),
            ),
          ),
          SizedBox(height: AppSizes.spacing12),
          Text(
            title,
            textAlign: textAlign,
            style: AppTextStyles.timelineTitle(lang),
          ),
          SizedBox(height: AppSizes.spacing8),
          Text(
            organization,
            textAlign: textAlign,
            style: AppTextStyles.timelineOrganization(lang).copyWith(color: color),
          ),
          if (description.isNotEmpty) ...[
            SizedBox(height: AppSizes.spacing12),
            Text(
              description,
              textAlign: textAlign,
              style: AppTextStyles.timelineDescription(lang),
            ),
          ],
        ],
      ),
    );
  }
}