import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_texts.dart';
import 'widgets/about_desktop_layout.dart';
import 'widgets/about_mobile_layout.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    String systemLang = Localizations.localeOf(context).languageCode;
    String lang = AppTexts.getCurrentLanguage(systemLang);

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < AppSizes.mobileBreakpoint;

    return Padding(
      padding: EdgeInsets.only(
        left: AppSizes.sectionPadding,
        right: AppSizes.sectionPadding,
        top: AppSizes.sectionPadding,
        bottom: AppSizes.sectionPaddingBig,
      ),
      child: isMobile
          ? AboutMobileLayout(lang: lang)
          : AboutDesktopLayout(lang: lang),
    );
  }
}