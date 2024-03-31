import 'package:flutter/material.dart';

import '../const/app_styles.dart';

class WorkExperienceWidget extends StatelessWidget {
  const WorkExperienceWidget({
    super.key,
    required this.companyName,
    required this.position,
    required this.date,
  });

  final String companyName;
  final String position;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          companyName,
          style: AppStyle.styleWBlackW600S40,
        ),
        const SizedBox(height: 15),
        SelectableText(
          position,
          style: const TextStyle(fontSize: 20),
        ),
        SelectableText(
          date,
          style: const TextStyle(
            fontSize: 20,
            // color: Color(0xFF34C759),
          ),
        ),
      ],
    );
  }
}
