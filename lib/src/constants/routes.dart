import 'package:flutter/material.dart';
import 'package:mono/src/features/home/home_page.dart';
import 'package:mono/src/features/onboarding/onboarding_page.dart';
import 'package:mono/src/features/profile/profile_page.dart';
import 'package:mono/src/features/sign_in/sign_in_page.dart';
import 'package:mono/src/features/sign_up/sign_up_page.dart';
import 'package:mono/src/features/splash/splash_page.dart';
import 'package:mono/src/features/statistics/statistics_page.dart';
import 'package:mono/src/features/wallet/wallet_page.dart';

class AppRoutes {
  AppRoutes._();

  static const String initial = '/';
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String signup = '/signup';
  static const String signin = '/signin';
  static const String statistics = '/statistics';
  static const String wallet = '/wallet';
  static const String profile = '/profile';

  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.splash: (context) => const SplashPage(),
    AppRoutes.onboarding: (context) => const OnboardingPage(),
    AppRoutes.signup: (context) => const SignUpPage(),
    AppRoutes.signin: (context) => const SignInPage(),
    AppRoutes.initial: (context) => const HomePage(),
    AppRoutes.statistics: (context) => const StatisticsPage(),
    AppRoutes.wallet: (context) => const WalletPage(),
    AppRoutes.profile: (context) => const ProfilePage(),
  };
}
