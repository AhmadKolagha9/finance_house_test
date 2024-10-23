import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppThemes {

  //-----------------Light Theme---------------
  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryColor,
      secondaryHeaderColor: AppColors.primaryColor[100],
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          onPrimary: AppColors.primaryColor,
          secondary: AppColors.secondColor,
          onSecondary: AppColors.textColor,
          onSurface: AppColors.backgroundColor),
      hintColor: AppColors.lightGray,
      primarySwatch: AppColors.primaryColor,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      dividerColor: AppColors.lightGray,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 24.0,
      ),
      primaryIconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 24.0,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.mainColor,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.mainColor),
        titleTextStyle: TextStyle(
            color: AppColors.backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w400),
        iconTheme: IconThemeData(color: AppColors.backgroundColor),
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        displaySmall: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        bodyMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        bodyLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: AppColors.textColor),
        bodySmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        labelLarge: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor),
        labelMedium: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w700,
            color: AppColors.textColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding:
                  WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              backgroundColor:
                  WidgetStateProperty.all<Color>(AppColors.secondColor))),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ));

  //-----------------Dark Theme---------------
  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primaryDarkColor,
      secondaryHeaderColor: AppColors.primaryDarkColor[100],
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryDarkColor,
          primary: AppColors.primaryDarkColor,
          onPrimary: AppColors.primaryDarkColor,
          secondary: AppColors.secondColor,
          onSecondary: AppColors.textDarkColor,
          onSurface: AppColors.backgroundDarkColor),
      hintColor: AppColors.textDarkColor.withOpacity(0.5),
      primarySwatch: AppColors.primaryColor,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      dividerColor: AppColors.lightGray,
      iconTheme: IconThemeData(
        color: AppColors.primaryDarkColor,
        size: 24.0,
      ),
      primaryIconTheme: IconThemeData(
        color: AppColors.primaryDarkColor,
        size: 24.0,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.mainDarkColor,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.mainDarkColor),
        titleTextStyle: TextStyle(
            color: AppColors.backgroundDarkColor,
            fontSize: 16,
            fontWeight: FontWeight.w400),
        iconTheme: IconThemeData(color: AppColors.backgroundDarkColor),
      ),
      textTheme: const TextTheme(
        displayMedium: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textDarkColor),
        displaySmall: TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textDarkColor),
        headlineMedium: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textDarkColor),
        bodyMedium: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textDarkColor),
        bodyLarge: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w700,
            color: AppColors.textDarkColor),
        bodySmall: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textDarkColor),
        labelLarge: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
            color: AppColors.textDarkColor),
        labelMedium: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w700,
            color: AppColors.textDarkColor),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              padding:
                  WidgetStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              backgroundColor:
                  WidgetStateProperty.all<Color>(AppColors.secondColor))),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ));
}
