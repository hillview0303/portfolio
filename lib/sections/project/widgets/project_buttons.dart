import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../../constants/app_texts.dart';

// 프로젝트 카드 하단 버튼 영역 (desktop/mobile 공용)
// - github/demo 버튼은 한 줄에 균등 분할
// - storeGroups가 있으면 앱마다 "앱 이름 + 스토어 버튼" 한 줄씩
// - 없으면 playStore/appStore 버튼을 github/demo와 같은 줄에 배치
class ProjectButtons extends StatelessWidget {
  final Map<String, dynamic> project;
  final String lang;

  const ProjectButtons({
    super.key,
    required this.project,
    required this.lang,
  });

  @override
  Widget build(BuildContext context) {
    final String github = project['github'] as String? ?? '';
    final String demo = project['demo'] as String? ?? '';
    final List<Map<String, String>> storeGroups =
        (project['storeGroups'] as List<Map<String, String>>?) ?? const [];

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
    if (storeGroups.isEmpty) {
      buttons.addAll(_buildStoreButtons(
        playStore: project['playStore'] as String? ?? '',
        appStore: project['appStore'] as String? ?? '',
      ));
    }

    // 스토어 링크가 하나도 없는 앱은 줄 자체를 생략
    final List<Widget> groupRows = [];
    for (final group in storeGroups) {
      final storeButtons = _buildStoreButtons(
        playStore: group['playStore'] ?? '',
        appStore: group['appStore'] ?? '',
      );
      if (storeButtons.isEmpty) continue;
      groupRows.add(_buildGroupRow(group['labelKey'] ?? '', storeButtons));
    }

    if (buttons.isEmpty && groupRows.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<Widget> rows = [
      if (buttons.isNotEmpty) Row(children: _buildButtonRow(buttons)),
      ...groupRows,
    ];

    return Padding(
      padding: EdgeInsets.only(top: AppSizes.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (int i = 0; i < rows.length; i++) ...[
            if (i > 0) SizedBox(height: AppSizes.spacing8),
            rows[i],
          ],
        ],
      ),
    );
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  List<Widget> _buildStoreButtons({
    required String playStore,
    required String appStore,
  }) {
    return [
      if (appStore.isNotEmpty)
        _buildButton(
          url: appStore,
          icon: Icons.apple,
          labelKey: 'appStore',
          backgroundColor: AppColors.textPrimary,
        ),
      if (playStore.isNotEmpty)
        _buildButton(
          url: playStore,
          icon: Icons.play_arrow_rounded,
          labelKey: 'playStore',
          backgroundColor: AppColors.primary,
        ),
    ];
  }

  // 넓을 때: 앱 이름 + 오른쪽 정렬 스토어 버튼 한 줄
  // 좁을 때(모바일): 앱 이름 아래에 스토어 버튼 균등 분할
  Widget _buildGroupRow(String labelKey, List<Widget> storeButtons) {
    final label = Text(
      AppTexts.get(labelKey, lang),
      style: AppTextStyles.body2(lang).copyWith(
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w600,
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < _groupRowBreakpoint) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label,
              SizedBox(height: AppSizes.spacing4),
              Row(children: _buildButtonRow(storeButtons)),
            ],
          );
        }
        return Row(
          children: [
            Expanded(child: label),
            for (int i = 0; i < storeButtons.length; i++) ...[
              SizedBox(width: AppSizes.spacing8),
              storeButtons[i],
            ],
          ],
        );
      },
    );
  }

  static const double _groupRowBreakpoint = 400;

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
