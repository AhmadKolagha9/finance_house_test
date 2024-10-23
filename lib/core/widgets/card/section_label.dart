import 'package:finance_house_test/core/style/app_colors.dart';
import 'package:finance_house_test/core/widgets/text/base_text.dart';
import 'package:flutter/material.dart';

class SectionLabel extends StatelessWidget {

  final String title;
  final VoidCallback viewAllFunc;

  const SectionLabel(
      {super.key, required this.title, required this.viewAllFunc});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BaseText(title:title,
            textStyle:  Theme.of(context)
            .textTheme
            .bodySmall),

        BaseText(title:title,
            textStyle:  Theme.of(context)
                .textTheme
                .labelLarge!.copyWith(color: AppColors.secondColor)),
      ],
    );
  }
}
