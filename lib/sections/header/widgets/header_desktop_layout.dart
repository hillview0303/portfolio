import 'package:flutter/material.dart';
import 'package:yujin_portfolio/sections/header/widgets/typing_animation_text.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

class HeaderDesktopLayout extends StatelessWidget {
  final String lang;
  final VoidCallback? onStatsTap;

  const HeaderDesktopLayout({
    super.key,
    required this.lang,
    this.onStatsTap,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: _StatCard(
                    number: AppTexts.get('statsProjects', lang),
                    label: AppTexts.get('statsProjectsLabel', lang),
                    onTap: onStatsTap,
                  ),
                ),
                SizedBox(width: AppSizes.spacing8),
                Flexible(
                  child: _StatCard(
                    number: AppTexts.get('statsLiveApps', lang),
                    label: AppTexts.get('statsLiveAppsLabel', lang),
                    onTap: onStatsTap,
                  ),
                ),
              ],
            ),
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

// 탭하면 onTap 실행, 웹에서 hover 시 테두리·배경이 살짝 밝아짐
class _StatCard extends StatefulWidget {
  final String number;
  final String label;
  final VoidCallback? onTap;

  const _StatCard({
    required this.number,
    required this.label,
    this.onTap,
  });

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : MouseCursor.defer,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          constraints: BoxConstraints(minWidth: 110),
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.spacing16,
            vertical: AppSizes.spacing24,
          ),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.primary.withValues(alpha: 0.06)
                : Colors.transparent,
            border: Border.all(
              color: _hovered
                  ? AppColors.primary.withValues(alpha: 0.5)
                  : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(AppSizes.radiusL),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.number,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: AppColors.primary,
                  height: 1.0,
                ),
              ),
              SizedBox(height: AppSizes.spacing8),
              Text(
                widget.label,
                style: AppTextStyles.body2(null).copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
