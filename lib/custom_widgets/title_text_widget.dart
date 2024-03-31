import 'package:flutter/material.dart';

import '../const/app_styles.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.firstText,
    this.secondText,
  });

  final String firstText;
  final String? secondText;

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        text: firstText,
        style: secondText != null
            ? AppStyle.styleWBlackW600S40
            : AppStyle.styleWGreenW600S40,
        children: [
          TextSpan(
            text: secondText,
            style: AppStyle.styleWGreenW600S40,
          ),
        ],
      ),
    );
  }
}
