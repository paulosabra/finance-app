import 'package:flutter/material.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  inputDecorationTheme: _inputDecorationTheme(),
);

InputDecorationTheme _inputDecorationTheme() {
  return InputDecorationTheme(
    hintStyle: AppTypography.kLabel.copyWith(
      color: AppColor.kTextSecondary,
    ),
    helperStyle: AppTypography.kLabel.copyWith(
      color: AppColor.kPrimaryLight,
    ),
    errorStyle: AppTypography.kLabel.copyWith(
      color: AppColor.kError,
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: AppSize.s20,
      vertical: AppSize.s16,
    ),
    border: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColor.kBorder,
      ),
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColor.kPrimary,
        width: 1.4,
      ),
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColor.kError,
        width: 1.4,
      ),
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColor.kPrimary,
        width: 1.4,
      ),
      borderRadius: BorderRadius.circular(AppSize.s8),
    ),
  );
}
