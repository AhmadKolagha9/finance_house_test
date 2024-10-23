import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:finance_house_test/core/style/app_themes.dart';
import 'package:flutter/material.dart';

import '../../data/prefs.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  final Prefs prefs;

  ThemeBloc(this.prefs) : super(ThemeInitial()) {
    on<ToggleThemeEvent>((event, emit) async {
      final isDarkMode =  prefs.getThemeMode();

      final newTheme = isDarkMode ? _lightTheme : _darkTheme;
       prefs.setThemeMode(!isDarkMode);

      emit(ThemeUpdated(newTheme, isDarkMode));
    });

    on<LoadThemeEvent>((event, emit) async {
      final isDarkMode = prefs.getThemeMode();

      final theme = isDarkMode ? _darkTheme : _lightTheme;
      emit(ThemeUpdated(theme, isDarkMode));
    });
  }

  static final ThemeData _lightTheme = AppThemes.lightTheme;

  static final ThemeData _darkTheme = AppThemes.darkTheme;

  bool getIsDarkTheme() {
    return prefs.getThemeMode();
  }
}