import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mono/src/components/button_primary.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/image.dart';
import 'package:mono/src/constants/routes.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';

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
                  ),
                ),
                AutoSizeText(
                  context.locales.onboardingTitle,
                  maxFontSize: AppSize.s36,
                  minFontSize: AppSize.s24,
                  style: AppTypography.kDisplay.copyWith(
                    color: AppColor.kPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.s24),
                CustomButtonPrimary(
                  text: context.locales.onboardingButton,
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
                    text: context.locales.haveAccountMessage,
                    style: AppTypography.kLink.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: context.locales.signInButton,
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
