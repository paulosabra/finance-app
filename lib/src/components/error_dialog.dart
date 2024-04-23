import 'package:flutter/material.dart';
import 'package:mono/src/components/button_secondary.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';

class CustomErrorDialog extends StatelessWidget {
  const CustomErrorDialog({
    super.key,
    this.message,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s32,
        vertical: AppSize.s48,
      ),
      decoration: const BoxDecoration(
        color: AppColor.kWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppSize.s32),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message ?? context.locales.genericErrorMessage,
            style: AppTypography.kTitle.copyWith(
              color: AppColor.kPrimary,
            ),
          ),
          const SizedBox(height: AppSize.s40),
          CustomButtonSecondary(
            text: 'Try Again',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

Future<void> showErrorDialog(
  BuildContext context, {
  String? message,
}) {
  return showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return CustomErrorDialog(
        message: message,
      );
    },
  );
}
