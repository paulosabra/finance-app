import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/icons.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/date_time_extensions.dart';
import 'package:mono/src/core/extensions/num_extensions.dart';

class TransactionsListTile extends StatelessWidget {
  const TransactionsListTile({
    required this.location,
    required this.date,
    required this.value,
    super.key,
  });

  final String? location;
  final DateTime? date;
  final double? value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        decoration: BoxDecoration(
          color: AppColor.kBorder.withOpacity(0.2),
          borderRadius: BorderRadius.circular(AppSize.s8),
        ),
        padding: const EdgeInsets.all(AppSize.s8),
        child: SvgPicture.asset(AppIcons.kLocation),
      ),
      title: Text(
        location ?? '-',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTypography.kText.copyWith(
          color: AppColor.kTextHighlight,
        ),
      ),
      subtitle: Text(
        date?.formatDateTime() ?? '-',
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppTypography.kLabel.copyWith(
          color: AppColor.kTextSecondary,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Text(
        value?.formatCurrency() ?? '-',
        style: AppTypography.kSubtitle.copyWith(
          color: value!.isNegative ? AppColor.kError : AppColor.kSuccess,
        ),
      ),
    );
  }
}
