import 'package:flutter/material.dart';

import '../../functions/random_func.dart';
import 'loading_card.dart';

class LoadingMultipleLineCard extends StatelessWidget {
  final int countLoadingCardRow;
  final Color? cardColor;
  final Color? baseShimmerColor;
  final Color? highlightShimmerColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? shimmerChild;
  final BoxShape? loadingCardShape;

  final double? heightCard;
  final double? widthCard;
  final bool isRandomWidth;

  const LoadingMultipleLineCard({
    super.key,
    this.countLoadingCardRow = 4,
    this.cardColor,
    this.baseShimmerColor,
    this.highlightShimmerColor,
    this.borderRadius,
    this.shimmerChild,
    this.loadingCardShape,
    this.heightCard,
    this.widthCard,
    this.isRandomWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
            countLoadingCardRow,
            (index) => Builder(
                  builder: (context) {
                    return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: LoadingCard(
                            height: heightCard ?? 20,
                            width: isRandomWidth
                                ? (widthCard ?? 250) -
                                    (RandomFunc.generateRandomNumber(10, 100))
                                : widthCard ?? 250,
                            cardColor: cardColor,
                            borderRadius: borderRadius,
                            shape: loadingCardShape ?? BoxShape.rectangle,
                            highlightShimmerColor: highlightShimmerColor,
                            baseShimmerColor: baseShimmerColor,
                            child: shimmerChild));
                  },
                )));
  }
}
