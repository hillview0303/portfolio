import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 섹션 제목
            Text(
              'About Me',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 60),

            // 자기소개 카드들
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoCard(
                  icon: Icons.code,
                  title: '개발',
                  description: 'Flutter로\n모바일 앱 개발',
                ),
                _buildInfoCard(
                  icon: Icons.design_services,
                  title: '디자인',
                  description: 'UI/UX 디자인에\n관심이 많아요',
                ),
                _buildInfoCard(
                  icon: Icons.lightbulb,
                  title: '학습',
                  description: '새로운 기술을\n배우는 것을 좋아해요',
                ),
              ],
            ),

            SizedBox(height: 60),

            // 자세한 소개
            Container(
              constraints: BoxConstraints(maxWidth: 600),
              child: Text(
                '저는 모바일 앱 개발에 열정을 가진 Flutter 개발자입니다.\n'
                    '사용자 경험을 중시하며, 아름다운 UI와 성능을 모두 고려한 앱을 만들고 있습니다.\n'
                    '새로운 기술을 배우고 적용하는 것을 즐기며, 꾸준히 성장하고 있습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[700],
                  height: 1.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 50,
            color: Colors.blue[600],
          ),
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}