import 'package:flutter/material.dart';
import 'package:yujin_portfolio/sections/header/widgets/typing_animation_text.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

class HeaderMobileLayout extends StatelessWidget {
  final String lang;

  const HeaderMobileLayout({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      padding: EdgeInsets.only(top: AppSizes.spacing60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.get('name', lang),
            style: AppTextStyles.heading1(lang).copyWith(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: AppColors.primary,
              shadows: [
                Shadow(
                  color: AppColors.primary.withOpacity(0.5),
                  offset: Offset(0, 3),
                  blurRadius: 12,
                ),
                Shadow(
                  color: AppColors.primary.withOpacity(0.3),
                  offset: Offset(0, 6),
                  blurRadius: 24,
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
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                  fontFamily: 'monospace',
                ),
              ),
              Flexible(
                child: TypingAnimationText(
                  texts: AppTexts.getList('jobTitles', lang),
                  style: TextStyle(
                    fontSize: 16,
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
              ),
            ],
          ),
          SizedBox(height: AppSizes.spacing40),
          Container(
            child: Text(
              AppTexts.get('headerTagline', lang),
              style: AppTextStyles.body1(lang).copyWith(
                fontSize: 13,
                height: 1.8,
              ),
            ),
          ),
          SizedBox(height: AppSizes.spacing40),
          _buildScrollDownButton(),
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