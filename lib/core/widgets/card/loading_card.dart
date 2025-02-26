import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../style/app_colors.dart';

class LoadingCard extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? cardColor;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? child;
  final BoxShape shape;

  const LoadingCard(
      {Key? key,
      this.height = 24,
      this.width,
      this.cardColor,
      this.baseShimmerColor,
      this.highlightShimmerColor,
      this.borderRadius,
      this.child,
      this.shape = BoxShape.rectangle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseShimmerColor ?? AppColors.baserColor,
      highlightColor: highlightShimmerColor ?? AppColors.shimmerColor,
      child: Container(
        height: height,
        width: width ?? 40,
        decoration: BoxDecoration(
            borderRadius: shape == BoxShape.circle
                ? null
                : (borderRadius ?? BorderRadius.circular(2)),
            shape: shape,
            color: cardColor ?? AppColors.baserColor),
        child: child,
      ),
    );
  }
}
