import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor primaryColor =
  generateMaterialColor(const Color(0xFF147C76));
  static const Color mainColor = Color(0xFF147C76);
  static MaterialColor primaryDarkColor =
  generateMaterialColor(const Color(0xFF89DEDC));
  static const Color mainDarkColor = Color(0xFF89DEDC);
  static const Color secondColor = Color(0xFFF5B22F);
  static const Color textColor = Color(0xFF333333);
  static const Color textDarkColor = Color(0xFFBAB5B5);
  static final Color shimmerColor = Colors.grey.shade100;
  static final Color baserColor = Colors.grey.shade300;
  static const Color backgroundColor = Color(0xFFBACAED);
  static const Color backgroundDarkColor = Color(0xB8080E2A);
  static const Color lightGray = Color(0xFFABB0BF);
  static const Color transparent = Color(0x00000000);
}

MaterialColor generateMaterialColor(Color color) {
  List<Color> swatchColors = [
    color,
    color.withOpacity(0.8),
    color.withOpacity(0.6),
    color.withOpacity(0.4),
    color.withOpacity(0.2),
  ];

  return MaterialColor(color.value, <int, Color>{
    50: swatchColors[0],
    100: swatchColors[1],
    200: swatchColors[2],
    300: swatchColors[3],
    400: swatchColors[4],
    500: color,
    600: color.withOpacity(0.8),
    700: color.withOpacity(0.6),
    800: color.withOpacity(0.4),
    900: color.withOpacity(0.2),
  });
}