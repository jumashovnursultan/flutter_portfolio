class Project {
  final String title;
  final String description;
  final List<String> technologies;
  final String? githubUrl;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final String? landingUrl;
  final String emoji;
  final String category;

  const Project({
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.appStoreUrl,
    this.playStoreUrl,
    this.landingUrl,
    required this.emoji,
    required this.category,
  });

  bool get hasStoreLinks => appStoreUrl != null || playStoreUrl != null;
  bool get hasLinks => githubUrl != null || hasStoreLinks || landingUrl != null;
}

class Skill {
  final String name;
  final int level; // 0-100
  final String category;

  const Skill({
    required this.name,
    required this.level,
    required this.category,
  });
}

// ── Portfolio Data ─────────────────────────────────────────────────────────────

class PortfolioData {
  // ── Personal Info ──────────────────────────────────────────────────────────
  static const name = 'Nursultan Jumashov';
  static const role = 'Flutter Developer';
  static const level = 'Middle';
  static const bio = 'Passionate Flutter developer with experience building '
      'high-performance cross-platform applications. I turn ideas into '
      'beautiful, fast mobile and web apps.';
  static const email = 'nursultanjumashovv@gmail.com';
  static const githubUrl = 'https://github.com/jumashovnursultan';
  static const linkedinUrl = 'https://linkedin.com/in/nursultan-jumashov';
  static const telegramUrl = 'https://t.me/nursultanjumashov';
  static const location = 'Bishkek, Kyrgyzstan';

  // ── Skills ─────────────────────────────────────────────────────────────────
  static const skills = [
    Skill(name: 'Flutter', level: 90, category: 'Mobile'),
    Skill(name: 'Dart', level: 88, category: 'Language'),
    Skill(name: 'BLoC / Cubit', level: 85, category: 'State Management'),
    Skill(name: 'Riverpod', level: 80, category: 'State Management'),
    Skill(name: 'Firebase', level: 82, category: 'Backend'),
    Skill(name: 'REST API', level: 88, category: 'Integration'),
    Skill(name: 'Web Socket', level: 88, category: 'Integration'),
    Skill(name: 'Clean Architecture', level: 78, category: 'Architecture'),
    Skill(name: 'Figma', level: 65, category: 'Design'),
    Skill(name: 'Flutter Web', level: 75, category: 'Web'),
  ];

  // ── Projects ───────────────────────────────────────────────────────────────
  static const projects = [
    Project(
        title: 'Мал Базар',
        description:
            'Digital agro-platform for Kyrgyzstan. Deep linking via Firebase '
            'Dynamic Links, YouTube video playback, and favorites with '
            'local caching and server sync.',
        technologies: [
          'Flutter',
          'BLoC',
          'Firebase',
          'REST API',
          'OAuth 2.0',
          'Dynamic Links'
        ],
        githubUrl: 'https://github.com/yourname/mal-bazar',
        emoji: '🐑',
        category: 'AgriTech',
        landingUrl: 'https://malbazar.me/'),
    Project(
        title: 'Chelnok',
        description:
            'Marketplace for the sewing industry with multi-role system '
            'for workshops, clients and users. 9 ad categories, ratings & reviews, '
            'and OAuth 2.0 auth via Google, Apple and Yandex.',
        technologies: [
          'Flutter',
          'Riverpod',
          'Firebase',
          'REST API',
          'OAuth 2.0'
        ],
        githubUrl: 'https://github.com/yourname/chelnok',
        emoji: '🧵',
        category: 'E-Commerce',
        landingUrl: 'https://chelnok.kg/'),
    Project(
        title: 'TOP',
        description:
            'Football social platform with 70+ screens. Real-time chat with '
            'voice messages, tournament management (league/knockout/playoff), '
            'tactical formation builder with canvas rendering, and field booking '
            'with payment integration.',
        technologies: [
          'Flutter',
          'Riverpod',
          'WebSocket',
          'Firebase',
          'Google Maps SDK',
          'OAuth 2.0'
        ],
        githubUrl: 'https://github.com/yourname/top',
        emoji: '⚽',
        category: 'Sports',
        landingUrl: 'https://topsport.asia/'),
    Project(
      title: 'ADHDo.it',
      description:
          'Task planning app with offline-first architecture and auto sync. '
          'Multi-provider auth, full CRUD with local caching via Sqflite, '
          'and background sync service for data consistency.',
      technologies: ['Flutter', 'Riverpod', 'Sqflite', 'Firebase', 'REST API'],
      githubUrl: 'https://github.com/yourname/adhdoit',
      emoji: '✅',
      category: 'Productivity',
      appStoreUrl: 'https://apps.apple.com/us/app/dondone/id6749378933',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=dev.adhdo.dondone&hl=en',
    ),
    Project(
        title: 'Osh Online',
        description: 'Classifieds platform for posting and browsing ads. '
            'Optimized list performance, refactored legacy codebase, '
            'and improved ad creation flows with better UX and validation.',
        technologies: ['Flutter', 'BLoC', 'Firebase', 'REST API'],
        githubUrl: 'https://github.com/yourname/osh-online',
        emoji: '📋',
        category: 'Classifieds',
        landingUrl: 'https://oshonline.kg/'),
    Project(
      title: 'Appkel & Appkel Sat',
      description:
          'Dual delivery platform — customer app and seller/courier management app. '
          'Full e-commerce flow, real-time order tracking via WebSocket, '
          'and MBank payment integration.',
      technologies: [
        'Flutter',
        'Riverpod',
        'WebSocket',
        'Firebase',
        'REST API',
        'MBank'
      ],
      githubUrl: 'https://github.com/yourname/appkel',
      emoji: '🚚',
      category: 'Delivery',
      appStoreUrl: 'https://apps.apple.com/us/app/appkel/id6502715512',
    ),
    Project(
        title: 'Ак-Эмгек',
        description: 'Job search platform for both applicants and recruiters. '
            'Multi-provider auth (Google, Apple), vacancy maps via Google Maps, '
            'and recruiter verification system.',
        technologies: [
          'Flutter',
          'BLoC',
          'Firebase',
          'Google Maps SDK',
          'WebSocket',
          'OAuth 2.0'
        ],
        githubUrl: 'https://github.com/yourname/ak-emgek',
        emoji: '💼',
        category: 'Recruitment',
        playStoreUrl:
            'https://play.google.com/store/apps/details?id=dev.odigital.ak_emgek&hl=en'),
    Project(
      title: 'DevPortfolio',
      description:
          'This very website! A Flutter Web portfolio with smooth animations, '
          'dark theme UI, and responsive design across all screen sizes.',
      technologies: ['Flutter Web', 'flutter_animate', 'Google Fonts'],
      githubUrl: 'https://jumashovnursultan.github.io/',
      emoji: '🚀',
      category: 'Web',
    ),
  ];
}
