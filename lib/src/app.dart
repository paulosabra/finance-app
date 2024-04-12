import 'package:flutter/material.dart';
import 'package:mono/src/constants/routes.dart';
import 'package:mono/src/constants/theme.dart';
import 'package:mono/src/features/onboarding/onboarding_page.dart';
import 'package:mono/src/features/sign_up/sign_up_page.dart';
import 'package:mono/src/features/splash/splash_page.dart';

class MonoApp extends StatelessWidget {
  const MonoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      routes: routes,
      theme: appTheme,
    );
  }

  Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.splash: (context) => const SplashPage(),
      AppRoutes.onboarding: (context) => const OnboardingPage(),
      AppRoutes.signup: (context) => const SignUpPage(),
    };
  }
}
