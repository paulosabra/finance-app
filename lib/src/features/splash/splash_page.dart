import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/routes.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';
import 'package:mono/src/features/splash/splash_controller.dart';
import 'package:mono/src/features/splash/splash_state.dart';
import 'package:mono/src/locator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _controller = getIt.get<SplashController>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller
      ..isUserLogged()
      ..addListener(() {
        if (_controller.state is NavigateToSignInState) {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.signin,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            AppRoutes.onboarding,
          );
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: AppColor.kSplashGradient,
        ),
        child: Text(
          context.locales.appTitle,
          style: AppTypography.kSplashPageTitle.copyWith(
            color: AppColor.kWhite,
          ),
        ),
      ),
    );
  }
}
