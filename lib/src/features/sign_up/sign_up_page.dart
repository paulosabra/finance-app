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
import 'package:mono/src/features/sign_up/sign_up_controller.dart';
import 'package:mono/src/features/sign_up/sign_up_state.dart';
import 'package:mono/src/locator.dart';
import 'package:mono/src/utils/upper_case_input_formatter.dart';
import 'package:mono/src/utils/validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _controller = getIt.get<SignUpController>();

  final GlobalKey<FormState> _formKey = GlobalKey();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showLoader(context);
      }

      if (_controller.state is SignUpErrorState) {
        Navigator.pop(context);
        showErrorDialog(
          context,
          message: (_controller.state as SignUpErrorState).message,
        );
      }

      if (_controller.state is SignUpSuccessState) {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(
          context,
          AppRoutes.signin,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                AppImage.kBackground,
                alignment: Alignment.topCenter,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(AppSize.s28),
                child: Column(
                  children: [
                    AutoSizeText(
                      context.locales.signUpTitle,
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
                            labelText: context.locales.nameLabel,
                            helperText: context.locales.nameHelper,
                            editingController: _nameController,
                            inputFormatters: [
                              UpperCaseInputFormatter(),
                            ],
                            validator: (value) => Validator.validateName(
                              context,
                              value: value,
                            ),
                          ),
                          const SizedBox(height: AppSize.s20),
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
                            helperText: context.locales.passwordHelper,
                            editingController: _passwordController,
                            validator: (value) => Validator.validatePassword(
                              context,
                              value: value,
                            ),
                          ),
                          const SizedBox(height: AppSize.s20),
                          CustomPasswordInput(
                            labelText: context.locales.confirmPasswordLabel,
                            validator: (value) {
                              return Validator.validateConfirmPassword(
                                context,
                                passwordValue: _passwordController.text,
                                confirmPasswordValue: value,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.s48),
                    CustomButtonPrimary(
                      text: context.locales.signUpButton,
                      onPressed: () {
                        final isValid = _formKey.currentState?.validate();
                        if (isValid != null && isValid) {
                          _controller.signUp(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        }
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
        ),
      ),
    );
  }
}
