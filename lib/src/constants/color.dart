import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color kPrimaryLight = Color(0xff63B5AF);
  static const Color kPrimary = Color(0xff438883);
  static const Color kPrimaryDark = Color(0xff2F7E79);
  static const Color kWhite = Color(0xffFFFFFF);
  static const Color kTextPrimary = Color(0xff444444);
  static const Color kTextSecondary = Color(0xff666666);
  static const Color kBorder = Color(0xffDDDDDD);

  static const Color kSuccess = Color(0xff25A969);
  static const Color kError = Color(0xffF95B51);

  static const LinearGradient kSplashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColor.kPrimaryLight,
      AppColor.kPrimary,
    ],
  );

  static const LinearGradient kButtonPrimaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColor.kPrimaryLight,
      AppColor.kPrimaryDark,
    ],
  );
}
