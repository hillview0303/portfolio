import 'package:flutter/material.dart';
import 'package:yujin_portfolio/sections/header/widgets/typing_animation_text.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

class HeaderDesktopLayout extends StatelessWidget {
  final String lang;

  const HeaderDesktopLayout({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppTexts.get('name', lang),
                  style: AppTextStyles.heading1(lang).copyWith(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: AppColors.primary,
                    shadows: [
                      Shadow(
                        color: AppColors.primary.withOpacity(0.5),
                        offset: Offset(0, 4),
                        blurRadius: 15,
                      ),
                      Shadow(
                        color: AppColors.primary.withOpacity(0.3),
                        offset: Offset(0, 8),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes.spacing8),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '> ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.secondary,
                        fontFamily: 'monospace',
                      ),
                    ),
                    TypingAnimationText(
                      texts: AppTexts.getList('jobTitles', lang),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.secondary,
                        fontFamily: 'monospace',
                        letterSpacing: 0.5,
                      ),
                      typingSpeed: Duration(milliseconds: 100),
                      deletingSpeed: Duration(milliseconds: 50),
                      pauseDuration: Duration(milliseconds: 2000),
                      cursorBlinkSpeed: Duration(milliseconds: 500),
                      cursorColor: AppColors.secondary,
                      startDelay: Duration(milliseconds: 800),
                    ),
                  ],
                ),
                SizedBox(height: AppSizes.spacing32),
                Container(
                  constraints: BoxConstraints(maxWidth: 500),
                  child: Text(
                    AppTexts.get('headerTagline', lang),
                    style: AppTextStyles.body1(lang).copyWith(
                      fontSize: 15,
                      height: 1.8,
                    ),
                  ),
                ),
                SizedBox(height: AppSizes.spacing40),
                _buildScrollDownButton(),
              ],
            ),
          ),
          SizedBox(width: AppSizes.spacing60),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStatCard(
                  number: AppTexts.get('statsProjects', lang),
                  label: AppTexts.get('statsProjectsLabel', lang),
                ),
                _buildStatCard(
                  number: AppTexts.get('statsYears', lang),
                  label: AppTexts.get('statsYearsLabel', lang),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String number,
    required String label,
  }) {
    return Container(
      width: 110,
      padding: EdgeInsets.all(AppSizes.spacing24),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: AppColors.primary,
              height: 1.0,
            ),
          ),
          SizedBox(height: AppSizes.spacing8),
          Text(
            label,
            style: AppTextStyles.body2(null).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildScrollDownButton() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.spacing16,
        vertical: AppSizes.spacing12,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.primary.withOpacity(0.3),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.primary,
            size: AppSizes.iconM,
          ),
          SizedBox(width: AppSizes.spacing8),
          Text(
            'Scroll Down',
            style: AppTextStyles.body2(null).copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}