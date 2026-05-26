import 'package:flutter/material.dart';
import 'package:yujin_portfolio/sections/header/widgets/animated_blob.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_texts.dart';
import 'widgets/header_mobile_layout.dart';
import 'widgets/header_desktop_layout.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    String systemLang = Localizations.localeOf(context).languageCode;
    String lang = AppTexts.getCurrentLanguage(systemLang);

    double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < AppSizes.mobileBreakpoint;

    return Stack(
      children: [
        Positioned.fill(
          child: BlobBackground(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.sectionPadding,
            vertical: AppSizes.spacing24,
          ),
          child: isMobile
              ? HeaderMobileLayout(lang: lang)
              : HeaderDesktopLayout(lang: lang),
        ),
      ],
    );
  }
}