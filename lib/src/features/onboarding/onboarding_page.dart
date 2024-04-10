import 'package:flutter/material.dart';
import 'package:mono/src/components/button_primary.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/image.dart';
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
            padding: const EdgeInsets.only(
              bottom: AppSize.s48,
              left: AppSize.s28,
              right: AppSize.s28,
              top: AppSize.s48,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AppImage.kCharacter,
                  alignment: Alignment.center,
                  height: MediaQuery.sizeOf(context).height * 0.5,
                ),
                Text(
                  'Spend Smarter\nSave More',
                  style: AppTypography.kDisplay.copyWith(
                    color: AppColor.kPrimary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSize.s24),
                CustomButtonPrimary(
                  text: 'Get Started',
                  onPressed: () {},
                ),
                const SizedBox(height: AppSize.s20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have account? ',
                      style: AppTypography.kBody,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Log In',
                        style: AppTypography.kBody.copyWith(
                          color: AppColor.kPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
