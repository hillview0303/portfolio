import 'package:flutter/material.dart';
import 'package:yujin_portfolio/sections/about_me/about_section.dart';
import 'package:yujin_portfolio/sections/header/widgets/top_navigation_bar.dart';
import 'sections/header/header_section.dart';
import 'sections/experience/experience_section.dart';
import 'sections/skill/skills_section.dart';
import 'sections/project/projects_section.dart';
import 'sections/contact/contact_section.dart';
import '../../../constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 각 섹션의 GlobalKey
  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  // ScrollController
  final ScrollController _scrollController = ScrollController();

  // 현재 활성화된 섹션
  String _currentSection = 'about';

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // 스크롤 이벤트 감지
  void _onScroll() {
    final scrollPosition = _scrollController.position.pixels;

    final aboutPosition = _getKeyPosition(_aboutKey);
    final experiencePosition = _getKeyPosition(_experienceKey);
    final skillsPosition = _getKeyPosition(_skillsKey);
    final projectsPosition = _getKeyPosition(_projectsKey);
    final contactPosition = _getKeyPosition(_contactKey);

    String newSection = _currentSection;

    if (scrollPosition >= contactPosition - 100) {
      newSection = 'contact';
    } else if (scrollPosition >= projectsPosition - 100) {
      newSection = 'projects';
    } else if (scrollPosition >= skillsPosition - 100) {
      newSection = 'skills';
    } else if (scrollPosition >= experiencePosition - 100) {
      newSection = 'experience';
    } else if (scrollPosition >= aboutPosition - 100) {
      newSection = 'about';
    }

    if (newSection != _currentSection) {
      setState(() {
        _currentSection = newSection;
      });
    }
  }

  double _getKeyPosition(GlobalKey key) {
    final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final position = renderBox.localToGlobal(Offset.zero);
      return position.dy + _scrollController.position.pixels;
    }
    return 0;
  }

  void _scrollToSection(String sectionName) {
    GlobalKey key;
    switch (sectionName) {
      case 'about':
        key = _aboutKey;
        break;
      case 'experience':
        key = _experienceKey;
        break;
      case 'skills':
        key = _skillsKey;
        break;
      case 'projects':
        key = _projectsKey;
        break;
      case 'contact':
        key = _contactKey;
        break;
      default:
        key = _aboutKey;
    }

    final context = key.currentContext;
    if (context != null) {
      setState(() {
        _currentSection = sectionName;
      });

      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopNavigationBar(
            currentSection: _currentSection,
            onMenuTap: _scrollToSection,
          ),

          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  _buildSectionWithBackground(
                    HeaderSection(
                      key: _headerKey,
                      onStatsTap: () => _scrollToSection('projects'),
                    ),
                    AppColors.background,
                  ),
                  _buildSectionWithBackground(
                    AboutSection(key: _aboutKey),
                    AppColors.background,
                  ),
                  _buildSectionWithBackground(
                    ExperienceSection(key: _experienceKey),
                    AppColors.background,
                  ),
                  _buildSectionWithBackground(
                    SkillsSection(key: _skillsKey),
                    AppColors.background,
                  ),
                  _buildSectionWithBackground(
                    ProjectsSection(key: _projectsKey),
                    AppColors.background,
                  ),
                  _buildSectionWithBackground(
                    ContactSection(key: _contactKey),
                    AppColors.background,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionWithBackground(Widget section, Color backgroundColor) {
    return Container(
      color: backgroundColor,
      child: _buildSection(section),
    );
  }

  Widget _buildSection(Widget section) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double contentWidth = constraints.maxWidth;
        if (contentWidth > 1200) {
          contentWidth = 1200;
        } else if (contentWidth < 700) {
          contentWidth = 700;
        }

        return Center(
          child: Container(
            width: contentWidth,
            child: section,
          ),
        );
      },
    );
  }
}