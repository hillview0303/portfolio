import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_texts.dart';
import '../../constants/app_colors.dart';
import 'widgets/skills_desktop_layout.dart';
import 'widgets/skills_mobile_layout.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  static const List<String> developmentSkills = [
    'Flutter',
    'Riverpod',
    'Spring Boot',
    'HTML/CSS',
    'REST API',
  ];

  static const List<String> tools = [
    'Android Studio',
    'Cursor',
    'Git',
    'Figma',
  ];

  @override
  Widget build(BuildContext context) {
    String systemLang = Localizations.localeOf(context).languageCode;
    String lang = AppTexts.getCurrentLanguage(systemLang);

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < AppSizes.mobileBreakpoint;

    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      padding: EdgeInsets.only(
        left: AppSizes.sectionPadding,
        right: AppSizes.sectionPadding,
        top: AppSizes.sectionPaddingM,
        bottom: AppSizes.sectionPaddingBig,
      ),
      child: isMobile
          ? SkillsMobileLayout(
        lang: lang,
        developmentSkills: developmentSkills,
        tools: tools,
      )
          : SkillsDesktopLayout(
        lang: lang,
        developmentSkills: developmentSkills,
        tools: tools,
      ),
    );
  }
}