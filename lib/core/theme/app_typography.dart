import 'package:flutter/material.dart';

enum Fonts { montserrat, poppins, dosis, jura }

class AppTypography {
  static const Map<Fonts, String> fontMap = {
    Fonts.montserrat: 'Montserrat',
    Fonts.poppins: 'Poppins',
    Fonts.dosis: 'Dosis',
    Fonts.jura: 'Nunito',
  };
  static const String secondaryFont = 'Jura';

  static String primaryFont = fontMap[Fonts.montserrat]!;

  static String fontFamily(Fonts font) => fontMap[font]!;

  static void setPrimaryFont(Fonts font) {
    primaryFont = fontFamily(font);
  }

  // Font Weights
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;

  // Headings
  static TextStyle displayLarge = TextStyle(
    fontWeight: extraBold,
    fontSize: 40,
    height: 1.25,
  );

  static TextStyle displayMedium = TextStyle(
    fontWeight: extraBold,
    fontSize: 32,
    height: 1.25,
  );

  static TextStyle displaySmall = TextStyle(
    fontWeight: bold,
    fontSize: 26,
    height: 1.25,
  );

  // Title Text
  static const TextStyle titleLarge = TextStyle(
    fontWeight: semiBold,
    fontSize: 20,
    height: 1.5,
  );

  static const TextStyle titleMedium = TextStyle(
    fontWeight: semiBold,
    fontSize: 16,
    height: 1.5,
  );

  static const TextStyle titleSmall = TextStyle(
    fontWeight: semiBold,
    fontSize: 14,
    height: 1.5,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(fontSize: 16, height: 1.5);

  static const TextStyle bodyMedium = TextStyle(fontSize: 14, height: 1.5);

  static const TextStyle bodySmall = TextStyle(fontSize: 12, height: 1.5);

  // Button Text
  static const TextStyle labelLarge = TextStyle(
    fontWeight: bold,
    fontSize: 14,
    height: 1.7,
  );
}
