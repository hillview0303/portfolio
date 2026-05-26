import 'package:flutter/material.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

class AboutMobileLayout extends StatelessWidget {
  final String lang;

  const AboutMobileLayout({
    super.key,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.get('aboutTitle', lang),
          style: AppTextStyles.sectionTitle(lang),
        ),
        SizedBox(height: AppSizes.spacing40),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              'assets/images/facemobile.png',
              width: 150,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: AppSizes.spacing32),
        _buildIntroductionText(),
      ],
    );
  }

  Widget _buildIntroductionText() {
    final paragraphs = _getParagraphs();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphs.asMap().entries.map((entry) {
        final index = entry.key;
        final paragraph = entry.value;

        return Padding(
          padding: EdgeInsets.only(
            bottom: index < paragraphs.length - 1 ? AppSizes.spacing24 : 0,
          ),
          child: RichText(
            text: TextSpan(
              style: AppTextStyles.body1(lang).copyWith(
                fontSize: 14,
                height: 1.8,
                color: AppColors.textSecondary,
              ),
              children: [
                TextSpan(
                  text: '${paragraph['title']}\n',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                TextSpan(text: paragraph['content']),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  List<Map<String, String>> _getParagraphs() {
    if (lang == 'ko') {
      return [
        {
          'title': '스타트업에서의 경험',
          'content':
          '사용자 경험과 기술적 완성도를 모두 중요하게 생각하는 개발자입니다. 스타트업에서 근무하며 기획부터 디자인, 개발까지 제품 제작의 전 과정을 직접 경험했고, 제한된 자원 속에서도 사용자에게 실질적인 가치를 전달하는 서비스를 만드는 데 집중해왔습니다.',
        },
        {
          'title': 'Flutter 전문성',
          'content':
          '이러한 환경 속에서 문제를 주도적으로 정의하고, 빠르게 시도하며 개선하는 과정에 익숙해졌습니다. 현재는 Flutter를 주력 기술로 삼아 모바일 앱을 개발하고 있으며, 상태 관리, UI 설계, 재사용 가능한 컴포넌트 구조 등 Flutter 기반의 안정적이고 확장 가능한 앱 구현에 강점을 가지고 있습니다.',
        },
        {
          'title': '전체적인 시야',
          'content':
          '또한 Spring 기반 백엔드와 HTML/CSS 등 웹 기술 전반에 대한 이해를 바탕으로 서비스 전체 구조를 고려한 개발이 가능합니다. 새로운 기술을 배우고 더 나은 방법으로 문제를 해결하며, 지속적으로 도전하고 성장하는 개발자를 지향합니다.',
        },
      ];
    } else {
      return [
        {
          'title': 'Startup Experience',
          'content':
          'I am a developer who values both user experience and technical excellence. Working at a startup, I\'ve gained hands-on experience across the entire product development cycle—from planning and design to implementation—focusing on delivering real value to users even with limited resources.',
        },
        {
          'title': 'Flutter Expertise',
          'content':
          'In this environment, I\'ve become adept at proactively defining problems, rapidly iterating, and continuously improving solutions. Currently, I specialize in mobile app development with Flutter, with particular strength in building stable and scalable applications through state management, UI design, and reusable component architecture.',
        },
        {
          'title': 'Holistic Perspective',
          'content':
          'Additionally, my understanding of Spring-based backend development and web technologies like HTML/CSS enables me to consider the service architecture holistically. I strive to be a developer who continuously learns new technologies, finds better ways to solve problems, and embraces new challenges for continuous growth.',
        },
      ];
    }
  }
}