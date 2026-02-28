import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

// ── Animated Grid Background ───────────────────────────────────────────────────
class GridBackground extends StatefulWidget {
  final Widget child;

  const GridBackground({super.key, required this.child});

  @override
  State<GridBackground> createState() => _GridBackgroundState();
}

class _GridBackgroundState extends State<GridBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        // Gradient backdrop
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(-0.3, -0.5),
                radius: 1.2,
                colors: [
                  Color(0xFF0D1B35),
                  Color(0xFF080B14),
                ],
              ),
            ),
          ),
        ),
        // Grid lines
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => CustomPaint(
              painter: _GridPainter(_controller.value),
            ),
          ),
        ),
        // Glow orbs
        Positioned(
          top: -100,
          right: -100,
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.purple.withOpacity(0.12),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -150,
          left: -100,
          child: Container(
            width: 600,
            height: 600,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AppColors.cyan.withOpacity(0.07),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        widget.child,
      ],
    );
  }
}

class _GridPainter extends CustomPainter {
  final double progress;

  _GridPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.cyan.withOpacity(0.04)
      ..strokeWidth = 1;

    const spacing = 60.0;

    // Vertical lines
    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    // Horizontal lines
    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Animated dots at intersections
    final dotPaint = Paint()..style = PaintingStyle.fill;

    final dotSpacing = spacing * 3;
    for (double x = 0; x <= size.width; x += dotSpacing) {
      for (double y = 0; y <= size.height; y += dotSpacing) {
        final phase = (x + y) / (size.width + size.height);
        final t = (progress + phase) % 1.0;
        final opacity = (math.sin(t * math.pi * 2) * 0.5 + 0.5) * 0.3;
        dotPaint.color = AppColors.cyan.withOpacity(opacity);
        canvas.drawCircle(Offset(x, y), 2, dotPaint);
      }
    }
  }

  @override
  bool shouldRepaint(_GridPainter old) => old.progress != progress;
}
