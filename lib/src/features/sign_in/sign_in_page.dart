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
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
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
                    'Welcome Back!',
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
                          labelText: 'Your Email',
                          editingController: _emailController,
                          inputType: TextInputType.emailAddress,
                          validator: Validator.validateEmail,
                        ),
                        const SizedBox(height: AppSize.s20),
                        CustomPasswordInput(
                          labelText: 'Your Password',
                          editingController: _passwordController,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  CustomButtonPrimary(
                    text: 'Sign In',
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
                      text: 'Don’t have Account? ',
                      style: AppTypography.kBody,
                      children: [
                        TextSpan(
                          text: 'Sign Up',
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
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
