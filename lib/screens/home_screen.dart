import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../models/portfolio_data.dart';
import '../widgets/common_widgets.dart';
import 'hero_section.dart';
import 'skills_section.dart';
import 'projects_section.dart';
import 'contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _heroKey = GlobalKey();
  final _skillsKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final scrolled = _scrollController.offset > 50;
      if (scrolled != _scrolled) setState(() => _scrolled = scrolled);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Spacer for navbar
                const SizedBox(height: 70),

                // Sections
                HeroSection(
                  key: _heroKey,
                  onTapProjects: () => _scrollTo(_projectsKey),
                ),
                _AboutBanner(),
                SkillsSection(key: _skillsKey),
                ProjectsSection(key: _projectsKey),
                ContactSection(key: _contactKey),
              ],
            ),
          ),

          // Fixed Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _Navbar(
              scrolled: _scrolled,
              onTapHome: () => _scrollTo(_heroKey),
              onTapSkills: () => _scrollTo(_skillsKey),
              onTapProjects: () => _scrollTo(_projectsKey),
              onTapContact: () => _scrollTo(_contactKey),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Navbar ─────────────────────────────────────────────────────────────────────
class _Navbar extends StatelessWidget {
  final bool scrolled;
  final VoidCallback onTapHome;
  final VoidCallback onTapSkills;
  final VoidCallback onTapProjects;
  final VoidCallback onTapContact;

  const _Navbar({
    required this.scrolled,
    required this.onTapHome,
    required this.onTapSkills,
    required this.onTapProjects,
    required this.onTapContact,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 70,
      decoration: BoxDecoration(
        color: scrolled
            ? AppColors.background.withOpacity(0.92)
            : Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: scrolled ? AppColors.cardBorder : Colors.transparent,
            width: 1,
          ),
        ),
        boxShadow: scrolled
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                )
              ]
            : [],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
        child: Row(
          children: [
            // Logo
            GestureDetector(
              onTap: onTapHome,
              child: GradientText(
                '${PortfolioData.name.split(' ').first}.',
                style: const TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
            ),
            const Spacer(),

            if (!isMobile) ...[
              NavItem(label: 'Home', onTap: onTapHome),
              NavItem(label: 'Skills', onTap: onTapSkills),
              NavItem(label: 'Projects', onTap: onTapProjects),
              NavItem(label: 'Contact', onTap: onTapContact),
              const SizedBox(width: 16),
            ],

            // Hire me button
            NeonButton(
              label: isMobile ? 'Hire' : 'Hire Me',
              onTap: onTapContact,
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 600.ms).slideY(begin: -0.5, end: 0);
  }
}

// ── Stats Banner ───────────────────────────────────────────────────────────────
class _AboutBanner extends StatelessWidget {
  const _AboutBanner();

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatItem(value: '3+', label: 'Years of Experience'),
          _Divider(),
          _StatItem(value: '10+', label: 'Projects Shipped'),
          _Divider(),
          _StatItem(value: '5+', label: 'Apps in Stores'),
          if (!isMobile) ...[
            _Divider(),
            _StatItem(value: '20K+', label: 'Total Downloads'),
          ],
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    return Column(
      children: [
        GradientText(
          value,
          style: TextStyle(
            fontFamily: 'Orbitron',
            fontSize: isMobile ? 28 : 36,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 50,
      color: AppColors.cardBorder,
    );
  }
}
