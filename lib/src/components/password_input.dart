import 'package:flutter/material.dart';
import 'package:mono/src/components/text_input.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';

class CustomPasswordInput extends StatefulWidget {
  const CustomPasswordInput({
    required this.labelText,
    super.key,
    this.hintText,
    this.helperText,
    this.errorText,
    this.editingController,
    this.validator,
  });
  final String labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? editingController;
  final FormFieldValidator<String>? validator;

  @override
  State<CustomPasswordInput> createState() => _CustomPasswordInputState();
}

class _CustomPasswordInputState extends State<CustomPasswordInput> {
  bool hasFocus = false;
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {
        setState(() {
          hasFocus = value;
        });
      },
      child: CustomTextInput(
        labelText: widget.labelText,
        hintText: widget.hintText,
        helperText: widget.helperText,
        errorText: widget.errorText,
        editingController: widget.editingController,
        validator: widget.validator,
        obscureText: isHidden,
        suffixIcon: InkWell(
          borderRadius: BorderRadius.circular(AppSize.s8),
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child: Icon(
            isHidden ? Icons.visibility : Icons.visibility_off,
            color: hasFocus ? AppColor.kPrimary : AppColor.kTextSecondary,
          ),
        ),
      ),
    );
  }
}
