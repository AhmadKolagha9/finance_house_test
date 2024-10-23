import 'package:finance_house_test/core/style/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screen/home_screen/home_screen.dart';
import '../utlis/injection.dart';
import 'bloc/theme_bloc.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  final ThemeBloc? themeBloc = sl<ThemeBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      bloc: themeBloc,
      builder: (context, state) {
        return MaterialApp(
          darkTheme: AppThemes.darkTheme,
          theme: state.themeData,
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        );
      },
    );
  }
}
