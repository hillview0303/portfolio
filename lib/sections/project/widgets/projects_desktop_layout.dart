import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

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

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    final String github = project['github'] as String? ?? '';
    final String demo = project['demo'] as String? ?? '';
    final String playStore = project['playStore'] as String? ?? '';
    final String appStore = project['appStore'] as String? ?? '';

    // 활성화된 버튼만 리스트로 모음
    final List<Widget> buttons = [];
    if (github.isNotEmpty) {
      buttons.add(_buildButton(
        url: github,
        icon: Icons.code,
        labelKey: 'viewCode',
        backgroundColor: AppColors.textPrimary,
      ));
    }
    if (demo.isNotEmpty) {
      buttons.add(_buildButton(
        url: demo,
        icon: Icons.launch,
        labelKey: 'viewDemo',
        backgroundColor: AppColors.primary,
      ));
    }
    if (playStore.isNotEmpty) {
      buttons.add(_buildButton(
        url: playStore,
        icon: Icons.play_arrow_rounded,
        labelKey: 'playStore',
        backgroundColor: AppColors.primary,
      ));
    }
    if (appStore.isNotEmpty) {
      buttons.add(_buildButton(
        url: appStore,
        icon: Icons.apple,
        labelKey: 'appStore',
        backgroundColor: Colors.black,
      ));
    }

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(AppSizes.radiusL),
            ),
            child: Container(
              width: 300,
              height: 200,
              color: Colors.white,
              child: Image.asset(
                project['image'] as String,
                width: 300,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            child: Padding(
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
                  if (buttons.isNotEmpty) ...[
                    SizedBox(height: AppSizes.spacing16),
                    Row(
                      children: _buildButtonRow(buttons),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 버튼들을 균등 분할 + 사이 간격 추가
  List<Widget> _buildButtonRow(List<Widget> buttons) {
    final List<Widget> result = [];
    for (int i = 0; i < buttons.length; i++) {
      result.add(Expanded(child: buttons[i]));
      if (i < buttons.length - 1) {
        result.add(SizedBox(width: AppSizes.spacing8));
      }
    }
    return result;
  }

  // 공통 버튼 위젯 (아이콘 + 라벨 + 색상만 다름)
  Widget _buildButton({
    required String url,
    required IconData icon,
    required String labelKey,
    required Color backgroundColor,
  }) {
    return ElevatedButton.icon(
      onPressed: () => _launch(url),
      icon: Icon(icon, size: AppSizes.iconS),
      label: Text(AppTexts.get(labelKey, lang)),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: AppColors.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
        ),
      ),
    );
  }
}