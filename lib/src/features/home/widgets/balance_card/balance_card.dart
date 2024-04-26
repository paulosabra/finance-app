import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';
import 'package:mono/src/core/extensions/num_extensions.dart';
import 'package:mono/src/features/home/widgets/balance_card/balance_card_controller.dart';
import 'package:mono/src/features/home/widgets/balance_card/balance_card_state.dart';
import 'package:mono/src/features/home/widgets/balance_item.dart';
import 'package:shimmer/shimmer.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    required this.controller,
    super.key,
  });
  final BalanceCardController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, state) {
        if (controller.state is BalanceCardLoadingState) {
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
            child: Shimmer.fromColors(
              baseColor: AppColor.kWhite,
              highlightColor: AppColor.kPrimaryLight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.locales.totalBalanceLabel,
                        style: AppTypography.kText.copyWith(
                          color: AppColor.kWhite,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        0.formatCurrency() ?? '',
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
                      BalanceItem.income(value: 0),
                      BalanceItem.expenses(value: 0),
                    ],
                  ),
                ],
              ),
            ),
          );
        }

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
                    context.locales.totalBalanceLabel,
                    style: AppTypography.kText.copyWith(
                      color: AppColor.kWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    controller.balance?.totalBalance.formatCurrency() ?? '-',
                    style: AppTypography.kDisplay.copyWith(
                      color: AppColor.kWhite,
                      fontSize: AppSize.s28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSize.s32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BalanceItem.income(
                    value: controller.balance?.income,
                  ),
                  BalanceItem.expenses(
                    value: controller.balance?.expenses,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
