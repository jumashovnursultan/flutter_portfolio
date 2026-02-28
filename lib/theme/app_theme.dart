import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const background = Color(0xFF080B14);
  static const surface = Color(0xFF0E1320);
  static const surfaceLight = Color(0xFF141929);
  static const card = Color(0xFF111827);
  static const cardBorder = Color(0xFF1E2D45);

  static const cyan = Color(0xFF00D4FF);
  static const cyanDark = Color(0xFF0099BB);
  static const purple = Color(0xFF7C3AED);
  static const purpleLight = Color(0xFFA855F7);
  static const green = Color(0xFF10B981);

  static const textPrimary = Color(0xFFF1F5F9);
  static const textSecondary = Color(0xFF94A3B8);
  static const textMuted = Color(0xFF475569);

  static const gradient1 = LinearGradient(
    colors: [cyan, purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradient2 = LinearGradient(
    colors: [Color(0xFF00D4FF), Color(0xFF7C3AED)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}

class AppTheme {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.cyan,
          secondary: AppColors.purple,
          background: AppColors.background,
          surface: AppColors.surface,
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(ThemeData.dark().textTheme).copyWith(
          displayLarge: GoogleFonts.orbitron(
            fontSize: 72,
            fontWeight: FontWeight.w900,
            color: AppColors.textPrimary,
            letterSpacing: -2,
          ),
          displayMedium: GoogleFonts.orbitron(
            fontSize: 48,
            fontWeight: FontWeight.w800,
            color: AppColors.textPrimary,
            letterSpacing: -1,
          ),
          displaySmall: GoogleFonts.orbitron(
            fontSize: 36,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
          headlineMedium: GoogleFonts.spaceGrotesk(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
          bodyLarge: GoogleFonts.spaceGrotesk(
            fontSize: 18,
            color: AppColors.textSecondary,
            height: 1.7,
          ),
          bodyMedium: GoogleFonts.spaceGrotesk(
            fontSize: 16,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
          labelLarge: GoogleFonts.jetBrainsMono(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.cyan,
            letterSpacing: 1.5,
          ),
        ),
      );
}
