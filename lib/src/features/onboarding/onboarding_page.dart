import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mono/src/components/button_primary.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/image.dart';
import 'package:mono/src/constants/routes.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      body: Stack(
        children: [
          Image.asset(
            AppImage.kBackground,
            width: MediaQuery.sizeOf(context).width,
            alignment: Alignment.topCenter,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s28,
              vertical: AppSize.s48,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Image.asset(
                    AppImage.kCharacter,
                    alignment: Alignment.center,
                  ),
                ),
                AutoSizeText(
                  'Spend Smarter Save More',
                  maxFontSize: AppSize.s36,
                  minFontSize: AppSize.s24,
                  style: AppTypography.kDisplay.copyWith(
                    color: AppColor.kPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.s24),
                CustomButtonPrimary(
                  text: 'Get Started',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.signup,
                    );
                  },
                ),
                const SizedBox(height: AppSize.s20),
                RichText(
                  text: TextSpan(
                    text: 'Already have account? ',
                    style: AppTypography.kBody,
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.signin,
                            );
                          },
                        style: AppTypography.kLink.copyWith(
                          color: AppColor.kPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
