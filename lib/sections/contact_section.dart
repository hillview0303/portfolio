import 'package:flutter/material.dart';

class ContactSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue[900]!,
            Colors.blue[700]!,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 연락처 아이콘
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mail_outline,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),

            // 제목
            Text(
              'Let\'s Work Together!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),

            // 부제목
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                '새로운 프로젝트나 협업 기회가 있으시다면\n언제든지 연락해주세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  height: 1.6,
                ),
              ),
            ),
            SizedBox(height: 50),

            // 연락처 정보들
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildContactItem(
                  icon: Icons.email,
                  label: 'Email',
                  value: 'yujin@example.com',
                  onTap: () {
                    // 이메일 앱 열기
                  },
                ),
                _buildContactItem(
                  icon: Icons.code,
                  label: 'GitHub',
                  value: 'github.com/yujin',
                  onTap: () {
                    // GitHub 프로필 열기
                  },
                ),
                _buildContactItem(
                  icon: Icons.work,
                  label: 'LinkedIn',
                  value: 'linkedin.com/in/yujin',
                  onTap: () {
                    // LinkedIn 프로필 열기
                  },
                ),
              ],
            ),
            SizedBox(height: 50),

            // 메인 연락 버튼
            ElevatedButton.icon(
              onPressed: () {
                // 이메일 앱 열기 기능 구현
              },
              icon: Icon(Icons.send, size: 20),
              label: Text('이메일 보내기'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue[800],
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 60),

            // 소셜 미디어 아이콘들
            Text(
              '또는 SNS로 연결해주세요',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white60,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(Icons.facebook, () {}),
                SizedBox(width: 20),
                _buildSocialIcon(Icons.camera_alt, () {}), // Instagram
                SizedBox(width: 20),
                _buildSocialIcon(Icons.alternate_email, () {}), // Twitter
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          size: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}