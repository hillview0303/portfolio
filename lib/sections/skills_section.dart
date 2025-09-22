import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  // 스킬 데이터
  final List<Map<String, dynamic>> skills = [
    {'name': 'Flutter', 'level': 0.9, 'color': Colors.blue},
    {'name': 'Dart', 'level': 0.8, 'color': Colors.blue[700]},
    {'name': 'Firebase', 'level': 0.7, 'color': Colors.orange},
    {'name': 'Android', 'level': 0.6, 'color': Colors.green},
    {'name': 'iOS', 'level': 0.5, 'color': Colors.grey},
    {'name': 'Git', 'level': 0.8, 'color': Colors.red},
  ];

  final List<String> tools = [
    'Android Studio', 'VS Code', 'Figma', 'GitHub', 'Postman', 'Adobe XD'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.grey[50],
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 섹션 제목
            Text(
              'Skills & Tools',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 60),

            // 스킬과 툴을 나란히 배치
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 스킬 프로그레스 바
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '개발 스킬',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 30),
                      ...skills.map((skill) => _buildSkillBar(skill)).toList(),
                    ],
                  ),
                ),

                SizedBox(width: 80),

                // 툴 칩들
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        '사용 툴',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 30),
                      Wrap(
                        spacing: 15,
                        runSpacing: 15,
                        children: tools.map((tool) => _buildToolChip(tool)).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 스킬 프로그레스 바 위젯
  Widget _buildSkillBar(Map<String, dynamic> skill) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 스킬명과 퍼센트
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                skill['name'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                '${(skill['level'] * 100).round()}%',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          SizedBox(height: 8),

          // 프로그레스 바
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: skill['level'],
              child: Container(
                decoration: BoxDecoration(
                  color: skill['color'],
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 툴 칩 위젯
  Widget _buildToolChip(String tool) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey[300]!),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        tool,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}