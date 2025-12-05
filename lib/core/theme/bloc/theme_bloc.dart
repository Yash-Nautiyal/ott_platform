import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ott_platform/core/theme/app_theme.dart' show buildTheme;
import 'package:ott_platform/core/theme/app_typography.dart'
    show AppTypography, Fonts;
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences _prefs;

  ThemeBloc._(this._prefs, ThemeState initial) : super(initial) {
    on<ChangeFontEvent>(_onChangeFont);
  }

  static Future<ThemeBloc> create() async {
    final prefs = await SharedPreferences.getInstance();
    final savedFont =
        Fonts.values[prefs.getInt('theme_font') ?? Fonts.montserrat.index];
    final theme = buildTheme(brightness: Brightness.dark, font: savedFont);

    return ThemeBloc._(prefs, ThemeState(themeData: theme, font: savedFont));
  }

  void _onChangeFont(ChangeFontEvent event, Emitter<ThemeState> emit) {
    _prefs.setInt('theme_font', event.font.index);
    AppTypography.setPrimaryFont(event.font);

    final newTheme = buildTheme(brightness: Brightness.dark, font: event.font);

    emit(state.copyWith(themeData: newTheme, font: event.font));
  }
}
