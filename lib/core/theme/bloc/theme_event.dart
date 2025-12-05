// theme_event.dart
part of 'theme_bloc.dart';

abstract class ThemeEvent {}

class ChangeFontEvent extends ThemeEvent {
  final Fonts font;
  ChangeFontEvent(this.font);
}
