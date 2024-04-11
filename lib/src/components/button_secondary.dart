import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class CustomButtonSecondary extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButtonSecondary({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColor.kPrimary,
              side: const BorderSide(color: AppColor.kPrimary),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSize.s40),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSize.s12),
              child: Text(
                text,
                style: AppTypography.kButton.copyWith(
                  color: AppColor.kPrimary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
