import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';

class TopNavigationBar extends StatelessWidget {
  final String currentSection;
  final Function(String) onMenuTap;

  const TopNavigationBar({
    super.key,
    required this.currentSection,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth <= 500) {
      return SizedBox.shrink();
    }

    bool isMobile = screenWidth < AppSizes.mobileBreakpoint;

    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.sectionPadding,
        ),
        child: Center(
          child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Jang Yujin',
          style: GoogleFonts.notoSans(
            fontSize: 16,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
          ),
        ),
        _buildMenu(),
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = MediaQuery.of(context).size.width;

        double contentWidth = screenWidth;
        if (contentWidth > 1200) {
          contentWidth = 1200;
        } else if (contentWidth < 700) {
          contentWidth = 700;
        }

        contentWidth = contentWidth - (AppSizes.sectionPadding * 2);

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: contentWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Jang Yujin',
                    style: GoogleFonts.notoSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: AppColors.primary,
                    ),
                  ),
                  _buildMenu(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildMenu() {
    final menuItems = [
      {'label': 'About me', 'sectionName': 'about'},
      {'label': 'Experience', 'sectionName': 'experience'},
      {'label': 'Skills', 'sectionName': 'skills'},
      {'label': 'Projects', 'sectionName': 'projects'},
      {'label': 'Contact', 'sectionName': 'contact'},
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: menuItems.map((item) {
        String label = item['label'] as String;
        String sectionName = item['sectionName'] as String;
        bool isActive = currentSection == sectionName;

        return Padding(
          padding: EdgeInsets.only(left: AppSizes.spacing16),
          child: InkWell(
            onTap: () => onMenuTap(sectionName),
            child: Text(
              label,
              style: GoogleFonts.notoSans(
                fontSize: isActive ? 13 : 12,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                color: isActive ? AppColors.primary : AppColors.textPrimary,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}