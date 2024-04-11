import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mono/src/components/button_primary.dart';
import 'package:mono/src/components/password_input.dart';
import 'package:mono/src/components/text_input.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/image.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              AppImage.kBackground,
              width: MediaQuery.sizeOf(context).width,
              alignment: Alignment.topCenter,
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.s28,
                  vertical: AppSize.s48,
                ),
                child: Column(
                  children: [
                    AutoSizeText(
                      'Start Saving Your Money!',
                      maxFontSize: AppSize.s36,
                      minFontSize: AppSize.s24,
                      style: AppTypography.kDisplay.copyWith(
                        color: AppColor.kPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: AppSize.s48),
                    const CustomTextInput(
                      labelText: 'Your Name',
                    ),
                    const SizedBox(height: AppSize.s24),
                    const CustomTextInput(
                      labelText: 'Your Email',
                    ),
                    const SizedBox(height: AppSize.s24),
                    const CustomPasswordInput(
                      labelText: 'Choose Your Password',
                      helperText:
                          'Must have at least 8 characters, 1 capital letter and 1 number.',
                    ),
                    const SizedBox(height: AppSize.s24),
                    const CustomPasswordInput(
                      labelText: 'Confirm Your Password',
                    ),
                    const SizedBox(height: AppSize.s48),
                    CustomButtonPrimary(
                      text: 'Sign Up',
                      onPressed: () {},
                    ),
                    const SizedBox(height: AppSize.s20),
                    RichText(
                      text: TextSpan(
                        text: 'Already have account? ',
                        style: AppTypography.kBody,
                        children: [
                          TextSpan(
                            text: 'Sign In',
                            recognizer: TapGestureRecognizer()..onTap = () {},
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
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
