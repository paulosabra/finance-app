import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/num_extensions.dart';
import 'package:mono/src/features/home/widgets/balance_item.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.kPrimaryDark,
        borderRadius: BorderRadius.circular(AppSize.s20),
      ),
      margin: const EdgeInsets.symmetric(
        vertical: AppSize.s32,
        horizontal: AppSize.s20,
      ),
      padding: const EdgeInsets.only(
        bottom: AppSize.s32,
        left: AppSize.s20,
        right: AppSize.s20,
        top: AppSize.s20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Balance',
                style: AppTypography.kText.copyWith(
                  color: AppColor.kWhite,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                2548.00.formatCurrency() ?? '-',
                style: AppTypography.kDisplay.copyWith(
                  color: AppColor.kWhite,
                  fontSize: AppSize.s28,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSize.s32),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BalanceItem.income(value: 1840),
              BalanceItem.expenses(value: 284),
            ],
          ),
        ],
      ),
    );
  }
}
