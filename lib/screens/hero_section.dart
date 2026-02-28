import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web/web.dart' as web;

import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../models/portfolio_data.dart';
import '../widgets/common_widgets.dart';
import '../widgets/grid_background.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({super.key, required this.onTapProjects});

  final VoidCallback onTapProjects;

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late final AnimationController _cursorController;
  bool _showCursor = true;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed) {
          Future.delayed(const Duration(milliseconds: 600), () {
            if (mounted) setState(() => _showCursor = !_showCursor);
            _cursorController.reset();
            _cursorController.forward();
          });
        }
      });
    _cursorController.forward();
  }

  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) await launchUrl(uri);
  }

  void downloadFromUrl(String url, String fileName) {
    final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
    anchor.href = url;
    anchor.download = fileName;
    anchor.click();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return GridBackground(
      child: Container(
        constraints: const BoxConstraints(minHeight: 700),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 24 : 80,
          vertical: 120,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
              decoration: BoxDecoration(
                color: AppColors.cyan.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: AppColors.cyan.withOpacity(0.3),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                      shape: BoxShape.circle,
                    ),
                  )
                      .animate(onPlay: (c) => c.repeat())
                      .fadeIn(duration: 600.ms)
                      .then()
                      .fadeOut(duration: 600.ms),
                  const SizedBox(width: 8),
                  Text(
                    'Available for hire',
                    style: TextStyle(
                      color: AppColors.cyan,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
                .animate()
                .fadeIn(delay: 200.ms, duration: 600.ms)
                .slideY(begin: 0.3, end: 0),

            const SizedBox(height: 32),

            // Name with terminal cursor
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: isMobile ? 42 : 72,
                    ),
                children: [
                  const TextSpan(text: 'Hi, I\'m\n'),
                  TextSpan(
                    text: PortfolioData.name,
                    style: TextStyle(
                      foreground: Paint()
                        ..shader = AppColors.gradient2.createShader(
                          const Rect.fromLTWH(0, 0, 400, 80),
                        ),
                    ),
                  ),
                  TextSpan(
                    text: _showCursor ? '_' : ' ',
                    style: const TextStyle(color: AppColors.cyan),
                  ),
                ],
              ),
            )
                .animate()
                .fadeIn(delay: 400.ms, duration: 700.ms)
                .slideY(begin: 0.2, end: 0),

            const SizedBox(height: 16),

            // Role
            Text(
              '${PortfolioData.level} ${PortfolioData.role}',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: isMobile ? 20 : 26,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5,
              ),
            )
                .animate()
                .fadeIn(delay: 600.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0),

            const SizedBox(height: 24),

            // Bio
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 560),
              child: Text(
                PortfolioData.bio,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ).animate().fadeIn(delay: 800.ms, duration: 600.ms),

            const SizedBox(height: 48),

            // CTA buttons
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                NeonButton(
                  label: 'View Projects',
                  icon: Icons.rocket_launch_rounded,
                  onTap: widget.onTapProjects,
                ),
                NeonButton(
                  label: 'Download CV',
                  outlined: true,
                  icon: Icons.download_rounded,
                  onTap: () => downloadFromUrl(
                      'assets/files/Flutter Developer (Jumashov Nursultan).pdf',
                      'Flutter Developer (Jumashov Nursultan).pdf'),
                ),
              ],
            )
                .animate()
                .fadeIn(delay: 1000.ms, duration: 600.ms)
                .slideY(begin: 0.2, end: 0),

            const SizedBox(height: 48),

            // Social links
            Row(
              children: [
                _SocialIcon(
                  icon: Icons.code_rounded,
                  label: 'GitHub',
                  onTap: () => _launch(PortfolioData.githubUrl),
                ),
                const SizedBox(width: 12),
                _SocialIcon(
                  icon: Icons.link_rounded,
                  label: 'LinkedIn',
                  onTap: () => _launch(PortfolioData.linkedinUrl),
                ),
                const SizedBox(width: 12),
                _SocialIcon(
                  icon: Icons.send_rounded,
                  label: 'Telegram',
                  onTap: () => _launch(PortfolioData.telegramUrl),
                ),
              ],
            ).animate().fadeIn(delay: 1200.ms, duration: 600.ms),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialIcon({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.cyan.withOpacity(0.1)
                : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: _hovered
                  ? AppColors.cyan.withOpacity(0.5)
                  : AppColors.cardBorder,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                widget.icon,
                color: _hovered ? AppColors.cyan : AppColors.textSecondary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: _hovered ? AppColors.cyan : AppColors.textSecondary,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
