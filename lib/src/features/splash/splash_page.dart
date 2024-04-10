import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/typography.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: AppColor.kSplashGradient,
        ),
        child: Text(
          'mono',
          style: AppTypography.kSplashPageTitle.copyWith(
            color: AppColor.kWhite,
          ),
        ),
      ),
    );
  }
}
