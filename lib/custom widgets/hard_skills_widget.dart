import 'package:flutter/material.dart';

class HardSkillsWidget extends StatelessWidget {
  const HardSkillsWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 145,
          color: const Color(0xFFF4F4F4),
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 15),
        const LinearProgressIndicator(
          minHeight: 15,
          value: ((1 * 1) / 3),
          color: Color(0xFF007AFF),
          backgroundColor: Color(0xFFB2D7FF),
        ),
      ],
    );
  }
}
