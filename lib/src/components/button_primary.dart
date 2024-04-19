import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class CustomButtonPrimary extends StatelessWidget {

  const CustomButtonPrimary({
    required this.text, required this.onPressed, super.key,
  });
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: AppSize.s68,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppSize.s40),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.kPrimaryDark.withOpacity(0.7),
              offset: const Offset(0, 10),
              blurRadius: 15,
            ),
          ],
          gradient: AppColor.kButtonPrimaryGradient,
        ),
        child: Text(
          text,
          style: AppTypography.kButton.copyWith(
            color: AppColor.kWhite,
          ),
        ),
      ),
    );
  }
}
