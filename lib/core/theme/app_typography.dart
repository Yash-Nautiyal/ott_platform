import 'package:flutter/material.dart';

enum Fonts { inter, dmSans, nunitoSans, montserrat, lato, roboto, poppins }

class AppTypography {
  static const Map<Fonts, String> fontMap = {
    Fonts.inter: 'Inter',
    Fonts.dmSans: 'DM Sans',
    Fonts.nunitoSans: 'Nunito Sans',
    Fonts.montserrat: 'Montserrat',
    Fonts.lato: 'Lato',
    Fonts.roboto: 'Roboto',
    Fonts.poppins: 'Poppins',
  };
  static const String secondaryFont = 'Barlow';

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
    fontFamily: secondaryFont,
    fontWeight: extraBold,
    fontSize: 40,
    height: 1.25,
  );

  static TextStyle displayMedium = TextStyle(
    fontFamily: secondaryFont,
    fontWeight: extraBold,
    fontSize: 32,
    height: 1.25,
  );

  static TextStyle displaySmall = TextStyle(
    fontFamily: secondaryFont,
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
