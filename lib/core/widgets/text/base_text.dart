import 'package:flutter/material.dart';

import '../../style/app_colors.dart';

class BaseText extends StatelessWidget {
  final String? title;
  final bool? isLoading;
  final double? size;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final double? height;
  final String? fontFamily;
  final int? maxLines;
  final TextOverflow overflow;
  final TextStyle? textStyle;

  const BaseText(
      {super.key,
      required this.title,
      this.size,
      this.fontFamily,
      this.color = AppColors.textColor,
      this.textAlign,
      this.decoration,
      this.fontWeight = FontWeight.w400,
      this.height,
      this.maxLines = 100,
      this.textStyle,
      this.overflow = TextOverflow.ellipsis,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      maxLines: maxLines,
      overflow: overflow,
      softWrap: true,
      textAlign: textAlign,
      style: textStyle ??
          TextStyle(
              fontSize: size ?? 16,
              decoration: decoration,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              color: color,
              height: height),
    );
  }
}
