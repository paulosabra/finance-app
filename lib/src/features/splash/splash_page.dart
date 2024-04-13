import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/routes.dart';
import 'package:mono/src/constants/typography.dart';
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
    _controller.isUserLogged();
    _controller.addListener(() {
      if (_controller.state is SplashSuccessState) {
        Navigator.pushNamed(
          context,
          AppRoutes.signin,
        );
      } else {
        Navigator.pushNamed(
          context,
          AppRoutes.onboarding,
        );
      }
    });
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
