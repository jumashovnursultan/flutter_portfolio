import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../models/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    const skills = PortfolioData.skills;

    final categories = skills.map((s) => s.category).toSet().toList();

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(label: '02_skills', title: 'Tech Stack'),
          const SizedBox(height: 60),

          // Skill bars grid
          isMobile
              ? Column(
                  children: _buildSkillBars(skills),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: _buildSkillBars(
                          skills.sublist(0, (skills.length / 2).ceil()),
                        ),
                      ),
                    ),
                    const SizedBox(width: 60),
                    Expanded(
                      child: Column(
                        children: _buildSkillBars(
                          skills.sublist((skills.length / 2).ceil()),
                        ),
                      ),
                    ),
                  ],
                ),

          const SizedBox(height: 72),

          // Tech category chips
          const SectionTitle(label: '', title: ''),
          const Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _CategoryCard(
                emoji: '📱',
                title: 'Mobile',
                description: 'Flutter, Dart, iOS & Android',
              ),
              _CategoryCard(
                emoji: '🏗️',
                title: 'Architecture',
                description: 'Clean Arch, MVVM, BLoC, Riverpod',
              ),
              _CategoryCard(
                emoji: '☁️',
                title: 'Backend',
                description: 'Firebase, REST, Web Socket',
              ),
              _CategoryCard(
                emoji: '🛠️',
                title: 'Tools',
                description: 'Git, Figma',
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildSkillBars(List<Skill> skills) {
    return skills
        .asMap()
        .entries
        .map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: AnimatedSkillBar(name: e.value.name, level: e.value.level)
                  .animate()
                  .fadeIn(delay: (e.key * 100).ms, duration: 500.ms),
            ))
        .toList();
  }
}

class _CategoryCard extends StatefulWidget {
  final String emoji;
  final String title;
  final String description;

  const _CategoryCard({
    required this.emoji,
    required this.title,
    required this.description,
  });

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 200,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.cardBorder : AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _hovered
                ? AppColors.cyan.withOpacity(0.4)
                : AppColors.cardBorder,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.cyan.withOpacity(0.08),
                    blurRadius: 24,
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 12),
            Text(
              widget.title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.description,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
