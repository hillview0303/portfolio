import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.blue[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 프로필 이미지 자리 (나중에 추가)
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.blue[200],
              child: Icon(
                Icons.person,
                size: 80,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 40),

            Text(
              '안녕하세요, 유진입니다!',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue[900],
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Flutter 개발자',
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue[700],
              ),
            ),
            SizedBox(height: 40),

            // 간단한 소개 문구
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                '아름다운 UI와 사용자 경험을 만드는 것을 좋아합니다',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue[600],
                  height: 1.5,
                ),
              ),
            ),

            SizedBox(height: 40),

            // 스크롤 다운 아이콘
            Icon(
              Icons.keyboard_arrow_down,
              size: 40,
              color: Colors.blue[400],
            ),
          ],
        ),
      ),
    );
  }
}