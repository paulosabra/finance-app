import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/icons.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class BalanceItem extends StatelessWidget {
  const BalanceItem.income({
    required this.value,
    this.icon = AppIcons.kIncome,
    this.label = 'Income',
    super.key,
  });

  const BalanceItem.expenses({
    required this.value,
    this.icon = AppIcons.kExpenses,
    this.label = 'Expenses',
    super.key,
  });

  final String icon;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: AppSize.s4),
            Text(
              label,
              style: AppTypography.kText.copyWith(
                color: AppColor.kPrimaryLight,
              ),
            ),
          ],
        ),
        Text(
          value ?? '-',
          style: AppTypography.kSubtitle.copyWith(
            color: AppColor.kWhite,
          ),
        ),
      ],
    );
  }
}
