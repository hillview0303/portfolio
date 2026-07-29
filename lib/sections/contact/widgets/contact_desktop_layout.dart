import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

class ContactDesktopLayout extends StatelessWidget {
  final String lang;

  const ContactDesktopLayout({
    super.key,
    required this.lang,
  });

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    _showCenterToast(context, AppTexts.get('emailCopied', lang));
  }

  void _showCenterToast(BuildContext context, String message) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => _CenterToast(message: message),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.get('contactTitle', lang),
          style: AppTextStyles.sectionTitle(lang),
        ),
        SizedBox(height: AppSizes.spacing16),

        SizedBox(height: AppSizes.spacing60),
        Row(
          children: [
            Expanded(
              child: _buildContactCard(
                context: context,
                icon: Icons.email,
                label: AppTexts.get('email', lang),
                value: 'j910219@gmail.com',
                onTap: () => _copyToClipboard(context, 'j910219@gmail.com'),
              ),
            ),
            SizedBox(width: AppSizes.spacing24),
            Expanded(
              child: _buildContactCard(
                context: context,
                icon: Icons.phone,
                label: AppTexts.get('phone', lang),
                value: '010-8763-4066',
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: AppSizes.spacing24),
        Row(
          children: [
            Expanded(
              child: _buildContactCard(
                context: context,
                icon: Icons.code,
                label: AppTexts.get('github', lang),
                value: 'github.com/hillview0303',
                onTap: () => _launchUrl('https://github.com/hillview0303'),
              ),
            ),
            SizedBox(width: AppSizes.spacing24),
            Expanded(
              child: _buildContactCard(
                context: context,
                icon: Icons.work,
                label: AppTexts.get('linkedin', lang),
                value: 'linkedin.com/in/jang-yujin',
                onTap: () => _launchUrl('https://linkedin.com/in/jang-yujin'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactCard({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 100,
          padding: EdgeInsets.all(AppSizes.cardPadding),
          decoration: BoxDecoration(
            color: AppColors.backgroundWhite,
            borderRadius: BorderRadius.circular(AppSizes.cardRadius),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowLight,
                spreadRadius: AppSizes.shadowSpread,
                blurRadius: AppSizes.shadowBlur,
                offset: Offset(0, AppSizes.shadowOffsetY),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.1),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.secondary.withOpacity(0.3),
                  ),
                ),
                child: Center(
                  child: Icon(
                    icon,
                    size: AppSizes.contactIconSize,
                    color: AppColors.secondary,
                  ),
                ),
              ),
              SizedBox(width: AppSizes.spacing16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: AppSizes.spacing4),
                    Text(
                      value,
                      style: TextStyle(
                        color: AppColors.textWhite,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CenterToast extends StatefulWidget {
  final String message;

  const _CenterToast({required this.message});

  @override
  State<_CenterToast> createState() => _CenterToastState();
}

class _CenterToastState extends State<_CenterToast>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();

    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: AppColors.backgroundWhite,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.secondary.withOpacity(0.3),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Text(
                widget.message,
                style: const TextStyle(
                  color: AppColors.textWhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}