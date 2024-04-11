import 'package:flutter/material.dart';
import 'package:mono/src/constants/theme.dart';
import 'package:mono/src/features/onboarding/onboarding_page.dart';

class MonoApp extends StatelessWidget {
  const MonoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const OnboardingPage(),
    );
  }
}
