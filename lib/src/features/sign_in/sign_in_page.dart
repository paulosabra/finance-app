import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mono/src/components/button_primary.dart';
import 'package:mono/src/components/error_dialog.dart';
import 'package:mono/src/components/loader.dart';
import 'package:mono/src/components/password_input.dart';
import 'package:mono/src/components/text_input.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/image.dart';
import 'package:mono/src/constants/routes.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';
import 'package:mono/src/features/sign_in/sign_in_controller.dart';
import 'package:mono/src/features/sign_in/sign_in_state.dart';
import 'package:mono/src/locator.dart';
import 'package:mono/src/utils/validator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _controller = getIt.get<SignInController>();

  final GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignInLoadingState) {
        showLoader(context);
      }

      if (_controller.state is SignInErrorState) {
        Navigator.pop(context);
        showErrorDialog(
          context,
          message: (_controller.state as SignInErrorState).message,
        );
      }

      if (_controller.state is SignInSuccessState) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.initial,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      body: Stack(
        children: [
          Image.asset(
            AppImage.kBackground,
            alignment: Alignment.topCenter,
          ),
          SafeArea(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(AppSize.s28),
              child: Column(
                children: [
                  AutoSizeText(
                    context.locales.signInTitle,
                    maxFontSize: AppSize.s36,
                    minFontSize: AppSize.s24,
                    style: AppTypography.kDisplay.copyWith(
                      color: AppColor.kPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSize.s48),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextInput(
                          labelText: context.locales.emailLabel,
                          editingController: _emailController,
                          inputType: TextInputType.emailAddress,
                          validator: (value) => Validator.validateEmail(
                            context,
                            value: value,
                          ),
                        ),
                        const SizedBox(height: AppSize.s20),
                        CustomPasswordInput(
                          labelText: context.locales.passwordLabel,
                          editingController: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomButtonPrimary(
                    text: context.locales.signInButton,
                    onPressed: () {
                      final isValid = _formKey.currentState?.validate();
                      if (isValid != null && isValid) {
                        _controller.signIn(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: AppSize.s20),
                  RichText(
                    text: TextSpan(
                      text: context.locales.haveNoAccountMessage,
                      style: AppTypography.kLink.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: context.locales.signUpButton,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.signup,
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
          ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
