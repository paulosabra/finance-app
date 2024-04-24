import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';

class SubtitleItem extends StatelessWidget {
  const SubtitleItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.locales.transactionsTitle,
          style: AppTypography.kSubtitle.copyWith(
            color: AppColor.kTextHighlight,
          ),
        ),
        Text(
          context.locales.seeAllButton,
          style: AppTypography.kLink.copyWith(
            color: AppColor.kTextSecondary,
          ),
        ),
      ],
    );
  }
}
