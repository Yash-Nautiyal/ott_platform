import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;
import 'package:ott_platform/core/theme/app_pallete.dart' show AppPallete;
import 'package:ott_platform/core/theme/app_typography.dart'
    show AppTypography, Fonts;

class AppTheme {
  static ThemeData darkTheme = buildTheme(font: Fonts.montserrat);
}

ThemeData buildTheme({
  Brightness brightness = Brightness.dark,
  Fonts font = Fonts.montserrat,
}) {
  // Use primary colors directly
  final primaryMain = AppPallete.primaryMain;
  final primaryLight = AppPallete.primaryLight;
  final primaryLighter = AppPallete.primaryLighter;

  final baseTextTheme = TextTheme(
    displayLarge: AppTypography.displayLarge.copyWith(color: AppPallete.white),
    displayMedium: AppTypography.displayMedium.copyWith(
      color: AppPallete.white,
    ),
    displaySmall: AppTypography.displaySmall.copyWith(color: AppPallete.white),
    titleLarge: AppTypography.titleLarge.copyWith(color: AppPallete.white),
    titleMedium: AppTypography.titleMedium.copyWith(color: AppPallete.white),
    titleSmall: AppTypography.titleSmall.copyWith(color: AppPallete.white),
    bodyLarge: AppTypography.bodyLarge.copyWith(color: AppPallete.white),
    bodyMedium: AppTypography.bodyMedium.copyWith(color: AppPallete.grey500),
    bodySmall: AppTypography.bodySmall.copyWith(color: AppPallete.grey600),
    labelLarge: AppTypography.labelLarge.copyWith(color: AppPallete.white),
  );

  // Primary text theme (headings/titles) -> uses selected primary font
  final primaryGoogleTextTheme = GoogleFonts.getTextTheme(
    AppTypography.fontFamily(font),
    baseTextTheme,
  );
  // Secondary text theme (details/body) -> always uses Barlow
  final secondaryGoogleTextTheme = GoogleFonts.getTextTheme(
    AppTypography.secondaryFont,
    baseTextTheme,
  );

  // Mix: headings & titles in primary font, detail/body text in Barlow
  final mixedTextTheme = secondaryGoogleTextTheme.copyWith(
    displayLarge: primaryGoogleTextTheme.displayLarge,
    displayMedium: primaryGoogleTextTheme.displayMedium,
    displaySmall: primaryGoogleTextTheme.displaySmall,
    titleLarge: primaryGoogleTextTheme.titleLarge,
    titleMedium: primaryGoogleTextTheme.titleMedium,
    titleSmall: primaryGoogleTextTheme.titleSmall,
  );

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: primaryMain,
    scaffoldBackgroundColor: const Color.fromARGB(255, 15, 15, 15),
    dividerColor: AppPallete.grey600,
    disabledColor: AppPallete.grey500,
    cardColor: AppPallete.grey800,
    shadowColor: AppPallete.grey900,
    indicatorColor: AppPallete.infoDark,
    hoverColor: const Color.fromARGB(255, 33, 41, 49),
    //-------------------------------------------------------------------------------------

    //Text Theme
    fontFamily: AppTypography.primaryFont,
    textTheme: mixedTextTheme,
    primaryTextTheme: mixedTextTheme,
    //-------------------------------------------------------------------------------------

    //AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppPallete.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    //-------------------------------------------------------------------------------------

    //Color Scheme
    colorScheme: ColorScheme.dark(
      primary: primaryMain,
      primaryFixedDim: primaryLight,
      primaryContainer: primaryLighter,
      primaryFixed: primaryLighter,
      secondary: AppPallete.secondaryDark,
      secondaryFixedDim: AppPallete.secondaryDarker,
      secondaryContainer: AppPallete.secondaryLighter,
      error: AppPallete.errorMain,
      errorContainer: AppPallete.errorMain,
      surface: AppPallete.grey800,
      tertiary: AppPallete.white,
      surfaceContainer: AppPallete.containerColor,
      surfaceDim: AppPallete.grey700,
    ),

    //-------------------------------------------------------------------------------------

    //TextField Theme
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppPallete.grey500),
        borderRadius: BorderRadius.circular(7),
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(7)),
    ),

    //-------------------------------------------------------------------------------------

    //Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            side: BorderSide(color: AppPallete.grey600, width: 1.5),
          ),
        ),
      ),
    ),
    //-------------------------------------------------------------------------------------

    //Check Box Theme
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: AppPallete.grey500, width: 1.5),
      checkColor: const WidgetStatePropertyAll(AppPallete.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    //-------------------------------------------------------------------------------------

    //Icon Button Theme
    iconButtonTheme: const IconButtonThemeData(
      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.all(5)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    //-------------------------------------------------------------------------------------

    //TimePicker Theme
    timePickerTheme: TimePickerThemeData(
      confirmButtonStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: WidgetStatePropertyAll(AppPallete.white),
        foregroundColor: WidgetStatePropertyAll(AppPallete.grey800),
      ),
      cancelButtonStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        foregroundColor: WidgetStatePropertyAll(AppPallete.grey500),
      ),
      dayPeriodTextColor: WidgetStateColor.resolveWith(
        (states) =>
            states.contains(WidgetState.selected)
                ? AppPallete.grey800
                : AppPallete.white,
      ),
      dayPeriodColor: WidgetStateColor.resolveWith(
        (states) =>
            states.contains(WidgetState.selected)
                ? AppPallete.white
                : AppPallete.grey800,
      ),
    ),
    //-------------------------------------------------------------------------------------

    //DatePicker Theme
    datePickerTheme: DatePickerThemeData(
      dividerColor: AppPallete.grey500,
      dayStyle: AppTypography.bodyMedium,
      headerHeadlineStyle: AppTypography.displayMedium,
      yearStyle: AppTypography.bodyMedium,
      weekdayStyle: AppTypography.bodyMedium,
      confirmButtonStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: WidgetStatePropertyAll(AppPallete.white),
        foregroundColor: WidgetStatePropertyAll(AppPallete.grey800),
      ),
      cancelButtonStyle: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        foregroundColor: WidgetStatePropertyAll(AppPallete.grey500),
      ),
      rangeSelectionBackgroundColor: primaryMain.withOpacity(.15),
      rangePickerShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    //-------------------------------------------------------------------------------------

    //Switch Theme
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStatePropertyAll(AppPallete.black),
      trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
      trackColor: WidgetStatePropertyAll(AppPallete.white),
    ),
  );
}
