class AppTexts {
  static const Map<String, Map<String, String>> _texts = {
    'en': {
      // Header Section
      'greeting': 'Hello, I\'m Yujin!',
      'jobTitle': 'Flutter Developer',
      'headerDescription': 'I love creating beautiful UI and user experiences',

      // About Section
      'aboutTitle': 'About Me',
      'developmentCard': 'Development',
      'developmentDesc': 'Mobile app development\nwith Flutter',
      'designCard': 'Design',
      'designDesc': 'Very interested in\nUI/UX design',
      'learningCard': 'Learning',
      'learningDesc': 'Love learning\nnew technologies',
      'aboutDetailedIntro': 'I am a Flutter developer passionate about mobile app development.\n'
          'I value user experience and create apps that consider both beautiful UI and performance.\n'
          'I enjoy learning and applying new technologies, and I am constantly growing.',

      // Skills Section
      'skillsTitle': 'Skills & Tools',
      'developmentSkills': 'Development Skills',
      'usedTools': 'Tools Used',

      // Projects Section
      'projectsTitle': 'Projects',
      'projectsSubtitle': 'Let me introduce the projects I\'ve created',
      'shoppingAppTitle': 'Shopping Mall App',
      'shoppingAppDesc': 'A mobile shopping mall app created with Flutter. Implemented real-time data integration with Firebase and payment system.',
      'weatherAppTitle': 'Weather App',
      'weatherAppDesc': 'An app that provides real-time weather information. Applied location-based services and beautiful animations.',
      'todoAppTitle': 'Todo Management App',
      'todoAppDesc': 'An app for efficient todo management. Implemented drag and drop, notification features, etc.',
      'viewCode': 'View Code',
      'viewDemo': 'View Demo',

      // Contact Section
      'contactTitle': 'Let\'s Work Together!',
      'contactSubtitle': 'If you have new projects or collaboration opportunities,\nplease contact me anytime!',
      'email': 'Email',
      'github': 'GitHub',
      'linkedin': 'LinkedIn',
      'sendEmail': 'Send Email',
      'connectSns': 'Or connect via SNS',
    },

    'ko': {
      // Header Section
      'greeting': '안녕하세요, 유진입니다!',
      'jobTitle': 'Flutter 개발자',
      'headerDescription': '아름다운 UI와 사용자 경험을 만드는 것을 좋아합니다',

      // About Section
      'aboutTitle': 'About Me',
      'developmentCard': '개발',
      'developmentDesc': 'Flutter로\n모바일 앱 개발',
      'designCard': '디자인',
      'designDesc': 'UI/UX 디자인에\n관심이 많아요',
      'learningCard': '학습',
      'learningDesc': '새로운 기술을\n배우는 것을 좋아해요',
      'aboutDetailedIntro': '저는 모바일 앱 개발에 열정을 가진 Flutter 개발자입니다.\n'
          '사용자 경험을 중시하며, 아름다운 UI와 성능을 모두 고려한 앱을 만들고 있습니다.\n'
          '새로운 기술을 배우고 적용하는 것을 즐기며, 꾸준히 성장하고 있습니다.',

      // Skills Section
      'skillsTitle': 'Skills & Tools',
      'developmentSkills': '개발 스킬',
      'usedTools': '사용 툴',

      // Projects Section
      'projectsTitle': 'Projects',
      'projectsSubtitle': '제가 만든 프로젝트들을 소개합니다',
      'shoppingAppTitle': '쇼핑몰 앱',
      'shoppingAppDesc': 'Flutter로 제작한 모바일 쇼핑몰 앱입니다. Firebase를 이용한 실시간 데이터 연동과 결제 시스템을 구현했습니다.',
      'weatherAppTitle': '날씨 앱',
      'weatherAppDesc': '실시간 날씨 정보를 제공하는 앱입니다. 위치 기반 서비스와 아름다운 애니메이션을 적용했습니다.',
      'todoAppTitle': '할일 관리 앱',
      'todoAppDesc': '효율적인 할일 관리를 위한 앱입니다. 드래그 앤 드롭, 알림 기능 등을 구현했습니다.',
      'viewCode': '코드 보기',
      'viewDemo': '데모 보기',

      // Contact Section
      'contactTitle': 'Let\'s Work Together!',
      'contactSubtitle': '새로운 프로젝트나 협업 기회가 있으시다면\n언제든지 연락해주세요!',
      'email': 'Email',
      'github': 'GitHub',
      'linkedin': 'LinkedIn',
      'sendEmail': '이메일 보내기',
      'connectSns': '또는 SNS로 연결해주세요',
    },
  };

  static String get(String key, String langCode) {
    return _texts[langCode]?[key] ?? _texts['en']?[key] ?? key;
  }

  static String getCurrentLanguage(String systemLangCode) {
    return systemLangCode == 'ko' ? 'ko' : 'en';
  }
}