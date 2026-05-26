import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_texts.dart';
import 'widgets/experience_desktop_layout.dart';
import 'widgets/experience_mobile_layout.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
        top: AppSizes.sectionPadding,
        bottom: AppSizes.sectionPaddingBig,
      ),
      child: isMobile
          ? ExperienceMobileLayout(lang: lang)
          : ExperienceDesktopLayout(lang: lang),
    );
  }
}