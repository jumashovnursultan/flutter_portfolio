import 'package:flutter/material.dart';

class HardSkillsWidget extends StatelessWidget {
  const HardSkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      {
        'title': 'Languages:',
        'content': 'Dart (Null Safety, Streams, Futures)',
      },
      {
        'title': 'Flutter:',
        'content': '3+ years of production experience (iOS/Android)',
      },
      {
        'title': 'Architecture:',
        'content': 'Clean Architecture, MVVM',
      },
      {
        'title': 'State Management:',
        'content': 'Provider, Riverpod, BLoC',
      },
      {
        'title': 'API:',
        'content': 'REST (Dio, http)',
      },
      {
        'title': 'Local Storage:',
        'content': 'SQLite, SharedPreferences',
      },
      {
        'title': 'Firebase:',
        'content': 'Authentication, Cloud Messaging, Firestore, Crashlytics',
      },
      {
        'title': 'UI/UX:',
        'content': 'Responsive design, custom themes, animations, localization',
      },
      {
        'title': 'Tools:',
        'content': 'Git, Android Studio, VS Code, Postman',
      },
      {
        'title': 'Deployment:',
        'content': 'App Store and Google Play (manual build and publishing)',
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
