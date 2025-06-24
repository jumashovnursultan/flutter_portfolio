import 'package:flutter/material.dart';

class HardSkillsWidget extends StatelessWidget {
  const HardSkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        'title': 'Языки:',
        'content':
            'Dart (Null Safety, Streams, Futures), JavaScript (базовый уровень)',
      },
      {
        'title': 'Flutter:',
        'content': '3.5 года опыта в проде (iOS/Android/Web)',
      },
      {
        'title': 'Архитектура:',
        'content': 'Clean Architecture, MVVM, BLoC, Provider, Riverpod',
      },
      {
        'title': 'Состояние:',
        'content': 'Provider, Riverpod, GetX (по проекту)',
      },
      {
        'title': 'API:',
        'content': 'REST, Dio, http, GraphQL (базово)',
      },
      {
        'title': 'Базы данных:',
        'content': 'Hive, SharedPreferences, Firebase Firestore',
      },
      {
        'title': 'Firebase:',
        'content': 'Аутентификация, Cloud Messaging, Crashlytics',
      },
      {
        'title': 'Уведомления:',
        'content': 'flutter_local_notifications, Firebase Messaging',
      },
      {
        'title': 'CI/CD:',
        'content':
            'GitHub Actions, Fastlane, публикация в Google Play и App Store',
      },
      {
        'title': 'Тестирование:',
        'content': 'Unit, Widget и Integration tests',
      },
      {
        'title': 'UI/UX:',
        'content': 'Адаптивный дизайн, кастомные темы, анимации',
      },
      {
        'title': 'Инструменты:',
        'content': 'Git, Android Studio, VS Code, Postman',
      },
      {
        'title': 'Дополнительно:',
        'content': 'Flutter Web, локализация (.intl, .arb, flutter_gen)',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🛠 Технические навыки',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...skills.map((skill) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    TextSpan(
                      text: '${skill['title']} ',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: skill['content'],
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
