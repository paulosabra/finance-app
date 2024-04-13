import 'package:flutter/material.dart';
import 'package:mono/src/features/onboarding/onboarding_page.dart';
import 'package:mono/src/features/sign_in/sign_in_page.dart';
import 'package:mono/src/features/sign_up/sign_up_page.dart';
import 'package:mono/src/features/splash/splash_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String initial = '/';
  static const String splash = 'splash';
  static const String onboarding = 'onboarding';
  static const String signup = 'signup';
  static const String signin = 'signin';

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.splash: (context) => const SplashPage(),
    AppRoutes.onboarding: (context) => const OnboardingPage(),
    AppRoutes.signup: (context) => const SignUpPage(),
    AppRoutes.signin: (context) => const SignInPage(),
  };
}
