import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';

class AppTypography {
  AppTypography._();

  static const _fontFamily = 'Inter';

  static const _baseFontStyle = TextStyle(
    color: AppColor.kTextPrimary,
    fontFamily: _fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 16,
  );

  static TextStyle kSplashPageTitle = _baseFontStyle.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w700,
  );
}
