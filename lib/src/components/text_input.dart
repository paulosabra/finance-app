import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mono/src/constants/color.dart';
import 'package:mono/src/constants/size.dart';
import 'package:mono/src/constants/typography.dart';

class CustomTextInput extends StatefulWidget {
  final String labelText;
  final String? hintText;
  final String? helperText;
  final String? errorText;
  final TextEditingController? editingController;
  final TextInputAction? inputAction;
  final TextInputType? inputType;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;

  const CustomTextInput({
    super.key,
    required this.labelText,
    this.hintText,
    this.helperText,
    this.errorText,
    this.editingController,
    this.inputAction,
    this.inputType,
    this.inputFormatters,
    this.validator,
  });

  @override
  State<CustomTextInput> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  bool hasFocus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText.toUpperCase(),
          style: hasFocus
              ? AppTypography.kLabelFocus.copyWith(color: AppColor.kPrimary)
              : AppTypography.kLabel.copyWith(color: AppColor.kTextSecondary),
        ),
        const SizedBox(height: AppSize.s12),
        Focus(
          onFocusChange: (value) {
            setState(() {
              hasFocus = value;
            });
          },
          child: TextFormField(
            controller: widget.editingController,
            textInputAction: widget.inputAction,
            keyboardType: widget.inputType,
            inputFormatters: widget.inputFormatters,
            validator: widget.validator,
            decoration: InputDecoration(
              hintText: widget.hintText,
              helperText: widget.helperText,
              helperMaxLines: 2,
              errorText: widget.errorText,
              errorMaxLines: 2,
            ),
            style: hasFocus
                ? AppTypography.kInputFocus.copyWith(color: AppColor.kPrimary)
                : AppTypography.kInput.copyWith(color: AppColor.kTextSecondary),
          ),
        ),
      ],
    );
  }
}
