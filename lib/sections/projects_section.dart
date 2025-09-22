import 'package:flutter/material.dart';

class ProjectsSection extends StatelessWidget {
  // 임시 프로젝트 데이터
  final List<Map<String, dynamic>> projects = [
    {
      'title': '쇼핑몰 앱',
      'description': 'Flutter로 제작한 모바일 쇼핑몰 앱입니다. Firebase를 이용한 실시간 데이터 연동과 결제 시스템을 구현했습니다.',
      'tech': ['Flutter', 'Firebase', 'Stripe'],
      'image': 'https://via.placeholder.com/300x200/4285F4/FFFFFF?text=Shopping+App',
      'github': '#',
      'demo': '#',
    },
    {
      'title': '날씨 앱',
      'description': '실시간 날씨 정보를 제공하는 앱입니다. 위치 기반 서비스와 아름다운 애니메이션을 적용했습니다.',
      'tech': ['Flutter', 'API', 'Animation'],
      'image': 'https://via.placeholder.com/300x200/FF9800/FFFFFF?text=Weather+App',
      'github': '#',
      'demo': '#',
    },
    {
      'title': '할일 관리 앱',
      'description': '효율적인 할일 관리를 위한 앱입니다. 드래그 앤 드롭, 알림 기능 등을 구현했습니다.',
      'tech': ['Flutter', 'SQLite', 'Notification'],
      'image': 'https://via.placeholder.com/300x200/4CAF50/FFFFFF?text=Todo+App',
      'github': '#',
      'demo': '#',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      // 프로젝트가 많으면 높이를 더 크게
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height,
      ),
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 80),
      child: Column(
        children: [
          // 섹션 제목
          Text(
            'Projects',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          SizedBox(height: 20),
          Text(
            '제가 만든 프로젝트들을 소개합니다',
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 60),

          // 프로젝트 그리드
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > 800 ? 2 : 1,
              crossAxisSpacing: 40,
              mainAxisSpacing: 40,
              childAspectRatio: 1.2,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              return _buildProjectCard(projects[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 프로젝트 이미지
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              image: DecorationImage(
                image: NetworkImage(project['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 프로젝트 정보
          Padding(
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 제목
                Text(
                  project['title'],
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 10),

                // 설명
                Text(
                  project['description'],
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 15),

                // 기술 스택 칩들
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: (project['tech'] as List<String>)
                      .map((tech) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Text(
                      tech,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ))
                      .toList(),
                ),
                SizedBox(height: 20),

                // 버튼들
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // GitHub 링크 열기
                        },
                        icon: Icon(Icons.code, size: 18),
                        label: Text('코드 보기'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[800],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // 데모 링크 열기
                        },
                        icon: Icon(Icons.launch, size: 18),
                        label: Text('데모 보기'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue[600],
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}