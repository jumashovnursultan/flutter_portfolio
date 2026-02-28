import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../models/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1000;

    return Container(
      color: AppColors.background,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(label: '03_projects', title: 'Featured Work'),
          const SizedBox(height: 60),
          isMobile
              ? Column(
                  children: _buildProjectCards(isMobile),
                )
              : _ProjectGrid(
                  projects: PortfolioData.projects, onLaunch: _launch),
        ],
      ),
    );
  }

  List<Widget> _buildProjectCards(bool isMobile) {
    return PortfolioData.projects
        .asMap()
        .entries
        .map((e) => Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: _ProjectCard(project: e.value)
                  .animate()
                  .fadeIn(delay: (e.key * 150).ms, duration: 600.ms)
                  .slideY(begin: 0.2, end: 0),
            ))
        .toList();
  }
}

class _ProjectGrid extends StatelessWidget {
  final List<Project> projects;
  final Future<void> Function(String) onLaunch;

  const _ProjectGrid({required this.projects, required this.onLaunch});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 520,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1.25,
      ),
      itemCount: projects.length,
      itemBuilder: (context, i) => _ProjectCard(project: projects[i])
          .animate()
          .fadeIn(delay: (i * 150).ms, duration: 600.ms)
          .slideY(begin: 0.2, end: 0),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.project;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? AppColors.cyan.withOpacity(0.5)
                : AppColors.cardBorder,
            width: 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.cyan.withOpacity(0.1),
                    blurRadius: 40,
                    spreadRadius: 0,
                  )
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(p.emoji, style: const TextStyle(fontSize: 30)),
                const Spacer(),
                // GitHub
                if (p.githubUrl != null)
                  _LinkBtn(
                    icon: Icons.code_rounded,
                    tooltip: 'GitHub',
                    onTap: () => _launch(p.githubUrl!),
                  ),
                // Landing (если есть — вместо/рядом со сторами)
                if (p.landingUrl != null) ...[
                  const SizedBox(width: 6),
                  _LinkBtn(
                    icon: Icons.language_rounded,
                    tooltip: 'Website',
                    onTap: () => _launch(p.landingUrl!),
                  ),
                ],
                // App Store
                if (p.appStoreUrl != null) ...[
                  const SizedBox(width: 6),
                  _LinkBtn(
                    icon: Icons.apple_rounded,
                    tooltip: 'App Store',
                    onTap: () => _launch(p.appStoreUrl!),
                  ),
                ],
                // Play Market
                if (p.playStoreUrl != null) ...[
                  const SizedBox(width: 6),
                  _LinkBtn(
                    icon: Icons.shop_rounded,
                    tooltip: 'Play Market',
                    color: AppColors.green,
                    onTap: () => _launch(p.playStoreUrl!),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),

            // Category
            Text(
              p.category.toUpperCase(),
              style: const TextStyle(
                color: AppColors.cyan,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(height: 8),

            // Title
            Text(
              p.title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              p.description,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.6,
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),

            const SizedBox(height: 16),

            // Tech chips
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: p.technologies
                  .take(4)
                  .map((t) => TechChip(label: t))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LinkBtn extends StatefulWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final Color color;

  const _LinkBtn({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.color = AppColors.cyan,
  });

  @override
  State<_LinkBtn> createState() => _LinkBtnState();
}

class _LinkBtnState extends State<_LinkBtn> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: widget.tooltip,
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: _hovered
                  ? widget.color.withOpacity(0.15)
                  : AppColors.surfaceLight,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: _hovered
                    ? widget.color.withOpacity(0.5)
                    : AppColors.cardBorder,
              ),
            ),
            child: Icon(
              widget.icon,
              color: _hovered ? widget.color : AppColors.textSecondary,
              size: 16,
            ),
          ),
        ),
      ),
    );
  }
}
