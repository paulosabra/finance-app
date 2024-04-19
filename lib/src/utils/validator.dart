import 'package:flutter/material.dart';
import 'package:mono/src/core/extensions/localization_extensions.dart';

class Validator {
  Validator._();

  static String? validateName(
    BuildContext context, {
    String? value,
  }) {
    final condition = RegExp(
      r"^(?:[\u00c0-\u01ffa-zA-Z'-]){2,}(?:\s[\u00c0-\u01ffa-zA-Z'-]{2,})+$",
    );
    if (value != null && value.isEmpty) {
      return context.locales.nameEmptyError;
    }

    if (value != null && !condition.hasMatch(value)) {
      return context.locales.nameInvalidError;
    }

    return null;
  }

  static String? validateEmail(
    BuildContext context, {
    String? value,
  }) {
    final condition = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    );
    if (value != null && value.isEmpty) {
      return context.locales.emailEmptyError;
    }

    if (value != null && !condition.hasMatch(value)) {
      return context.locales.emailInvalidError;
    }
    return null;
  }

  static String? validatePassword(
    BuildContext context, {
    String? value,
  }) {
    final condition =
        RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
    if (value != null && value.isEmpty) {
      return context.locales.passwordEmptyError;
    }

    if (value != null && !condition.hasMatch(value)) {
      return context.locales.passwordInvalidError;
    }
    return null;
  }

  static String? validateConfirmPassword(
    BuildContext context, {
    String? passwordValue,
    String? confirmPasswordValue,
  }) {
    if (confirmPasswordValue != null && confirmPasswordValue.isEmpty) {
      return context.locales.confirmPasswordEmptyError;
    }
    if (confirmPasswordValue != passwordValue) {
      return context.locales.confirmPasswordInvalidError;
    }

    return null;
  }
}
