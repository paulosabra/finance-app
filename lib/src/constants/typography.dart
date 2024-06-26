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

  static TextStyle kDisplay = _baseFontStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w700,
  );

  static TextStyle kTitle = _baseFontStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static TextStyle kSubtitle = _baseFontStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle kText = _baseFontStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static TextStyle kBody = _baseFontStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  static TextStyle kButton = _baseFontStyle.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static TextStyle kLink = _baseFontStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle kLabel = _baseFontStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle kLabelFocus = _baseFontStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static TextStyle kInput = _baseFontStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static TextStyle kInputFocus = _baseFontStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  // Specific Typography
  static TextStyle kSplashPageTitle = _baseFontStyle.copyWith(
    fontSize: 48,
    fontWeight: FontWeight.w700,
  );
}
