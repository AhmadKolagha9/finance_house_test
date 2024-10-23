part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {
  final ThemeData themeData;
  final bool isDarkTheme;

  const ThemeState(this.themeData, this.isDarkTheme);

  @override
  List<Object?> get props => [themeData];
}

class ThemeInitial extends ThemeState {
  ThemeInitial() : super(_lightTheme, false);

  static final ThemeData _lightTheme = AppThemes.lightTheme;

}

class ThemeUpdated extends ThemeState {
  const ThemeUpdated(super.themeData, super.isDarkTheme);
}