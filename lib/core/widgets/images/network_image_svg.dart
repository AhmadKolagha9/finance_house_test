import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../res.dart';
import 'general_image_assets.dart';

class NetworkImageSvg extends StatelessWidget {
  static Widget fallbackFlagV2 = const GeneralImageAssets(path: Res.brokenImage);
  static Widget loadingDefault = Shimmer.fromColors(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    child: const Icon(Icons.timer),
  );

  final Widget? failWidget;
  final bool matchTextDirection;
  final String url;
  final BoxFit boxFit;
  final double? height;
  final double? width;
  final Widget? placeHolderWhileLoading;
  final Color? color;

  //when app can't ,load image
  Widget errorBuilder(
      BuildContext context, Object exception, StackTrace? stackTrace) {
    return failWidget ?? fallbackFlagV2;
  }

  //while app load the image
  Widget loadingBuilder(BuildContext context) {
    return Center(child: placeHolderWhileLoading ?? loadingDefault);
  }

  const NetworkImageSvg({
    super.key,
    required this.url,
    this.failWidget,
    this.height = 50,
    this.width = 50,
    this.matchTextDirection = true,
    this.boxFit = BoxFit.cover,
    this.placeHolderWhileLoading,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.network(
      url,
      colorFilter:
      color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      height: height,
      width: width,
      fit: boxFit,
      matchTextDirection: matchTextDirection,
      placeholderBuilder: loadingBuilder,
    );
  }
}
