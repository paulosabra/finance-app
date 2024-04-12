import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/routes.dart';
import 'package:mono/src/constants/typography.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    initTimer();
  }

  Timer initTimer() {
    return Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.onboarding,
        );
      },
    );
  }

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
