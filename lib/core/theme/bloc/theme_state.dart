// theme_state.dart
part of 'theme_bloc.dart';

class ThemeState {
  final ThemeData themeData;
  final Fonts font;

  const ThemeState({required this.themeData, required this.font});

  ThemeState copyWith({ThemeData? themeData, Fonts? font}) {
    return ThemeState(
      themeData: themeData ?? this.themeData,
      font: font ?? this.font,
    );
  }
}
