import 'package:flutter/material.dart';
import 'package:my_portfolio_app/const/app_styles.dart';

class WorkExperienceWidget extends StatelessWidget {
  const WorkExperienceWidget({
    super.key,
    required this.companyName,
    required this.position,
    this.date,
    this.description,
  });

  final String companyName;
  final String position;
  final String? date;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          companyName,
          style: AppStyle.styleWBlackW600S28,
        ),
        // const SizedBox(height: 15),
        SelectableText(
          position,
          style: const TextStyle(fontSize: 20),
        ),
        if (date != null)
          SelectableText(
            date!,
            style: const TextStyle(fontSize: 20),
          ),
        if (description != null) ...[
          const SizedBox(height: 12),
          SelectableText(
            description!,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ]
      ],
    );
  }
}
