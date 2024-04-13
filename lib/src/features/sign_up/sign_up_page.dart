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
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
        showErrorDialog(context);
      }

      if (_controller.state is SignUpSuccessState) {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Scaffold(
                body: Center(
                  child: Text('SUCCESS'),
                ),
              );
            },
          ),
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
                      'Start Saving Your Money!',
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
                            labelText: 'Your Name',
                            helperText:
                                'Must have at least first and last name.',
                            editingController: _nameController,
                            inputFormatters: [
                              UpperCaseInputFormatter(),
                            ],
                            validator: Validator.validateName,
                          ),
                          const SizedBox(height: AppSize.s20),
                          CustomTextInput(
                            labelText: 'Your Email',
                            editingController: _emailController,
                            inputType: TextInputType.emailAddress,
                            validator: Validator.validateEmail,
                          ),
                          const SizedBox(height: AppSize.s20),
                          CustomPasswordInput(
                            labelText: 'Choose Your Password',
                            helperText:
                                'Must have at least 8 characters, 1 capital letter and 1 number.',
                            editingController: _passwordController,
                            validator: Validator.validatePassword,
                          ),
                          const SizedBox(height: AppSize.s20),
                          CustomPasswordInput(
                            labelText: 'Confirm Your Password',
                            validator: (value) {
                              return Validator.validateConfirmPassword(
                                _passwordController.text,
                                value,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSize.s48),
                    CustomButtonPrimary(
                      text: 'Sign Up',
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
        ),
      ),
    );
  }
}
