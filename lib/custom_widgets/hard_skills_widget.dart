import 'package:flutter/material.dart';

class HardSkillsWidget extends StatelessWidget {
  const HardSkillsWidget({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40,
          width: 145,
          decoration: BoxDecoration(
            color: const Color(0xFFF4F4F4),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: SelectableText(
            text,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        const SizedBox(height: 15),
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(20),
          minHeight: 10,
          value: ((1 * value) / 3),
          color: const Color(0xFF007AFF),
          backgroundColor: const Color(0xFFB2D7FF),
        ),
      ],
    );
  }
}
