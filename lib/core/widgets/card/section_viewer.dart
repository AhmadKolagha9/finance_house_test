import 'package:finance_house_test/core/widgets/card/loading_card.dart';
import 'package:finance_house_test/core/widgets/card/section_label.dart';
import 'package:flutter/material.dart';

class SectionViewer extends StatelessWidget {
  final String title;
  final VoidCallback viewAllFunc;
  final int itemCount;
  final int itemCountShimmer;
  final NullableIndexedWidgetBuilder itemBuilder;
  final NullableIndexedWidgetBuilder? itemBuilderShimmer;
  final Widget? itemShimmer;
  final ScrollController controller;
  final ScrollPhysics? physics;
  final double? height;
  final bool isLoading;

  const SectionViewer(
      {super.key,
      required this.title,
      required this.viewAllFunc,
      this.itemCountShimmer = 3,
      this.isLoading = false,
      required this.itemCount,
      required this.itemBuilder,
      this.itemBuilderShimmer,
      required this.controller,
      this.physics,
      this.height,
      this.itemShimmer});

  @override
  Widget build(BuildContext context) {
    if (itemCount == 0 && !isLoading) {
      return const SizedBox();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SectionLabel(title: title, viewAllFunc: !isLoading? viewAllFunc: (){}),
        const SizedBox(height: 14),
        if (isLoading) ...[
          SizedBox(
            height: height ?? 300,
            child: ListView.builder(
              itemBuilder: itemBuilderShimmer ??
                  (context, index) =>
                      itemShimmer ?? LoadingCard(height: 250, width: 150),
              itemCount: itemCountShimmer,
              shrinkWrap: true,
              physics: physics,
              scrollDirection: Axis.horizontal,
            ),
          )
        ] else
          ...[
            SizedBox(
              height: height ?? 300,
              child: ListView.builder(
                itemBuilder: itemBuilder,
                itemCount: itemCount,
                shrinkWrap: true,
                controller: controller,
                physics: physics,
                scrollDirection: Axis.horizontal,
              ),
            )
          ]
      ],
    );
  }
}
