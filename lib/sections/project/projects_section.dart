import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../constants/app_texts.dart';
import 'widgets/projects_desktop_layout.dart';
import 'widgets/projects_mobile_layout.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const List<Map<String, dynamic>> projects = [
    {
      'titleKey': 'pickleTitle',
      'descriptionKey': 'pickleDesc',
      'tech': ['Flutter', 'Riverpod', 'Supabase', 'OpenAI', 'Google Vision', 'FCM'],
      'image': 'assets/images/pickle.png',
      'github': '',
      'demo': '',
      'playStore': 'https://play.google.com/store/apps/details?id=com.nestplanet.pickle',
      'appStore': '',
    },
    {
      'titleKey': 'liftMonitoringTitle',
      'descriptionKey': 'liftMonitoringDesc',
      'tech': ['Flutter', 'MQTT', 'Supabase', 'Python', 'scikit-learn', 'OpenAI'],
      'image': 'assets/images/lift_monitoring.png',
      'github': '',
      'demo': 'https://www.youtube.com/shorts/_lHwi_H0_H8',
      'playStore': '',
      'appStore': '',
    },
    {
      'titleKey': 'maemulTitle',
      'descriptionKey': 'maemulDesc',
      'tech': ['Flutter', 'Riverpod', 'Supabase', 'GoRouter', 'Firebase Hosting'],
      'image': 'assets/images/maemul.jpg',
      'github': '',
      'demo': 'https://maemul-manager.web.app',
      'playStore': '',
      'appStore': '',
    },
    {
      'titleKey': 'offPeakTitle',
      'descriptionKey': 'offPeakDesc',
      'tech': ['Flutter', 'Riverpod', 'LaaS', '공공 API', 'Geolocator'],
      'image': 'assets/images/offpeak.png',
      'github': 'https://github.com/hillview0303/offpeak',
      'demo': 'https://www.youtube.com/watch?v=uERXHpv1kT8',
      'playStore': '',
      'appStore': '',
    },
    {
      'titleKey': 'shelfTitle',
      'descriptionKey': 'shelfDesc',
      'tech': ['Flutter', 'Riverpod', 'REST API'],
      'image': 'assets/images/shelf.png',
      'github': 'https://github.com/hillview0303/shelf-flutter-project',
      'demo': 'https://www.youtube.com/watch?v=jXa_rS_uIPI',
      'playStore': '',
      'appStore': '',
    },
    {
      'titleKey': 'bodykeyTitle',
      'descriptionKey': 'bodykeyDesc',
      'tech': ['Flutter', 'Riverpod', 'REST API', 'Pedometer'],
      'image': 'assets/images/bodykey.png',
      'github': 'https://github.com/hillview0303/project-final-flutter',
      'demo': 'https://www.youtube.com/watch?v=ngoAZXk4fdQ',
      'playStore': '',
      'appStore': '',
    },
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
        top: AppSizes.sectionPadding,
        bottom: AppSizes.sectionPaddingBig,
      ),
      child: isMobile
          ? ProjectsMobileLayout(lang: lang, projects: projects)
          : ProjectsDesktopLayout(lang: lang, projects: projects),
    );
  }
}