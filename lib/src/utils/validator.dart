class Validator {
  Validator._();

  static String? validateName(String? value) {
    final condition = RegExp(
      r"^(?:[\u00c0-\u01ffa-zA-Z'-]){2,}(?:\s[\u00c0-\u01ffa-zA-Z'-]{2,})+$",
    );
    if (value != null && value.isEmpty) {
      return 'Please enter your name';
    }

    if (value != null && !condition.hasMatch(value)) {
      return 'Invalid name! Must have at least your first and last name.';
    }

    return null;
  }

  static String? validateEmail(String? value) {
    final condition = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
    );
    if (value != null && value.isEmpty) {
      return 'Please enter your email';
    }

    if (value != null && !condition.hasMatch(value)) {
      return 'Invalid email! Enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    final condition =
        RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
    if (value != null && value.isEmpty) {
      return 'Please enter your password';
    }

    if (value != null && !condition.hasMatch(value)) {
      return 'Invalid password! Must have at least 8 characters, 1 capital letter and 1 number.';
    }
    return null;
  }

  static String? validateConfirmPassword(
    String? passwordValue,
    String? confirmPasswordValue,
  ) {
    if (confirmPasswordValue != null && confirmPasswordValue.isEmpty) {
      return 'Please re-enter your password';
    }
    if (confirmPasswordValue != passwordValue) {
      return 'Passwords do not match. Please retype.';
    }

    return null;
  }
}
